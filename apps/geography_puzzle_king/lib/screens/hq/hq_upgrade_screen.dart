import '../../widgets/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/models/hq_upgrade_model.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart';
import 'package:geography_puzzle_king/widgets/banner_ad_bar.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

/// 本部強化画面: クリアで貯まる研究ポイントを使い、全プレイ共通の永続強化を購入する
class HqUpgradeScreen extends ConsumerWidget {
  const HqUpgradeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hq = ref.watch(hqUpgradeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1620),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1620),
        elevation: 0,
        title: IconText('🏛️ ${l10n.hqUpgrade}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: const BannerAdBar(),
      body: SafeArea(
        child: Column(
          children: [
            // 研究ポイント表示
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.heroTop, AppColors.heroBottom],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Text('🔬', style: TextStyle(fontSize: 32)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(l10n.researchPointsLabel,
                          style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      Text('${hq.researchPoints}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  IconText(l10n.researchPointsHint,
                      style: const TextStyle(color: Colors.white54, fontSize: 11)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: HqUpgradeTrack.values
                    .map((t) => _buildTrackCard(context, ref, hq, t, l10n))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackCard(BuildContext context, WidgetRef ref, HqUpgradeState hq,
      HqUpgradeTrack track, AppLocalizations l10n) {
    final level = hq.levelOf(track);
    final maxed = level >= HqUpgradeTrackX.maxLevel;
    final cost = maxed ? 0 : track.costForLevel(level);
    final canAfford = !maxed && hq.researchPoints >= cost;

    final currentEffect = switch (track) {
      HqUpgradeTrack.attack => '+${(level * 2)}%',
      HqUpgradeTrack.coin => '+${(level * 2)}%',
      HqUpgradeTrack.hp => '+$level',
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconText(track.title(l10n),
                  style: const TextStyle(
                      color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.amberAccent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconText(l10n.levelFraction(level, HqUpgradeTrackX.maxLevel),
                    style: const TextStyle(color: Colors.amberAccent, fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          IconText(track.description(l10n),
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: level / HqUpgradeTrackX.maxLevel,
              minHeight: 6,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconText(l10n.currentEffectLabel(currentEffect),
                  style: const TextStyle(color: Colors.greenAccent, fontSize: 12)),
              const Spacer(),
              SizedBox(
                height: 34,
                child: ElevatedButton(
                  onPressed: maxed
                      ? null
                      : canAfford
                          ? () async {
                              final svc = ref.read(hqUpgradeServiceProvider);
                              if (svc == null) return;
                              final updated = await svc.upgrade(hq, track);
                              ref.read(hqUpgradeProvider.notifier).state = updated;
                            }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maxed
                        ? Colors.white12
                        : canAfford
                            ? Colors.orangeAccent
                            : Colors.white10,
                    disabledBackgroundColor: Colors.white10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    maxed ? l10n.maxLabel : l10n.upgradeForCostButton(cost),
                    style: TextStyle(
                      color: maxed
                          ? Colors.white38
                          : canAfford
                              ? Colors.black
                              : Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
