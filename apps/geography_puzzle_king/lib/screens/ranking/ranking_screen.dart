import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/config/difficulty_config.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/models/ranking_model.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart';
import 'package:geography_puzzle_king/utils/prefecture_data.dart';

final _globalRankingProvider = FutureProvider.autoDispose<List<RankingEntry>>((ref) {
  return ref.watch(rankingServiceProvider).getGlobalRanking();
});

final _selectedPrefCodeProvider = StateProvider.autoDispose<String>((ref) => '01');
final _selectedDifficultyProvider = StateProvider.autoDispose<String>((ref) => 'normal');

final _prefectureRankingProvider =
    FutureProvider.autoDispose<List<PrefectureRankingEntry>>((ref) {
  final code = ref.watch(_selectedPrefCodeProvider);
  final difficulty = ref.watch(_selectedDifficultyProvider);
  return ref
      .watch(rankingServiceProvider)
      .getPrefectureRanking(code, difficulty);
});

class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends ConsumerState<RankingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    );
  }

  Widget _buildGlobalRankingTab(AppLocalizations l10n) {
    final rankingAsync = ref.watch(_globalRankingProvider);

    return rankingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text(l10n.genericErrorPrefix(error.toString()))),
      data: (globalRanking) {
        if (globalRanking.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                l10n.rankingEmptyGlobal,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(_globalRankingProvider),
          child: ListView.builder(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${entry.totalScore}',
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
          ),
        );
      },
    );
  }

  Widget _buildPrefectureRankingTab(AppLocalizations l10n) {
    final selectedCode = ref.watch(_selectedPrefCodeProvider);
    final selectedDifficulty = ref.watch(_selectedDifficultyProvider);
    final rankingAsync = ref.watch(_prefectureRankingProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedCode,
                  decoration: InputDecoration(
                    labelText: l10n.rankingSelectPrefectureLabel,
                    isDense: true,
                  ),
                  items: allPrefectures
                      .map((p) => DropdownMenuItem(value: p.code, child: Text(p.name)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(_selectedPrefCodeProvider.notifier).state = value;
                    }
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedDifficulty,
                  decoration: InputDecoration(
                    labelText: l10n.rankingSelectDifficultyLabel,
                    isDense: true,
                  ),
                  items: ['easy', 'normal', 'hard']
                      .map((d) => DropdownMenuItem(
                            value: d,
                            child: Text(getDifficultyLabel(d, l10n)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(_selectedDifficultyProvider.notifier).state = value;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: rankingAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) =>
                Center(child: Text(l10n.genericErrorPrefix(error.toString()))),
            data: (prefRanking) {
              if (prefRanking.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Text(
                      l10n.rankingEmptyPrefecture,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async => ref.invalidate(_prefectureRankingProvider),
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  itemCount: prefRanking.length,
                  itemBuilder: (context, index) {
                    final entry = prefRanking[index];

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
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: entry.rank <= 3
                                    ? AppColors.accent
                                    : AppColors.divider,
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
                                    '${entry.playCount}${l10n.rankingPlayCountSuffix}',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${entry.bestScore}',
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
                ),
              );
            },
          ),
        ),
      ],
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
