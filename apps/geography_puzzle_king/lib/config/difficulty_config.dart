import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

class DifficultyModifier {
  final double hpMultiplier;
  final int waveAddition;
  final double scoreMultiplier;
  final Color color;

  /// 敵の移動速度倍率。小さい子どもでもタワー配置が間に合うよう
  /// イージーは遅めにする。
  final double speedMultiplier;

  /// 基地ハートの増減（ステージ既定値に加算）。
  final int heartBonus;

  /// ボス・装甲敵がゴールしたときに追加でハートを減らすか。
  /// イージーでは常に1ずつしか減らず、一気に負けることがない。
  final bool heavyBreach;

  /// 撃破コイン報酬の倍率。
  final double rewardMultiplier;

  /// ウェーブ間の休憩（準備）時間（秒）。
  final double waveBreakSeconds;

  const DifficultyModifier({
    required this.hpMultiplier,
    required this.waveAddition,
    required this.scoreMultiplier,
    required this.color,
    required this.speedMultiplier,
    required this.heartBonus,
    required this.heavyBreach,
    required this.rewardMultiplier,
    required this.waveBreakSeconds,
  });
}

/// 難易度ごとのバランス方針:
/// - イージー: 小学校低学年でも「負けずに最後まで遊べる」ことを優先。
///   敵は弱く遅く、ハートは多め、突破されても1ずつしか減らない。
/// - ノーマル: 施設の選び方・置き場所を少し考えればクリアできる標準。
/// - ハード: 配置とアップグレードを工夫しないとハートが削られる上級者向け。
const Map<String, DifficultyModifier> difficultyModifiers = {
  'easy': DifficultyModifier(
    hpMultiplier: 0.65,
    waveAddition: -1,
    scoreMultiplier: 0.8,
    color: Color(0xFF4CAF50),
    speedMultiplier: 0.8,
    heartBonus: 8,
    heavyBreach: false,
    rewardMultiplier: 1.25,
    waveBreakSeconds: 10.0,
  ),
  'normal': DifficultyModifier(
    hpMultiplier: 1.0,
    waveAddition: 0,
    scoreMultiplier: 1.0,
    color: Color(0xFF2196F3),
    speedMultiplier: 1.0,
    heartBonus: 0,
    heavyBreach: true,
    rewardMultiplier: 1.0,
    waveBreakSeconds: 6.0,
  ),
  'hard': DifficultyModifier(
    hpMultiplier: 1.3,
    waveAddition: 2,
    scoreMultiplier: 1.5,
    color: Color(0xFFE53935),
    speedMultiplier: 1.15,
    heartBonus: -2,
    heavyBreach: true,
    rewardMultiplier: 0.9,
    waveBreakSeconds: 4.0,
  ),
};

DifficultyModifier difficultyModifierOf(String difficulty) =>
    difficultyModifiers[difficulty] ?? difficultyModifiers['normal']!;

String getDifficultyLabel(String difficulty, AppLocalizations l10n) {
  switch (difficulty) {
    case 'easy':
      return l10n.easy;
    case 'hard':
      return l10n.hard;
    default:
      return l10n.normal;
  }
}

String getDifficultyDescription(String difficulty, AppLocalizations l10n) {
  switch (difficulty) {
    case 'easy':
      return l10n.difficultyDescriptionEasy;
    case 'hard':
      return l10n.difficultyDescriptionHard;
    default:
      return l10n.difficultyDescriptionNormal;
  }
}
