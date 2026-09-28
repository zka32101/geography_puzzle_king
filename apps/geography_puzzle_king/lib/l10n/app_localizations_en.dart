// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Prefectures Game';

  @override
  String get appSubtitle => 'Learn Prefectures Through Games';

  @override
  String get gameDescription => 'Master all 47 prefectures!';

  @override
  String get nickname => 'Enter Nickname';

  @override
  String get nicknameHint => 'tankenkka';

  @override
  String get nicknameInstruction => 'Please enter in Hiragana or Katakana';

  @override
  String get startButton => 'Start!';

  @override
  String get errorInvalidNickname => 'Please enter a nickname';

  @override
  String get home => 'Home';

  @override
  String get game => 'Game';

  @override
  String get map => 'Map';

  @override
  String get ranking => 'Ranking';

  @override
  String get settings => 'Settings';

  @override
  String get territory => 'Japan Unification Map';

  @override
  String get unificationProgress => 'Progress';

  @override
  String get prefectures => 'Prefectures';

  @override
  String get globalRanking => 'Global';

  @override
  String get prefectureVersus => 'Prefecture Rivalry';

  @override
  String get userInfo => 'User Info';

  @override
  String get playerName => 'Player Name';

  @override
  String get notifications => 'Notifications';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get dailyEvents => 'Daily Events & Battle Notifications';

  @override
  String get soundSettings => 'Sound Settings';

  @override
  String get bgm => 'BGM';

  @override
  String get backgroundMusic => 'Background Music';

  @override
  String get sfx => 'Sound Effects';

  @override
  String get sfxDescription => 'Enable in-game sound effects';

  @override
  String get language => 'Language';

  @override
  String get languageSelect => 'Select Language';

  @override
  String get privacySettings => 'Privacy & Other';

  @override
  String get rankingDisplay => 'Ranking Display';

  @override
  String get hideFromRanking => 'Hide';

  @override
  String get showInRanking => 'Show Player Name';

  @override
  String get clearedPrefectures => 'Cleared';

  @override
  String get totalPlayers => 'Players';

  @override
  String get gameTitle => 'Geography Puzzle King';

  @override
  String get startGame => 'Start Game';

  @override
  String get profile => 'Profile';

  @override
  String get japanese => 'Japanese';

  @override
  String get english => 'English';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get easy => 'Easy';

  @override
  String get normal => 'Normal';

  @override
  String get hard => 'Hard';

  @override
  String get score => 'Score';

  @override
  String get level => 'Level';

  @override
  String get stage => 'Stage';

  @override
  String get gameOver => 'Game Over';

  @override
  String get victory => 'Victory';

  @override
  String get retry => 'Retry';

  @override
  String get back => 'Back';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get menu => 'Menu';

  @override
  String get pokedex => 'Pokedex';

  @override
  String get hqUpgrade => 'HQ Upgrade';

  @override
  String get nationalConquest => 'National Conquest';

  @override
  String get deploy => 'Deploy';

  @override
  String get deploySubtitle => 'Choose a prefecture to start defending';

  @override
  String get conqueredCount => 'Conquered';

  @override
  String get totalScore => 'Total Score';

  @override
  String get achievements => 'Achievements';

  @override
  String commanderName(String name) {
    return 'Commander $name';
  }

  @override
  String get appInfo => 'App Info';

  @override
  String get version => 'Version';

  @override
  String get buildNumber => 'Build Number';

  @override
  String get adsAndPurchases => 'Ads & Purchases';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get termsOfServiceTitle => 'Terms of Service';

  @override
  String get removeAds => 'Remove Ads';

  @override
  String get removeAdsPurchased => 'Ads Removed (Purchased)';

  @override
  String get purchaseThankYou => 'Thank you for your purchase';

  @override
  String get storeConnectionError => 'Could not connect to the store';

  @override
  String get notAvailableNow => 'Not available right now';

  @override
  String get purchaseButton => 'Purchase';

  @override
  String get guestPlayer => 'Guest Player';

  @override
  String get changePlayerName => 'Change Player Name';

  @override
  String get personalInfoWarning => 'Please don\'t enter personal information (real name, address, etc.). It may be shown to other players.';

  @override
  String get save => 'Save';

  @override
  String removeAdsDescription(String price) {
    return '$price — removes all in-game ads';
  }

  @override
  String get unlockMap => 'Unlock All Prefectures';

  @override
  String get unlockMapPurchased => 'All Prefectures Unlocked';

  @override
  String get unlockMapThankYou => 'All 47 prefectures are now playable';

  @override
  String unlockMapDescription(String price) {
    return '$price — unlocks all 47 prefectures, region battles & history stages';
  }

  @override
  String get stageLockedTitle => '🔒 This Prefecture Is Locked';

  @override
  String stageLockedBody(int count) {
    return 'Only the first $count prefectures are free to play.\nPurchase \"Unlock All Prefectures\" to play all 47.';
  }

  @override
  String get goToPurchaseButton => 'Go to Purchase';

  @override
  String get rankingTitle => 'Ranking';

  @override
  String get rankingTabGlobal => 'Global';

  @override
  String get rankingTabPrefecture => 'Prefecture Rivalry';

  @override
  String rankingClearedCount(int cleared) {
    return 'Cleared: $cleared / 47';
  }

  @override
  String get pointsSuffix => 'pts';

  @override
  String rankingPlayerCount(int count) {
    return 'Players: $count';
  }

  @override
  String get territoryMapTitle => 'Japan Unification Map';

  @override
  String genericErrorPrefix(String error) {
    return 'Error: $error';
  }

  @override
  String get territoryUnificationLabel => 'National Unification';

  @override
  String get statsSectionTitle => '📊 Statistics';

  @override
  String get statTotalClears => 'Total Clears';

  @override
  String get statAverageLevel => 'Average Level';

  @override
  String get statHighScore => 'High Score';

  @override
  String timesSuffix(int count) {
    return '$count times';
  }

  @override
  String get pokedexTitle => 'Pokedex';

  @override
  String get pokedexTabCleared => 'Cleared';

  @override
  String get pokedexTabStats => 'Stats';

  @override
  String get pokedexTabAchievements => 'Achievements';

  @override
  String get clearProgressLabel => 'Clear Progress';

  @override
  String percentComplete(String percent) {
    return '$percent% Complete';
  }

  @override
  String get learningStatsTitle => 'Learning Stats';

  @override
  String get statClearedPrefCount => 'Prefectures Cleared';

  @override
  String get statTotalPlayTime => 'Total Play Time';

  @override
  String hoursMinutesFormat(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get statTotalScore => 'Total Score';

  @override
  String get statTotalGamesPlayed => 'Total Games Played';

  @override
  String get clearsByDifficultyLabel => 'Clears by Difficulty';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get kanaLabel => 'Kana: ';

  @override
  String get capitalCityLabel => 'Capital: ';

  @override
  String populationLabel(String population) {
    return 'Population: approx. $population';
  }

  @override
  String get areaLabel => 'Area: ';

  @override
  String bestScoreLabel(String score) {
    return 'Best Score: $score pts';
  }

  @override
  String get clearedDifficultiesLabel => 'Cleared Difficulties: ';

  @override
  String get specialtiesLabel => 'Specialties: ';

  @override
  String get closeButton => 'Close';

  @override
  String get researchPointsLabel => 'Research Points';

  @override
  String get researchPointsHint => 'Earned by clearing prefectures';

  @override
  String levelFraction(int level, int max) {
    return 'Lv.$level / $max';
  }

  @override
  String currentEffectLabel(String effect) {
    return 'Current effect: $effect';
  }

  @override
  String get maxLabel => 'MAX';

  @override
  String upgradeForCostButton(int cost) {
    return '🔬$cost Upgrade';
  }

  @override
  String get hqTrackAttackTitle => '⚔️ Weapons Development';

  @override
  String get hqTrackCoinTitle => '💰 Economic Policy';

  @override
  String get hqTrackHpTitle => '🏯 Wall Fortification';

  @override
  String get hqTrackAttackDescription => 'Permanently increases all facility damage';

  @override
  String get hqTrackCoinDescription => 'Permanently increases coins earned per kill';

  @override
  String get hqTrackHpDescription => 'Permanently increases starting HP for all stages';

  @override
  String get selectPrefectureTitle => 'Select Prefecture';

  @override
  String get tabPrefectures => 'Prefectures';

  @override
  String get tabRegionBattle => 'Region Battle';

  @override
  String get tabHistoryBattle => 'History Battle';

  @override
  String get searchByNameHint => 'Search by name';

  @override
  String get regionAll => 'All';

  @override
  String countSuffix(int count) {
    return '$count';
  }

  @override
  String get legendConquered => 'Conquered';

  @override
  String get legendDifficulty => 'Difficulty';

  @override
  String get regionUnlockHint => 'Clear every prefecture in a region at any difficulty to unlock it';

  @override
  String bossLabel(String name) {
    return 'Boss: $name';
  }

  @override
  String clearedOfTotalPref(int cleared, int total) {
    return '$cleared/$total prefectures';
  }

  @override
  String regionBattleHeader(String name) {
    return '$name Region Battle';
  }

  @override
  String regionBattleSubheader(int waves) {
    return 'WAVE $waves  ／  Path to Regional Unity';
  }

  @override
  String get conqueredBanner => 'Conquered!';

  @override
  String bossSkillLabel(String skill) {
    return 'Skill: \"$skill\"';
  }

  @override
  String targetPrefecturesHeader(int count) {
    return 'Target Prefectures ($count)';
  }

  @override
  String get selectDifficultyLabel => 'Select Difficulty';

  @override
  String get startRegionBattleButton => 'Start Region Battle';

  @override
  String get historyUnlockedBanner => '🏆 National Hard Conquest Complete! History Battles Unlocked!';

  @override
  String get postgameSectionLabel => '⚔️ Post-Game Content';

  @override
  String get historyUnlockHint => 'Clear all 47 prefectures on Hard difficulty to unlock\n\"Age of the Gods\"';

  @override
  String hardClearedProgress(int count) {
    return '$count / 47 prefectures cleared on Hard';
  }

  @override
  String get conqueredBadge => 'Cleared';

  @override
  String bossWaveCount(String name, int waves) {
    return '$name  •  $waves waves';
  }

  @override
  String get historyLockReason1 => 'Unlocks after clearing all prefectures on Hard';

  @override
  String get historyLockReason2 => 'Unlocks after clearing the previous history stage';

  @override
  String get historyConqueredBanner => 'History Battle Conquered!';

  @override
  String wavesUltraHard(int waves) {
    return '$waves waves ・ Ultra Hard';
  }

  @override
  String get startHistoryBattleButton => 'Start History Battle!';

  @override
  String get exclusiveBadge => 'Exclusive';

  @override
  String get difficultyLabel => 'Difficulty';

  @override
  String get terrainLabel => 'Terrain';

  @override
  String get notConqueredLabel => 'Not Conquered';

  @override
  String conqueredDifficultiesLabel(String diffs) {
    return 'Cleared: $diffs';
  }

  @override
  String get capitalCityTitle => 'Capital';

  @override
  String get areaTitle => 'Area';

  @override
  String bossStatsLine(int hp, int attack, String skill) {
    return 'HP $hp / ATK $attack / Skill: \"$skill\"';
  }

  @override
  String get startDefenseButton => 'Start Defense';

  @override
  String get exclusiveFacilityLabel => 'Exclusive Facility';

  @override
  String industryBonusLine(String label, int pct) {
    return '$label facilities boosted +$pct% (lower cost, higher power)';
  }

  @override
  String get geographySea => 'Sea / Coast';

  @override
  String get geographyMountain => 'Mountain';

  @override
  String get geographyUrban => 'Urban';

  @override
  String get geographyAgriculture => 'Agriculture';

  @override
  String get geographyMixed => 'Mixed';

  @override
  String get facilityDescDairyFarm => 'Dairy farm that slows enemies by -20%';

  @override
  String get facilityDescAlpineWatch => 'Long-range watchtower that also slows enemies';

  @override
  String get facilityDescToyotaFactory => 'Rapid attacks plus bonus coin generation';

  @override
  String get facilityDescKiyomizuTemple => '+40% damage dealt to enemies';

  @override
  String get facilityDescPeaceShrine => 'Weakens enemies by shielding them';

  @override
  String get facilityDescShisaGuardian => '40% chance to stun for 1 second';

  @override
  String get facilityDescUmeSakeBrewery => '50% chance to apply slow';

  @override
  String get facilityDescUdonShop => 'Very low cost, rapid attack speed';

  @override
  String get facilityDescDefault => 'Special facility exclusive to this prefecture';

  @override
  String get searchByPrefNameHint => 'Search by prefecture name';

  @override
  String get difficultyDescriptionEasy => 'Enemy HP -20%\nWaves -1\nScore ×0.8';

  @override
  String get difficultyDescriptionNormal => 'Standard difficulty\nEnemy HP ±0%\nWaves ±0';

  @override
  String get difficultyDescriptionHard => 'Enemy HP +15%\nWaves +2\nScore ×1.5';

  @override
  String minSecFormat(int m, int s) {
    return '${m}m ${s}s';
  }

  @override
  String secFormat(int s) {
    return '${s}s';
  }

  @override
  String get victoryTitle => 'Cleared!';

  @override
  String get statTime => 'Time';

  @override
  String get statMistakes => 'Mistakes';

  @override
  String learnAboutPrefHeader(String name) {
    return '📚 Learn about $name!';
  }

  @override
  String get geographySectionTitle => 'Geography';

  @override
  String get industryPopSectionTitle => 'Industry & Population';

  @override
  String get populationTitle => 'Population';

  @override
  String get specialtiesTitle => 'Specialties';

  @override
  String populationApprox(String population) {
    return 'approx. $population';
  }

  @override
  String companionJoinedMessage(String name) {
    return '$name joined your team!';
  }

  @override
  String get badgesEarnedHeader => 'Badges Earned';

  @override
  String bossDefeatedLine(String name) {
    return 'Defeated $name!';
  }

  @override
  String regionConqueredLine(String name) {
    return 'Conquered the $name region';
  }

  @override
  String stageClearedLine(String name) {
    return '$name Cleared!';
  }

  @override
  String get historyMasterAchievedBanner => '🏆 Full Completion! Certified as Guardian of History!';

  @override
  String get retryButton => 'Retry';

  @override
  String get backToMapButton => 'Back to Map';

  @override
  String waveClearShopTitle(int wave) {
    return 'Wave $wave Clear! Shop';
  }

  @override
  String get chooseOneItemHint => 'Choose one item';

  @override
  String get freeLabel => 'Free';

  @override
  String get skipButton => 'Skip';

  @override
  String get cannotPlaceFacility => 'Cannot place facility here';

  @override
  String get notEnoughCoins => 'Not enough coins';

  @override
  String get blocksPath => 'This blocks the path';

  @override
  String get tileOccupied => 'A facility is already here';

  @override
  String notEnoughCoinsNeeded(int cost, int coins) {
    return '🪙 Not enough coins (need: $cost, have: $coins)';
  }

  @override
  String get blocksPathDetailed => '🛤️ This tile blocks the path';

  @override
  String get tileOccupiedDetailed => '⚠️ A facility is already here';

  @override
  String get selectWaveSkillButton => 'Select Wave Skill';

  @override
  String get effectAppliesNextWaveHint => 'The effect applies from the next wave';

  @override
  String get statAttack => 'Attack';

  @override
  String get statRange => 'Range';

  @override
  String get statSpeed => 'Speed';

  @override
  String facilityUpgradeButton(int cost) {
    return 'Upgrade 🪙$cost';
  }

  @override
  String notEnoughCoinsSimple(int cost) {
    return 'Not enough coins (need: $cost)';
  }

  @override
  String sellForButton(int amount) {
    return 'Sell (+$amount🪙)';
  }

  @override
  String get quitConfirmTitle => 'Quit Battle?';

  @override
  String get quitConfirmBody => 'Quit this battle and return to the top screen?';

  @override
  String get continueButton => 'Continue';

  @override
  String get abortButton => 'Quit';

  @override
  String historyBattleWaveBadge(int waves) {
    return 'History Battle $waves waves';
  }

  @override
  String get regionBattleWaveBadge => 'Region Battle 7 waves';

  @override
  String get skillSelectedStatus => 'Skill Selected';

  @override
  String secondsUntilNextWave(int seconds) {
    return 'Next wave in ${seconds}s';
  }

  @override
  String get startNowButton => 'Start Now';

  @override
  String get answerQuizPrompt => 'Answer the quiz!';

  @override
  String get gameStartButton => 'Start!';

  @override
  String waveCounter(int current, int total) {
    return 'Wave $current/$total';
  }

  @override
  String remainingEnemies(int count) {
    return '$count remaining';
  }

  @override
  String nextWavePreviewLabel(int wave) {
    return 'Next W$wave:';
  }

  @override
  String enemyCountSuffix(int count) {
    return '$count  ';
  }

  @override
  String get ultimateReadyLabel => 'Ultimate Ready! Tap!';

  @override
  String get ultimateButtonLabel => 'Ultimate: Territory Defense';

  @override
  String get placeFacilitiesHint => 'Place facilities and\npress \"Start!\"';

  @override
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total';
  }

  @override
  String conquestPercent(String percent) {
    return '$percent% Complete';
  }
}
