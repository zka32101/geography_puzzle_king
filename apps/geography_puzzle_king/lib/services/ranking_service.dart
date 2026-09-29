import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geography_puzzle_king/models/ranking_model.dart';

class RankingService {
  RankingService(this._firestore);

  final FirebaseFirestore _firestore;

  static const _maxGlobalEntries = 100;
  static const _maxPrefEntries = 50;

  CollectionReference<Map<String, dynamic>> get _globalCol =>
      _firestore.collection('rankings');

  CollectionReference<Map<String, dynamic>> _prefEntriesCol(
    String prefCode,
    String difficulty,
  ) =>
      _firestore
          .collection('prefecture_rankings')
          .doc('${prefCode}_$difficulty')
          .collection('entries');

  // ─── グローバルランキング ───────────────────────────────────────

  Future<List<RankingEntry>> getGlobalRanking({int limit = _maxGlobalEntries}) async {
    final snap = await _globalCol
        .orderBy('totalScore', descending: true)
        .limit(limit)
        .get();

    var rank = 0;
    return snap.docs.map((doc) {
      rank++;
      final d = doc.data();
      return RankingEntry(
        rank: rank,
        userId: doc.id,
        nickname: d['nickname'] as String? ?? '',
        totalScore: d['totalScore'] as int? ?? 0,
        clearedPrefectures: d['clearedPrefectures'] as int? ?? 0,
        playTime: d['playTime'] as int? ?? 0,
        recordedAt: (d['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      );
    }).toList();
  }

  Future<void> updateRankingData({
    required String userId,
    required String nickname,
    required int totalScore,
    required int clearedCount,
    required int playTime,
  }) async {
    await _globalCol.doc(userId).set({
      'nickname': nickname,
      'totalScore': totalScore,
      'clearedPrefectures': clearedCount,
      'playTime': playTime,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ─── 都道府県別ランキング ────────────────────────────────────────

  Future<List<PrefectureRankingEntry>> getPrefectureRanking(
    String prefCode,
    String difficulty, {
    int limit = _maxPrefEntries,
  }) async {
    final snap = await _prefEntriesCol(prefCode, difficulty)
        .orderBy('bestScore', descending: true)
        .limit(limit)
        .get();

    var rank = 0;
    return snap.docs.map((doc) {
      rank++;
      final d = doc.data();
      return PrefectureRankingEntry(
        prefectureCode: prefCode,
        difficulty: difficulty,
        rank: rank,
        nickname: d['nickname'] as String? ?? '',
        bestScore: d['bestScore'] as int? ?? 0,
        fastestClearTime: d['fastestClearTime'] as int? ?? 0,
        playCount: d['playCount'] as int? ?? 0,
        lastClearedAt:
            (d['lastClearedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      );
    }).toList();
  }

  Future<void> recordPrefectureScore({
    required String userId,
    required String nickname,
    required String prefCode,
    required String difficulty,
    required int score,
    required int clearTime,
  }) async {
    final docRef = _prefEntriesCol(prefCode, difficulty).doc(userId);

    await _firestore.runTransaction((tx) async {
      final snap = await tx.get(docRef);
      final existing = snap.data();

      final bestScore = existing == null
          ? score
          : (score > (existing['bestScore'] as int? ?? 0)
              ? score
              : existing['bestScore'] as int);
      final fastestClearTime = existing == null
          ? clearTime
          : (clearTime < (existing['fastestClearTime'] as int? ?? clearTime)
              ? clearTime
              : existing['fastestClearTime'] as int);
      final playCount = (existing?['playCount'] as int? ?? 0) + 1;

      tx.set(docRef, {
        'userId': userId,
        'nickname': nickname,
        'bestScore': bestScore,
        'fastestClearTime': fastestClearTime,
        'playCount': playCount,
        'lastClearedAt': FieldValue.serverTimestamp(),
      });
    });
  }

  // ─── ユーザー統計 ───────────────────────────────────────────────

  Future<UserRankingStats?> getUserStats(String userId) async {
    final doc = await _globalCol.doc(userId).get();
    final d = doc.data();
    if (d == null) return null;

    // グローバル順位を数える（自分より totalScore が高い件数 + 1）
    final myScore = d['totalScore'] as int? ?? 0;
    final higherCountSnap =
        await _globalCol.where('totalScore', isGreaterThan: myScore).count().get();
    final globalRank = (higherCountSnap.count ?? 0) + 1;

    return UserRankingStats(
      globalRank: globalRank,
      totalScore: myScore,
      clearedCount: d['clearedPrefectures'] as int? ?? 0,
      prefectureRanks: await _getPrefectureRanks(userId),
      lastUpdated: (d['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// 自分がプレイ済みの都道府県×難易度ごとの順位を計算する。
  /// 全141通りを走査するのではなく、collectionGroup で自分のエントリのみ取得し、
  /// それぞれについて自分より bestScore が高い件数を数えて順位とする。
  Future<Map<String, int>> _getPrefectureRanks(String userId) async {
    final entriesSnap = await _firestore
        .collectionGroup('entries')
        .where('userId', isEqualTo: userId)
        .get();

    final result = <String, int>{};
    for (final doc in entriesSnap.docs) {
      final prefDifficulty = doc.reference.parent.parent?.id;
      if (prefDifficulty == null) continue;

      final myBestScore = doc.data()['bestScore'] as int? ?? 0;
      final higherCountSnap = await doc.reference.parent
          .where('bestScore', isGreaterThan: myBestScore)
          .count()
          .get();
      result[prefDifficulty] = (higherCountSnap.count ?? 0) + 1;
    }
    return result;
  }
}
