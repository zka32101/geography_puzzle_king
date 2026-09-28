import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

class DifficultyModifier {
  final double hpMultiplier;
  final int waveAddition;
  final double scoreMultiplier;
  final Color color;

  const DifficultyModifier({
    required this.hpMultiplier,
    required this.waveAddition,
    required this.scoreMultiplier,
    required this.color,
  });
}

const Map<String, DifficultyModifier> difficultyModifiers = {
  'easy': DifficultyModifier(
    hpMultiplier: 0.8,
    waveAddition: -1,
    scoreMultiplier: 0.8,
    color: Color(0xFF4CAF50),
  ),
  'normal': DifficultyModifier(
    hpMultiplier: 1.0,
    waveAddition: 0,
    scoreMultiplier: 1.0,
    color: Color(0xFF2196F3),
  ),
  'hard': DifficultyModifier(
    hpMultiplier: 1.15,
    waveAddition: 2,
    scoreMultiplier: 1.5,
    color: Color(0xFFE53935),
  ),
};

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
