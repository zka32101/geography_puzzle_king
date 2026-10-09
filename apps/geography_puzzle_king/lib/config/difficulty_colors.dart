import 'package:flutter/material.dart';

/// 難易度(easy/normal/hard)の配色。県カードのE/N/H丸と日本統一マップで共通利用する。
class DifficultyColors {
  DifficultyColors._();

  static const Color easy = Color(0xFF43A047); // 緑
  static const Color normal = Color(0xFF1E88E5); // 青
  static const Color hard = Color(0xFFE53935); // 赤
  static final Color uncleared = Colors.grey.shade300; // 未クリア(地図)

  /// 難易度文字列 -> 色。null/不明は未クリア色。
  static Color forDifficulty(String? difficulty) => switch (difficulty) {
        'easy' => easy,
        'normal' => normal,
        'hard' => hard,
        _ => uncleared,
      };
}
