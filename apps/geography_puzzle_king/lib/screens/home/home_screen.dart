import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/providers/auth_provider.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart';
import 'package:geography_puzzle_king/screens/pokedex/pokedex_screen.dart';
import 'package:geography_puzzle_king/services/audio_service.dart';
import 'package:geography_puzzle_king/services/tutorial_service.dart';
import 'package:geography_puzzle_king/utils/prefecture_data.dart';
import 'package:geography_puzzle_king/widgets/banner_ad_bar.dart';
import 'package:geography_puzzle_king/i18n/content_tr.dart';
import '../../widgets/ui_icon.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AudioService().stopBgm();
    // チュートリアルをチェック
    Future.microtask(() => _checkTutorial());
  }

  Future<void> _checkTutorial() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);

    // チュートリアルチェック
    final tutorialService = TutorialService(prefs);
    if (!tutorialService.isTutorialCompleted() && mounted) {
      _showTutorialStep(tutorialService);
    }
  }

  void _showTutorialStep(TutorialService tutorialService) {
    final step = tutorialService.getCurrentStep();
    final tutorialStep = TutorialStep.getStep(step);

    if (tutorialStep == null) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: IconText('📖 ${tutorialStep.title}'),
        content: IconText(tutorialStep.description),
        actions: [
          if (step < 5)
            TextButton(
              onPressed: () async {
                await tutorialService.advanceStep();
                Navigator.pop(ctx);
                if (mounted) Future.delayed(const Duration(milliseconds: 300),
                  () => _showTutorialStep(tutorialService));
              },
              child: IconText(tr('次へ')),
            )
          else
            ElevatedButton(
              onPressed: () async {
                await tutorialService.completeTutorial();
                Navigator.pop(ctx);
              },
              child: IconText(tr('完了')),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SharedPreferences からのデータ初期化（初回ビルドで実行）
    ref.watch(gameDataInitProvider);

    final user = ref.watch(currentUserProvider);
    if (user == null) {
      Future.microtask(() {
        Navigator.of(context).pushReplacementNamed('/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroHeader(user.nickname),
              Transform.translate(
                offset: const Offset(0, -24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDeployButton(),
                      const SizedBox(height: AppSpacing.lg),
                      _buildStatsRow(),
                      const SizedBox(height: AppSpacing.lg),
                      Text(AppLocalizations.of(context)!.menu, style: AppTextStyles.headline3),
                      const SizedBox(height: AppSpacing.md),
                      _buildMenuGrid(),
                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BannerAdBar(),
    );
  }

  // ── ヒーローヘッダー（タイトル + 全国制圧進捗） ─────────────────────────
  Widget _buildHeroHeader(String nickname) {
    final l10n = AppLocalizations.of(context)!;
    final cleared = _clearedCount();
    const total = 47;
    final progress = cleared / total;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.xl,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.heroTop, AppColors.heroBottom],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconText('🗾', style: TextStyle(fontSize: 30)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(
                      l10n.appSubtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    IconText(
                      l10n.commanderName(nickname),
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // 全国制圧ゲージ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                l10n.nationalConquest,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconText(
                l10n.clearedOfTotal(cleared, total),
                style: const TextStyle(
                  color: AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.medium),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.conquestPercent((progress * 100).toStringAsFixed(0)),
            style: const TextStyle(color: Colors.white60, fontSize: 11),
          ),
        ],
      ),
    );
  }

  // ── 出撃ボタン（メインCTA） ──────────────────────────────────────────
  Widget _buildDeployButton() {
    final l10n = AppLocalizations.of(context)!;
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(AppRadius.large),
      shadowColor: AppColors.primary.withOpacity(0.5),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.large),
        onTap: () => Navigator.of(context).pushNamed('/prefecture_selection'),
        child: Container(
          height: 84,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.large),
            gradient: const LinearGradient(
              colors: [Color(0xFF388E3C), Color(0xFF2E7D32)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: IconText('⚔️', style: TextStyle(fontSize: 26)),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconText(
                      l10n.deploy,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconText(
                      l10n.deploySubtitle,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  // ── 統計サマリー（クリア県・総スコア・実績） ─────────────────────────
  Widget _buildStatsRow() {
    final l10n = AppLocalizations.of(context)!;
    final stats = ref.watch(gameStatsProvider);
    final achievements = ref.watch(achievementsProvider);
    final unlocked = achievements.where((a) => a.isUnlocked).length;

    return Row(
      children: [
        _statCard('🏯', l10n.conqueredCount, '${_clearedCount()}', AppColors.primary),
        const SizedBox(width: AppSpacing.sm),
        _statCard('⭐', l10n.totalScore, _compact(stats.totalScore), AppColors.accent),
        const SizedBox(width: AppSpacing.sm),
        _statCard(
          '🏅',
          l10n.achievements,
          '$unlocked/${achievements.length}',
          AppColors.secondary,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const PokedexScreen(initialTabIndex: 2),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _statCard(String emoji, String label, String value, Color color, {VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.large),
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            IconText(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            IconText(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            IconText(label, style: AppTextStyles.bodySmall),
          ],
        ),
        ),
      ),
    );
  }

  // ── メニューグリッド（実装済みルートのみ） ───────────────────────────
  Widget _buildMenuGrid() {
    final l10n = AppLocalizations.of(context)!;
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.0,
      children: [
        _menuTile('🗺️', l10n.map, Colors.green, '/territory'),
        _menuTile('📖', l10n.pokedex, AppColors.secondary, '/pokedex'),
        _menuTile('🏆', l10n.ranking, AppColors.accent, '/ranking'),
        _menuTile('🏛️', l10n.hqUpgrade, Colors.deepOrangeAccent, '/hq'),
        _menuTile('⚙️', l10n.settings, AppColors.textSecondary, '/settings'),
      ],
    );
  }

  Widget _menuTile(String emoji, String label, Color color, String route) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.large),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.large),
        onTap: () => Navigator.of(context).pushNamed(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconText(emoji, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            IconText(
              label,
              style: AppTextStyles.subtitle2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── ヘルパー ─────────────────────────────────────────────────────────
  int _clearedCount() {
    final gameService = ref.read(gameServiceProvider);
    return allPrefectures
        .where((p) => gameService.isPrefectureClearedAny(p.code))
        .length;
  }

  String _compact(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 10000) return '${(n / 1000).toStringAsFixed(0)}K';
    return n.toString();
  }
}
