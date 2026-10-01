import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/i18n/content_tr.dart';

class HistoryStageData {
  final String code;
  final String _name;
  String get name => tr(_name);
  final String _subTitle;
  String get subTitle => tr(_subTitle);
  final String emoji;
  final Color color;
  final String _bossName;
  String get bossName => tr(_bossName);
  final String bossEmoji;
  final String _bossSkill;
  String get bossSkill => tr(_bossSkill);
  final int totalWaves;
  final String _lore;
  String get lore => tr(_lore);

  const HistoryStageData({
    required this.code,
    required String name,
    required String subTitle,
    required this.emoji,
    required this.color,
    required String bossName,
    required this.bossEmoji,
    required String bossSkill,
    required this.totalWaves,
    required String lore,
  }) : _name = name, _subTitle = subTitle, _bossName = bossName, _bossSkill = bossSkill, _lore = lore;
}

const List<HistoryStageData> allHistoryStages = [
  HistoryStageData(
    code: 'h01',
    name: '神代の決戦',
    subTitle: 'スサノオの時代',
    emoji: '⚔️',
    color: Color(0xFF4527A0),
    bossName: '八岐大蛇',
    bossEmoji: '🐍',
    bossSkill: '増援召喚',
    totalWaves: 8,
    lore: '古代日本、神々が大地を支配した時代。スサノオが治めんとした出雲の地に、伝説の八岐大蛇が降臨した。',
  ),
  HistoryStageData(
    code: 'h02',
    name: '戦国の決戦',
    subTitle: '天下統一への道',
    emoji: '🏯',
    color: Color(0xFFB71C1C),
    bossName: '覇王の化身',
    bossEmoji: '👹',
    bossSkill: 'スピードバースト',
    totalWaves: 9,
    lore: '乱世の戦国時代。名将たちが覇権を競い無数の命が散った。その怨念から生まれた最強の化身が現れた。',
  ),
  HistoryStageData(
    code: 'h03',
    name: '幕末・文明開化',
    subTitle: '黒船来航・維新の嵐',
    emoji: '🚢',
    color: Color(0xFF1A237E),
    bossName: '黒船の怪物',
    bossEmoji: '🛳️',
    bossSkill: 'HP再生',
    totalWaves: 9,
    lore: '黒船とともに謎の怪物が押し寄せた。西洋文明と伝統が激突する維新の炎で、この脅威を撃退せよ！',
  ),
  HistoryStageData(
    code: 'h04',
    name: '令和の最終決戦',
    subTitle: '日本の夜明けを守れ',
    emoji: '🌅',
    color: Color(0xFFBF360C),
    bossName: '令和の覇者',
    bossEmoji: '👑',
    bossSkill: '施設停止',
    totalWaves: 10,
    lore: '時代を超えてすべての脅威が結集した。日本の全歴史を背負い、最後の決戦に挑め！',
  ),
];

HistoryStageData? getHistoryStageByCode(String code) {
  try {
    return allHistoryStages.firstWhere((s) => s.code == code);
  } catch (_) {
    return null;
  }
}
