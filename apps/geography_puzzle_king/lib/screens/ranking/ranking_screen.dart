import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/services/ranking_service.dart';
import 'package:geography_puzzle_king/utils/prefecture_data.dart';
import 'package:geography_puzzle_king/widgets/banner_ad_bar.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RankingService _rankingService = RankingService();

  late Future<List<RankingEntry>> _globalRankingFuture;
  late Future<List<PrefectureRanking>> _prefectureRankingFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _globalRankingFuture = _loadGlobalRanking();
    _prefectureRankingFuture = _loadPrefectureRanking();
  }

  // Firestoreから取得。通信エラー・未接続時はRankingService側で例外を
  // 握りつぶして空リストを返すため、ここでは追加のtry/catchは不要。
  Future<List<RankingEntry>> _loadGlobalRanking() async {
    final entries = await _rankingService.fetchGlobalRanking(limit: 20);
    return entries
        .map((e) => RankingEntry(
              rank: e.rank,
              nickname: e.nickname,
              score: e.score,
              clearedPrefectures: e.clearedPrefectures,
            ))
        .toList();
  }

  // 都道府県ごとのトップスコアをまとめて取得し、スコア降順に並べ替える。
  Future<List<PrefectureRanking>> _loadPrefectureRanking() async {
    final tops = await Future.wait(allPrefectures.map(
      (pref) => _rankingService.fetchTopForPrefecture(
        prefectureCode: pref.code,
        prefectureName: pref.name,
      ),
    ));
    final results = tops
        .whereType<PrefectureRankingEntry>()
        .map((top) => PrefectureRanking(
              rank: 0,
              prefectureName: top.prefectureName,
              score: top.score,
              playerCount: top.playerCount,
            ))
        .toList();
    results.sort((a, b) => b.score.compareTo(a.score));
    for (var i = 0; i < results.length; i++) {
      results[i] = PrefectureRanking(
        rank: i + 1,
        prefectureName: results[i].prefectureName,
        score: results[i].score,
        playerCount: results[i].playerCount,
      );
    }
    return results;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            const Text('🏆', style: TextStyle(fontSize: 20)),
            const SizedBox(width: AppSpacing.sm),
            Text(l10n.rankingTitle),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.heroTop, AppColors.heroBottom],
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: AppColors.accent,
          indicatorWeight: 3,
          tabs: [
            Tab(text: l10n.rankingTabGlobal),
            Tab(text: l10n.rankingTabPrefecture),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGlobalRankingTab(l10n),
          _buildPrefectureRankingTab(l10n),
        ],
      ),
      bottomNavigationBar: const BannerAdBar(),
    );
  }

  Widget _buildGlobalRankingTab(AppLocalizations l10n) {
    return FutureBuilder<List<RankingEntry>>(
      future: _globalRankingFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final globalRanking = snapshot.data ?? const <RankingEntry>[];
        if (globalRanking.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                l10n.rankingEmptyGlobal,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: globalRanking.length,
          itemBuilder: (context, index) {
            final entry = globalRanking[index];
            final isMedal = entry.rank <= 3;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              gradient: isMedal
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getMedalColor(entry.rank).withOpacity(0.1),
                        _getMedalColor(entry.rank).withOpacity(0.05),
                      ],
                    )
                  : null,
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Rank Badge
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isMedal
                        ? _getMedalColor(entry.rank)
                        : AppColors.divider,
                    borderRadius: BorderRadius.circular(AppRadius.circle),
                  ),
                  child: Center(
                    child: Text(
                      isMedal ? _getMedalEmoji(entry.rank) : '${entry.rank}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
                // Player Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.nickname,
                        style: AppTextStyles.subtitle1,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.rankingClearedCount(entry.clearedPrefectures),
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                // Score
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${entry.score}',
                      style: AppTextStyles.subtitle1.copyWith(
                        color: isMedal ? _getMedalColor(entry.rank) : null,
                      ),
                    ),
                    Text(
                      l10n.pointsSuffix,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
          },
        );
      },
    );
  }

  Widget _buildPrefectureRankingTab(AppLocalizations l10n) {
    return FutureBuilder<List<PrefectureRanking>>(
      future: _prefectureRankingFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final prefectureRanking = snapshot.data ?? const <PrefectureRanking>[];
        if (prefectureRanking.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                l10n.rankingEmptyPrefecture,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.md),
          itemCount: prefectureRanking.length,
          itemBuilder: (context, index) {
            final entry = prefectureRanking[index];

            return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Rank
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: entry.rank <= 3 ? AppColors.accent : AppColors.divider,
                    borderRadius: BorderRadius.circular(AppRadius.circle),
                  ),
                  child: Center(
                    child: Text(
                      entry.rank <= 3
                          ? _getMedalEmoji(entry.rank)
                          : '${entry.rank}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
                // Prefecture Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.prefectureName,
                        style: AppTextStyles.subtitle1,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.rankingPlayerCount(entry.playerCount),
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                // Score
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${entry.score}',
                      style: AppTextStyles.subtitle1,
                    ),
                    Text(
                      l10n.pointsSuffix,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
          },
        );
      },
    );
  }

  Color _getMedalColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey;
      case 3:
        return Colors.orange;
      default:
        return AppColors.primary;
    }
  }

  String _getMedalEmoji(int rank) {
    switch (rank) {
      case 1:
        return '🥇';
      case 2:
        return '🥈';
      case 3:
        return '🥉';
      default:
        return '$rank';
    }
  }
}

class RankingEntry {
  final int rank;
  final String nickname;
  final int score;
  final int clearedPrefectures;

  RankingEntry({
    required this.rank,
    required this.nickname,
    required this.score,
    required this.clearedPrefectures,
  });
}

class PrefectureRanking {
  final int rank;
  final String prefectureName;
  final int score;
  final int playerCount;

  PrefectureRanking({
    required this.rank,
    required this.prefectureName,
    required this.score,
    required this.playerCount,
  });
}
