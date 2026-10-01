import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// オンラインランキング（Firestore）サービス。
///
/// # 想定するFirestoreセキュリティルール（コード管理外・Firebase Console側で設定）
/// ```
/// rules_version = '2';
/// service cloud.firestore {
///   match /databases/{database}/documents {
///     // グローバルランキング: 認証済みユーザーは自分のuidのドキュメントのみ
///     // 作成・更新可能。読み取りは誰でも可能（ランキング一覧表示用）。
///     match /rankings/{uid} {
///       allow read: if true;
///       allow write: if request.auth != null && request.auth.uid == uid;
///     }
///     // 都道府県別ランキング: サブコレクションでuid配下に保存。
///     // 読み取りは誰でも可能、書き込みは本人のみ。
///     match /prefecture_rankings/{prefectureCode}/entries/{uid} {
///       allow read: if true;
///       allow write: if request.auth != null && request.auth.uid == uid;
///     }
///   }
/// }
/// ```
///
/// 認証について: このアプリのログイン(`lib/providers/auth_provider.dart`)は
/// 端末内だけのローカル疑似認証（`User.uid` は `local_xxx`）で、Firebase Auth は使わない。
/// 一方 Firestore ルールは `request.auth.uid == uid` を要求するため、ランキングへ
/// 書き込む際は **Firebase 匿名認証**でサインインし、その `uid` をドキュメントIDに使う
/// （[_ensureUid]）。呼び出し側が渡す `uid`（ローカルID）は使用しない。
/// 匿名認証は Firebase コンソールで有効化されている必要がある。無効のときは
/// 例外を握りつぶし、ゲーム進行には影響させない（ランキングに載らないだけ）。
class RankingService {
  RankingService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  /// Firestore ルールを満たす（`request.auth.uid == uid`）ための匿名サインイン。
  /// すでにサインイン済みならその uid を返し、失敗したら null を返す。
  Future<String?> _ensureUid() async {
    try {
      final auth = FirebaseAuth.instance;
      final current = auth.currentUser;
      if (current != null) return current.uid;
      final cred = await auth.signInAnonymously();
      return cred.user?.uid;
    } catch (e) {
      // ignore: avoid_print
      print('RankingService._ensureUid failed: $e');
      return null;
    }
  }

  CollectionReference<Map<String, dynamic>> get _globalRankingRef =>
      _firestore.collection('rankings');

  CollectionReference<Map<String, dynamic>> _prefectureRankingRef(
    String prefectureCode,
  ) =>
      _firestore
          .collection('prefecture_rankings')
          .doc(prefectureCode)
          .collection('entries');

  /// グローバルランキングへスコアを送信する。
  ///
  /// 既存のベストスコアより高い場合のみ更新する（低いスコアで上書きしない）。
  /// オフライン・通信エラー時は例外を握りつぶし、呼び出し元（ゲームプレイ）に
  /// 影響を与えないようにする。
  Future<void> submitGlobalScore({
    required String uid,
    required String nickname,
    required int score,
    required int clearedPrefectures,
  }) async {
    try {
      final authUid = await _ensureUid();
      if (authUid == null) return;
      final docRef = _globalRankingRef.doc(authUid);
      // 自分のドキュメントだけを更新するため競合は起きない。runTransaction は
      // 実機で「transaction object cannot be used after its update callback」の
      // ネイティブAssertionでアプリごと落ちたため使わず、読んでから書く。
      final snapshot = await docRef.get();
      final currentBest = (snapshot.data()?['score'] as num?)?.toInt() ?? 0;
      if (score < currentBest) {
        // ベストスコアを下回る場合は上書きしない。
        return;
      }
      await docRef.set({
        'nickname': nickname,
        'score': score,
        'clearedPrefectures': clearedPrefectures,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      // オフライン・権限エラー等はゲーム進行に影響させず握りつぶす。
      // ignore: avoid_print
      print('RankingService.submitGlobalScore failed: $e');
    }
  }

  /// 都道府県別ランキングへスコアを送信する。
  Future<void> submitPrefectureScore({
    required String prefectureCode,
    required String prefectureName,
    required String uid,
    required int score,
  }) async {
    try {
      final authUid = await _ensureUid();
      if (authUid == null) return;
      final docRef = _prefectureRankingRef(prefectureCode).doc(authUid);
      final snapshot = await docRef.get();
      final currentBest = (snapshot.data()?['score'] as num?)?.toInt() ?? 0;
      if (score < currentBest) return;
      await docRef.set({
        'prefectureName': prefectureName,
        'score': score,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      // ignore: avoid_print
      print('RankingService.submitPrefectureScore failed: $e');
    }
  }

  /// グローバルランキング上位を取得する。通信エラー時は空リストを返す。
  Future<List<GlobalRankingEntry>> fetchGlobalRanking({int limit = 50}) async {
    try {
      final snapshot = await _globalRankingRef
          .orderBy('score', descending: true)
          .limit(limit)
          .get();
      var rank = 0;
      return snapshot.docs.map((doc) {
        rank++;
        final data = doc.data();
        return GlobalRankingEntry(
          rank: rank,
          uid: doc.id,
          nickname: (data['nickname'] as String?) ?? '名無しの探検家',
          score: (data['score'] as num?)?.toInt() ?? 0,
          clearedPrefectures: (data['clearedPrefectures'] as num?)?.toInt() ?? 0,
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print('RankingService.fetchGlobalRanking failed: $e');
      return [];
    }
  }

  /// 単一都道府県のトップランキング（上位1件のスコア・プレイヤー数）を取得する。
  Future<PrefectureRankingEntry?> fetchTopForPrefecture({
    required String prefectureCode,
    required String prefectureName,
  }) async {
    try {
      final collection = _prefectureRankingRef(prefectureCode);
      final countSnapshot = await collection.count().get();
      final topSnapshot =
          await collection.orderBy('score', descending: true).limit(1).get();
      if (topSnapshot.docs.isEmpty) return null;
      final topScore = (topSnapshot.docs.first.data()['score'] as num?)?.toInt() ?? 0;
      return PrefectureRankingEntry(
        rank: 0,
        prefectureName: prefectureName,
        score: topScore,
        playerCount: countSnapshot.count ?? 0,
      );
    } catch (e) {
      // ignore: avoid_print
      print('RankingService.fetchTopForPrefecture failed: $e');
      return null;
    }
  }
}

class GlobalRankingEntry {
  final int rank;
  final String uid;
  final String nickname;
  final int score;
  final int clearedPrefectures;

  GlobalRankingEntry({
    required this.rank,
    required this.uid,
    required this.nickname,
    required this.score,
    required this.clearedPrefectures,
  });
}

class PrefectureRankingEntry {
  final int rank;
  final String prefectureName;
  final int score;
  final int playerCount;

  PrefectureRankingEntry({
    required this.rank,
    required this.prefectureName,
    required this.score,
    required this.playerCount,
  });
}
