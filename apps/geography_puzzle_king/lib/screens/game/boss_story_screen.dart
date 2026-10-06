import '../../widgets/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/screens/game/game_screen.dart';
import 'package:geography_puzzle_king/utils/game_assets.dart';
import 'package:geography_puzzle_king/utils/history_stage_data.dart';
import 'package:geography_puzzle_king/utils/prefecture_data.dart';
import 'package:geography_puzzle_king/utils/region_data.dart';
import 'package:geography_puzzle_king/i18n/content_tr.dart';

/// 出撃前に対戦相手のボスを紹介するストーリー導入画面。
///
/// [GameScreen] と同じパラメータを受け取り、既存のボス画像アセット
/// （都道府県 / 地方決戦 / 歴史決戦）を表示したうえで、プレイヤーが
/// 「たたかう！」を押すと [GameScreen] に遷移する。
class BossStoryScreen extends StatelessWidget {
  final String prefectureCode;
  final String difficulty;
  final String regionCode;

  const BossStoryScreen({
    Key? key,
    required this.prefectureCode,
    required this.difficulty,
    this.regionCode = '',
  }) : super(key: key);

  String get _bossName {
    if (regionCode.startsWith('h')) {
      return getHistoryStageByCode(regionCode)?.bossName ?? '';
    }
    if (regionCode.isNotEmpty) {
      return getRegionByCode(regionCode)?.bossName ?? '';
    }
    return getPrefectureByCode(prefectureCode)?.boss.name ?? '';
  }

  String get _flavorText {
    if (regionCode.startsWith('h')) {
      return getHistoryStageByCode(regionCode)?.lore ?? '';
    }
    if (regionCode.isNotEmpty) {
      final region = getRegionByCode(regionCode);
      return region == null ? '' : tl.bossStoryRegion(region.name, region.bossName);
    }
    final pref = getPrefectureByCode(prefectureCode);
    return pref?.funFact ?? '';
  }

  String? get _bossImagePath =>
      getBossImage(prefCode: prefectureCode, regionCode: regionCode);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final imagePath = _bossImagePath;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (imagePath != null)
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey.shade900),
                    )
                  else
                    Container(color: Colors.grey.shade900),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconText(
                            l10n.bossStoryAppears(_bossName),
                            style: AppTextStyles.headline2.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          IconText(
                            _flavorText,
                            style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    left: AppSpacing.sm,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (_) => GameScreen(
                          prefectureCode: prefectureCode,
                          difficulty: difficulty,
                          regionCode: regionCode,
                        ),
                      ),
                    );
                  },
                  icon: const IconText('⚔️', style: TextStyle(fontSize: 18)),
                  label: IconText(l10n.bossStoryFightButton, style: AppTextStyles.button.copyWith(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
