import 'package:cloud_firestore/cloud_firestore.dart';

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
/// 注意: このアプリの現行の認証(`lib/providers/auth_provider.dart`)は
/// Firebase Authを実際には使わないローカル疑似認証（`User.uid`は
/// `local_xxx`形式のローカル生成ID）。pubspec.yamlにfirebase_authの
/// 依存はあるが、ログイン画面からのFirebase Auth連携は未実装のため、
/// このサービスは暫定的に [User.uid] / [User.nickname] をそのまま
/// Firestoreドキュメントのキー・表示名として利用する。将来的に
/// Firebase Authへ移行する場合は、上記ルールの`request.auth.uid`と
/// 実際に送信する`uid`が一致するよう認証フローを接続すること。
class RankingService {
  RankingService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

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
      final docRef = _globalRankingRef.doc(uid);
      await _firestore.runTransaction((tx) async {
        final snapshot = await tx.get(docRef);
        final currentBest = (snapshot.data()?['score'] as num?)?.toInt() ?? 0;
        if (score < currentBest) {
          // ベストスコアを下回る場合は上書きしない。
          return;
        }
        tx.set(docRef, {
          'nickname': nickname,
          'score': score,
          'clearedPrefectures': clearedPrefectures,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      });
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
      final docRef = _prefectureRankingRef(prefectureCode).doc(uid);
      await _firestore.runTransaction((tx) async {
        final snapshot = await tx.get(docRef);
        final currentBest = (snapshot.data()?['score'] as num?)?.toInt() ?? 0;
        if (score < currentBest) return;
        tx.set(docRef, {
          'prefectureName': prefectureName,
          'score': score,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      });
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
