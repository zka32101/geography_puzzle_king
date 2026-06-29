/// 実績ID
enum AchievementId {
  firstClear,     // 初めてクリア
  clearFive,      // 5県クリア
  clearAll,       // 全47県クリア
  hardMaster,     // ハードで10県クリア
  noMistakes,     // ミスなしクリア
  speedRunner,    // 3分以内にクリア
  facilityMaster, // 全施設タイプを1ゲームで使用
  bossSlayer,     // ボスを10体倒す（累計）
}

/// 実績データ
class Achievement {
  final AchievementId id;
  final String title;
  final String description;
  final String emoji;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.isUnlocked,
    required this.unlockedAt,
  });

  Achievement copyWith({bool? isUnlocked, DateTime? unlockedAt}) => Achievement(
        id: id,
        title: title,
        description: description,
        emoji: emoji,
        isUnlocked: isUnlocked ?? this.isUnlocked,
        unlockedAt: unlockedAt ?? this.unlockedAt,
      );
}

/// 全実績マスターデータ
const List<Achievement> allAchievements = [
  Achievement(
    id: AchievementId.firstClear,
    title: 'はじめの一歩',
    description: '初めて都道府県をクリアした',
    emoji: '🎯',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.clearFive,
    title: 'ご当地マスター',
    description: '5つの都道府県をクリアした',
    emoji: '🗾',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.clearAll,
    title: '日本制覇',
    description: '全47都道府県をクリアした',
    emoji: '🏆',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.hardMaster,
    title: 'ハードボイルド',
    description: 'ハードで10県クリアした',
    emoji: '💪',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.noMistakes,
    title: '完璧防衛',
    description: 'ミスなしでクリアした',
    emoji: '⭐',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.speedRunner,
    title: 'スピードラン',
    description: '3分以内にクリアした',
    emoji: '⚡',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.facilityMaster,
    title: '産業王',
    description: '全施設タイプを使用した',
    emoji: '🏗️',
    isUnlocked: false,
    unlockedAt: null,
  ),
  Achievement(
    id: AchievementId.bossSlayer,
    title: 'ボスキラー',
    description: '累計10体のボスを倒した',
    emoji: '👹',
    isUnlocked: false,
    unlockedAt: null,
  ),
];
