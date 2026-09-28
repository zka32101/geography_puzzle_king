/// 本部強化（恒久アップグレード）システム
/// クリアで貯まる「研究ポイント」を使い、全プレイ共通の永続強化を購入する

import 'package:geography_puzzle_king/l10n/app_localizations.dart';

enum HqUpgradeTrack { attack, coin, hp }

extension HqUpgradeTrackX on HqUpgradeTrack {
  String title(AppLocalizations l10n) {
    switch (this) {
      case HqUpgradeTrack.attack:
        return l10n.hqTrackAttackTitle;
      case HqUpgradeTrack.coin:
        return l10n.hqTrackCoinTitle;
      case HqUpgradeTrack.hp:
        return l10n.hqTrackHpTitle;
    }
  }

  String description(AppLocalizations l10n) {
    switch (this) {
      case HqUpgradeTrack.attack:
        return l10n.hqTrackAttackDescription;
      case HqUpgradeTrack.coin:
        return l10n.hqTrackCoinDescription;
      case HqUpgradeTrack.hp:
        return l10n.hqTrackHpDescription;
    }
  }

  static const maxLevel = 10;

  /// 次レベルへのコスト（レベルが上がるほど高騰）
  int costForLevel(int currentLevel) => 20 + currentLevel * 15;
}

class HqUpgradeState {
  final Map<HqUpgradeTrack, int> levels;
  final int researchPoints;

  const HqUpgradeState({required this.levels, required this.researchPoints});

  factory HqUpgradeState.initial() => const HqUpgradeState(
        levels: {
          HqUpgradeTrack.attack: 0,
          HqUpgradeTrack.coin: 0,
          HqUpgradeTrack.hp: 0,
        },
        researchPoints: 0,
      );

  int levelOf(HqUpgradeTrack t) => levels[t] ?? 0;

  /// 施設ダメージ倍率（1.0 = ボーナスなし）
  double get attackMultiplier =>
      1.0 + levelOf(HqUpgradeTrack.attack) * 0.02;

  /// コイン獲得倍率（1.0 = ボーナスなし）
  double get coinMultiplier => 1.0 + levelOf(HqUpgradeTrack.coin) * 0.02;

  /// 初期HPボーナス（加算）
  int get hpBonus => levelOf(HqUpgradeTrack.hp);

  HqUpgradeState copyWith({
    Map<HqUpgradeTrack, int>? levels,
    int? researchPoints,
  }) =>
      HqUpgradeState(
        levels: levels ?? this.levels,
        researchPoints: researchPoints ?? this.researchPoints,
      );
}
