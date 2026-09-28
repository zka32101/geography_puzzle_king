import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// App title
  ///
  /// In en, this message translates to:
  /// **'Prefectures Game'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn Prefectures Through Games'**
  String get appSubtitle;

  /// Game description
  ///
  /// In en, this message translates to:
  /// **'Master all 47 prefectures!'**
  String get gameDescription;

  /// No description provided for @nickname.
  ///
  /// In en, this message translates to:
  /// **'Enter Nickname'**
  String get nickname;

  /// No description provided for @nicknameHint.
  ///
  /// In en, this message translates to:
  /// **'tankenkka'**
  String get nicknameHint;

  /// No description provided for @nicknameInstruction.
  ///
  /// In en, this message translates to:
  /// **'Please enter in Hiragana or Katakana'**
  String get nicknameInstruction;

  /// No description provided for @startButton.
  ///
  /// In en, this message translates to:
  /// **'Start!'**
  String get startButton;

  /// No description provided for @errorInvalidNickname.
  ///
  /// In en, this message translates to:
  /// **'Please enter a nickname'**
  String get errorInvalidNickname;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @ranking.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get ranking;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @territory.
  ///
  /// In en, this message translates to:
  /// **'Japan Unification Map'**
  String get territory;

  /// No description provided for @unificationProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get unificationProgress;

  /// No description provided for @prefectures.
  ///
  /// In en, this message translates to:
  /// **'Prefectures'**
  String get prefectures;

  /// No description provided for @globalRanking.
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get globalRanking;

  /// No description provided for @prefectureVersus.
  ///
  /// In en, this message translates to:
  /// **'Prefecture Rivalry'**
  String get prefectureVersus;

  /// No description provided for @userInfo.
  ///
  /// In en, this message translates to:
  /// **'User Info'**
  String get userInfo;

  /// No description provided for @playerName.
  ///
  /// In en, this message translates to:
  /// **'Player Name'**
  String get playerName;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @dailyEvents.
  ///
  /// In en, this message translates to:
  /// **'Daily Events & Battle Notifications'**
  String get dailyEvents;

  /// No description provided for @soundSettings.
  ///
  /// In en, this message translates to:
  /// **'Sound Settings'**
  String get soundSettings;

  /// No description provided for @bgm.
  ///
  /// In en, this message translates to:
  /// **'BGM'**
  String get bgm;

  /// No description provided for @backgroundMusic.
  ///
  /// In en, this message translates to:
  /// **'Background Music'**
  String get backgroundMusic;

  /// No description provided for @sfx.
  ///
  /// In en, this message translates to:
  /// **'Sound Effects'**
  String get sfx;

  /// No description provided for @sfxDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable in-game sound effects'**
  String get sfxDescription;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSelect.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languageSelect;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Other'**
  String get privacySettings;

  /// No description provided for @rankingDisplay.
  ///
  /// In en, this message translates to:
  /// **'Ranking Display'**
  String get rankingDisplay;

  /// No description provided for @hideFromRanking.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hideFromRanking;

  /// No description provided for @showInRanking.
  ///
  /// In en, this message translates to:
  /// **'Show Player Name'**
  String get showInRanking;

  /// No description provided for @clearedPrefectures.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get clearedPrefectures;

  /// No description provided for @totalPlayers.
  ///
  /// In en, this message translates to:
  /// **'Players'**
  String get totalPlayers;

  /// No description provided for @gameTitle.
  ///
  /// In en, this message translates to:
  /// **'Geography Puzzle King'**
  String get gameTitle;

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get startGame;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @stage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get stage;

  /// No description provided for @gameOver.
  ///
  /// In en, this message translates to:
  /// **'Game Over'**
  String get gameOver;

  /// No description provided for @victory.
  ///
  /// In en, this message translates to:
  /// **'Victory'**
  String get victory;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @pokedex.
  ///
  /// In en, this message translates to:
  /// **'Pokedex'**
  String get pokedex;

  /// No description provided for @hqUpgrade.
  ///
  /// In en, this message translates to:
  /// **'HQ Upgrade'**
  String get hqUpgrade;

  /// No description provided for @nationalConquest.
  ///
  /// In en, this message translates to:
  /// **'National Conquest'**
  String get nationalConquest;

  /// No description provided for @deploy.
  ///
  /// In en, this message translates to:
  /// **'Deploy'**
  String get deploy;

  /// No description provided for @deploySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a prefecture to start defending'**
  String get deploySubtitle;

  /// No description provided for @conqueredCount.
  ///
  /// In en, this message translates to:
  /// **'Conquered'**
  String get conqueredCount;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get totalScore;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @commanderName.
  ///
  /// In en, this message translates to:
  /// **'Commander {name}'**
  String commanderName(String name);

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'App Info'**
  String get appInfo;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @buildNumber.
  ///
  /// In en, this message translates to:
  /// **'Build Number'**
  String get buildNumber;

  /// No description provided for @adsAndPurchases.
  ///
  /// In en, this message translates to:
  /// **'Ads & Purchases'**
  String get adsAndPurchases;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @termsOfServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceTitle;

  /// No description provided for @removeAds.
  ///
  /// In en, this message translates to:
  /// **'Remove Ads'**
  String get removeAds;

  /// No description provided for @removeAdsPurchased.
  ///
  /// In en, this message translates to:
  /// **'Ads Removed (Purchased)'**
  String get removeAdsPurchased;

  /// No description provided for @purchaseThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your purchase'**
  String get purchaseThankYou;

  /// No description provided for @storeConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the store'**
  String get storeConnectionError;

  /// No description provided for @notAvailableNow.
  ///
  /// In en, this message translates to:
  /// **'Not available right now'**
  String get notAvailableNow;

  /// No description provided for @purchaseButton.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchaseButton;

  /// No description provided for @guestPlayer.
  ///
  /// In en, this message translates to:
  /// **'Guest Player'**
  String get guestPlayer;

  /// No description provided for @changePlayerName.
  ///
  /// In en, this message translates to:
  /// **'Change Player Name'**
  String get changePlayerName;

  /// No description provided for @personalInfoWarning.
  ///
  /// In en, this message translates to:
  /// **'Please don\'t enter personal information (real name, address, etc.). It may be shown to other players.'**
  String get personalInfoWarning;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @removeAdsDescription.
  ///
  /// In en, this message translates to:
  /// **'{price} — removes all in-game ads'**
  String removeAdsDescription(String price);

  /// No description provided for @unlockMap.
  ///
  /// In en, this message translates to:
  /// **'Unlock All Prefectures'**
  String get unlockMap;

  /// No description provided for @unlockMapPurchased.
  ///
  /// In en, this message translates to:
  /// **'All Prefectures Unlocked'**
  String get unlockMapPurchased;

  /// No description provided for @unlockMapThankYou.
  ///
  /// In en, this message translates to:
  /// **'All 47 prefectures are now playable'**
  String get unlockMapThankYou;

  /// No description provided for @unlockMapDescription.
  ///
  /// In en, this message translates to:
  /// **'{price} — unlocks all 47 prefectures, region battles & history stages'**
  String unlockMapDescription(String price);

  /// No description provided for @stageLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'🔒 This Prefecture Is Locked'**
  String get stageLockedTitle;

  /// No description provided for @stageLockedBody.
  ///
  /// In en, this message translates to:
  /// **'Only the first {count} prefectures are free to play.\nPurchase \"Unlock All Prefectures\" to play all 47.'**
  String stageLockedBody(int count);

  /// No description provided for @goToPurchaseButton.
  ///
  /// In en, this message translates to:
  /// **'Go to Purchase'**
  String get goToPurchaseButton;

  /// No description provided for @rankingTitle.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get rankingTitle;

  /// No description provided for @rankingTabGlobal.
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get rankingTabGlobal;

  /// No description provided for @rankingTabPrefecture.
  ///
  /// In en, this message translates to:
  /// **'Prefecture Rivalry'**
  String get rankingTabPrefecture;

  /// No description provided for @rankingClearedCount.
  ///
  /// In en, this message translates to:
  /// **'Cleared: {cleared} / 47'**
  String rankingClearedCount(int cleared);

  /// No description provided for @pointsSuffix.
  ///
  /// In en, this message translates to:
  /// **'pts'**
  String get pointsSuffix;

  /// No description provided for @rankingPlayerCount.
  ///
  /// In en, this message translates to:
  /// **'Players: {count}'**
  String rankingPlayerCount(int count);

  /// No description provided for @territoryMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Japan Unification Map'**
  String get territoryMapTitle;

  /// No description provided for @genericErrorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String genericErrorPrefix(String error);

  /// No description provided for @territoryUnificationLabel.
  ///
  /// In en, this message translates to:
  /// **'National Unification'**
  String get territoryUnificationLabel;

  /// No description provided for @statsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'📊 Statistics'**
  String get statsSectionTitle;

  /// No description provided for @statTotalClears.
  ///
  /// In en, this message translates to:
  /// **'Total Clears'**
  String get statTotalClears;

  /// No description provided for @statAverageLevel.
  ///
  /// In en, this message translates to:
  /// **'Average Level'**
  String get statAverageLevel;

  /// No description provided for @statHighScore.
  ///
  /// In en, this message translates to:
  /// **'High Score'**
  String get statHighScore;

  /// No description provided for @timesSuffix.
  ///
  /// In en, this message translates to:
  /// **'{count} times'**
  String timesSuffix(int count);

  /// No description provided for @pokedexTitle.
  ///
  /// In en, this message translates to:
  /// **'Pokedex'**
  String get pokedexTitle;

  /// No description provided for @pokedexTabCleared.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get pokedexTabCleared;

  /// No description provided for @pokedexTabStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get pokedexTabStats;

  /// No description provided for @pokedexTabAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get pokedexTabAchievements;

  /// No description provided for @clearProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Clear Progress'**
  String get clearProgressLabel;

  /// No description provided for @percentComplete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Complete'**
  String percentComplete(String percent);

  /// No description provided for @learningStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning Stats'**
  String get learningStatsTitle;

  /// No description provided for @statClearedPrefCount.
  ///
  /// In en, this message translates to:
  /// **'Prefectures Cleared'**
  String get statClearedPrefCount;

  /// No description provided for @statTotalPlayTime.
  ///
  /// In en, this message translates to:
  /// **'Total Play Time'**
  String get statTotalPlayTime;

  /// No description provided for @hoursMinutesFormat.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String hoursMinutesFormat(int hours, int minutes);

  /// No description provided for @statTotalScore.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get statTotalScore;

  /// No description provided for @statTotalGamesPlayed.
  ///
  /// In en, this message translates to:
  /// **'Total Games Played'**
  String get statTotalGamesPlayed;

  /// No description provided for @clearsByDifficultyLabel.
  ///
  /// In en, this message translates to:
  /// **'Clears by Difficulty'**
  String get clearsByDifficultyLabel;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @kanaLabel.
  ///
  /// In en, this message translates to:
  /// **'Kana: '**
  String get kanaLabel;

  /// No description provided for @capitalCityLabel.
  ///
  /// In en, this message translates to:
  /// **'Capital: '**
  String get capitalCityLabel;

  /// No description provided for @populationLabel.
  ///
  /// In en, this message translates to:
  /// **'Population: approx. {population}'**
  String populationLabel(String population);

  /// No description provided for @areaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area: '**
  String get areaLabel;

  /// No description provided for @bestScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Best Score: {score} pts'**
  String bestScoreLabel(String score);

  /// No description provided for @clearedDifficultiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Cleared Difficulties: '**
  String get clearedDifficultiesLabel;

  /// No description provided for @specialtiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Specialties: '**
  String get specialtiesLabel;

  /// No description provided for @closeButton.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButton;

  /// No description provided for @researchPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'Research Points'**
  String get researchPointsLabel;

  /// No description provided for @researchPointsHint.
  ///
  /// In en, this message translates to:
  /// **'Earned by clearing prefectures'**
  String get researchPointsHint;

  /// No description provided for @levelFraction.
  ///
  /// In en, this message translates to:
  /// **'Lv.{level} / {max}'**
  String levelFraction(int level, int max);

  /// No description provided for @currentEffectLabel.
  ///
  /// In en, this message translates to:
  /// **'Current effect: {effect}'**
  String currentEffectLabel(String effect);

  /// No description provided for @maxLabel.
  ///
  /// In en, this message translates to:
  /// **'MAX'**
  String get maxLabel;

  /// No description provided for @upgradeForCostButton.
  ///
  /// In en, this message translates to:
  /// **'🔬{cost} Upgrade'**
  String upgradeForCostButton(int cost);

  /// No description provided for @hqTrackAttackTitle.
  ///
  /// In en, this message translates to:
  /// **'⚔️ Weapons Development'**
  String get hqTrackAttackTitle;

  /// No description provided for @hqTrackCoinTitle.
  ///
  /// In en, this message translates to:
  /// **'💰 Economic Policy'**
  String get hqTrackCoinTitle;

  /// No description provided for @hqTrackHpTitle.
  ///
  /// In en, this message translates to:
  /// **'🏯 Wall Fortification'**
  String get hqTrackHpTitle;

  /// No description provided for @hqTrackAttackDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently increases all facility damage'**
  String get hqTrackAttackDescription;

  /// No description provided for @hqTrackCoinDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently increases coins earned per kill'**
  String get hqTrackCoinDescription;

  /// No description provided for @hqTrackHpDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently increases starting HP for all stages'**
  String get hqTrackHpDescription;

  /// No description provided for @selectPrefectureTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Prefecture'**
  String get selectPrefectureTitle;

  /// No description provided for @tabPrefectures.
  ///
  /// In en, this message translates to:
  /// **'Prefectures'**
  String get tabPrefectures;

  /// No description provided for @tabRegionBattle.
  ///
  /// In en, this message translates to:
  /// **'Region Battle'**
  String get tabRegionBattle;

  /// No description provided for @tabHistoryBattle.
  ///
  /// In en, this message translates to:
  /// **'History Battle'**
  String get tabHistoryBattle;

  /// No description provided for @searchByNameHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get searchByNameHint;

  /// No description provided for @regionAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get regionAll;

  /// No description provided for @countSuffix.
  ///
  /// In en, this message translates to:
  /// **'{count}'**
  String countSuffix(int count);

  /// No description provided for @legendConquered.
  ///
  /// In en, this message translates to:
  /// **'Conquered'**
  String get legendConquered;

  /// No description provided for @legendDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get legendDifficulty;

  /// No description provided for @regionUnlockHint.
  ///
  /// In en, this message translates to:
  /// **'Clear every prefecture in a region at any difficulty to unlock it'**
  String get regionUnlockHint;

  /// No description provided for @bossLabel.
  ///
  /// In en, this message translates to:
  /// **'Boss: {name}'**
  String bossLabel(String name);

  /// No description provided for @clearedOfTotalPref.
  ///
  /// In en, this message translates to:
  /// **'{cleared}/{total} prefectures'**
  String clearedOfTotalPref(int cleared, int total);

  /// No description provided for @regionBattleHeader.
  ///
  /// In en, this message translates to:
  /// **'{name} Region Battle'**
  String regionBattleHeader(String name);

  /// No description provided for @regionBattleSubheader.
  ///
  /// In en, this message translates to:
  /// **'WAVE {waves}  ／  Path to Regional Unity'**
  String regionBattleSubheader(int waves);

  /// No description provided for @conqueredBanner.
  ///
  /// In en, this message translates to:
  /// **'Conquered!'**
  String get conqueredBanner;

  /// No description provided for @bossSkillLabel.
  ///
  /// In en, this message translates to:
  /// **'Skill: \"{skill}\"'**
  String bossSkillLabel(String skill);

  /// No description provided for @targetPrefecturesHeader.
  ///
  /// In en, this message translates to:
  /// **'Target Prefectures ({count})'**
  String targetPrefecturesHeader(int count);

  /// No description provided for @selectDifficultyLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Difficulty'**
  String get selectDifficultyLabel;

  /// No description provided for @startRegionBattleButton.
  ///
  /// In en, this message translates to:
  /// **'Start Region Battle'**
  String get startRegionBattleButton;

  /// No description provided for @historyUnlockedBanner.
  ///
  /// In en, this message translates to:
  /// **'🏆 National Hard Conquest Complete! History Battles Unlocked!'**
  String get historyUnlockedBanner;

  /// No description provided for @postgameSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'⚔️ Post-Game Content'**
  String get postgameSectionLabel;

  /// No description provided for @historyUnlockHint.
  ///
  /// In en, this message translates to:
  /// **'Clear all 47 prefectures on Hard difficulty to unlock\n\"Age of the Gods\"'**
  String get historyUnlockHint;

  /// No description provided for @hardClearedProgress.
  ///
  /// In en, this message translates to:
  /// **'{count} / 47 prefectures cleared on Hard'**
  String hardClearedProgress(int count);

  /// No description provided for @conqueredBadge.
  ///
  /// In en, this message translates to:
  /// **'Cleared'**
  String get conqueredBadge;

  /// No description provided for @bossWaveCount.
  ///
  /// In en, this message translates to:
  /// **'{name}  •  {waves} waves'**
  String bossWaveCount(String name, int waves);

  /// No description provided for @historyLockReason1.
  ///
  /// In en, this message translates to:
  /// **'Unlocks after clearing all prefectures on Hard'**
  String get historyLockReason1;

  /// No description provided for @historyLockReason2.
  ///
  /// In en, this message translates to:
  /// **'Unlocks after clearing the previous history stage'**
  String get historyLockReason2;

  /// No description provided for @historyConqueredBanner.
  ///
  /// In en, this message translates to:
  /// **'History Battle Conquered!'**
  String get historyConqueredBanner;

  /// No description provided for @wavesUltraHard.
  ///
  /// In en, this message translates to:
  /// **'{waves} waves ・ Ultra Hard'**
  String wavesUltraHard(int waves);

  /// No description provided for @startHistoryBattleButton.
  ///
  /// In en, this message translates to:
  /// **'Start History Battle!'**
  String get startHistoryBattleButton;

  /// No description provided for @exclusiveBadge.
  ///
  /// In en, this message translates to:
  /// **'Exclusive'**
  String get exclusiveBadge;

  /// No description provided for @difficultyLabel.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficultyLabel;

  /// No description provided for @terrainLabel.
  ///
  /// In en, this message translates to:
  /// **'Terrain'**
  String get terrainLabel;

  /// No description provided for @notConqueredLabel.
  ///
  /// In en, this message translates to:
  /// **'Not Conquered'**
  String get notConqueredLabel;

  /// No description provided for @conqueredDifficultiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Cleared: {diffs}'**
  String conqueredDifficultiesLabel(String diffs);

  /// No description provided for @capitalCityTitle.
  ///
  /// In en, this message translates to:
  /// **'Capital'**
  String get capitalCityTitle;

  /// No description provided for @areaTitle.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get areaTitle;

  /// No description provided for @bossStatsLine.
  ///
  /// In en, this message translates to:
  /// **'HP {hp} / ATK {attack} / Skill: \"{skill}\"'**
  String bossStatsLine(int hp, int attack, String skill);

  /// No description provided for @startDefenseButton.
  ///
  /// In en, this message translates to:
  /// **'Start Defense'**
  String get startDefenseButton;

  /// No description provided for @exclusiveFacilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Exclusive Facility'**
  String get exclusiveFacilityLabel;

  /// No description provided for @industryBonusLine.
  ///
  /// In en, this message translates to:
  /// **'{label} facilities boosted +{pct}% (lower cost, higher power)'**
  String industryBonusLine(String label, int pct);

  /// No description provided for @geographySea.
  ///
  /// In en, this message translates to:
  /// **'Sea / Coast'**
  String get geographySea;

  /// No description provided for @geographyMountain.
  ///
  /// In en, this message translates to:
  /// **'Mountain'**
  String get geographyMountain;

  /// No description provided for @geographyUrban.
  ///
  /// In en, this message translates to:
  /// **'Urban'**
  String get geographyUrban;

  /// No description provided for @geographyAgriculture.
  ///
  /// In en, this message translates to:
  /// **'Agriculture'**
  String get geographyAgriculture;

  /// No description provided for @geographyMixed.
  ///
  /// In en, this message translates to:
  /// **'Mixed'**
  String get geographyMixed;

  /// No description provided for @facilityDescDairyFarm.
  ///
  /// In en, this message translates to:
  /// **'Dairy farm that slows enemies by -20%'**
  String get facilityDescDairyFarm;

  /// No description provided for @facilityDescAlpineWatch.
  ///
  /// In en, this message translates to:
  /// **'Long-range watchtower that also slows enemies'**
  String get facilityDescAlpineWatch;

  /// No description provided for @facilityDescToyotaFactory.
  ///
  /// In en, this message translates to:
  /// **'Rapid attacks plus bonus coin generation'**
  String get facilityDescToyotaFactory;

  /// No description provided for @facilityDescKiyomizuTemple.
  ///
  /// In en, this message translates to:
  /// **'+40% damage dealt to enemies'**
  String get facilityDescKiyomizuTemple;

  /// No description provided for @facilityDescPeaceShrine.
  ///
  /// In en, this message translates to:
  /// **'Weakens enemies by shielding them'**
  String get facilityDescPeaceShrine;

  /// No description provided for @facilityDescShisaGuardian.
  ///
  /// In en, this message translates to:
  /// **'40% chance to stun for 1 second'**
  String get facilityDescShisaGuardian;

  /// No description provided for @facilityDescUmeSakeBrewery.
  ///
  /// In en, this message translates to:
  /// **'50% chance to apply slow'**
  String get facilityDescUmeSakeBrewery;

  /// No description provided for @facilityDescUdonShop.
  ///
  /// In en, this message translates to:
  /// **'Very low cost, rapid attack speed'**
  String get facilityDescUdonShop;

  /// No description provided for @facilityDescDefault.
  ///
  /// In en, this message translates to:
  /// **'Special facility exclusive to this prefecture'**
  String get facilityDescDefault;

  /// No description provided for @searchByPrefNameHint.
  ///
  /// In en, this message translates to:
  /// **'Search by prefecture name'**
  String get searchByPrefNameHint;

  /// No description provided for @difficultyDescriptionEasy.
  ///
  /// In en, this message translates to:
  /// **'Enemy HP -20%\nWaves -1\nScore ×0.8'**
  String get difficultyDescriptionEasy;

  /// No description provided for @difficultyDescriptionNormal.
  ///
  /// In en, this message translates to:
  /// **'Standard difficulty\nEnemy HP ±0%\nWaves ±0'**
  String get difficultyDescriptionNormal;

  /// No description provided for @difficultyDescriptionHard.
  ///
  /// In en, this message translates to:
  /// **'Enemy HP +15%\nWaves +2\nScore ×1.5'**
  String get difficultyDescriptionHard;

  /// No description provided for @minSecFormat.
  ///
  /// In en, this message translates to:
  /// **'{m}m {s}s'**
  String minSecFormat(int m, int s);

  /// No description provided for @secFormat.
  ///
  /// In en, this message translates to:
  /// **'{s}s'**
  String secFormat(int s);

  /// No description provided for @victoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Cleared!'**
  String get victoryTitle;

  /// No description provided for @statTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get statTime;

  /// No description provided for @statMistakes.
  ///
  /// In en, this message translates to:
  /// **'Mistakes'**
  String get statMistakes;

  /// No description provided for @learnAboutPrefHeader.
  ///
  /// In en, this message translates to:
  /// **'📚 Learn about {name}!'**
  String learnAboutPrefHeader(String name);

  /// No description provided for @geographySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get geographySectionTitle;

  /// No description provided for @industryPopSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Industry & Population'**
  String get industryPopSectionTitle;

  /// No description provided for @populationTitle.
  ///
  /// In en, this message translates to:
  /// **'Population'**
  String get populationTitle;

  /// No description provided for @specialtiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Specialties'**
  String get specialtiesTitle;

  /// No description provided for @populationApprox.
  ///
  /// In en, this message translates to:
  /// **'approx. {population}'**
  String populationApprox(String population);

  /// No description provided for @companionJoinedMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} joined your team!'**
  String companionJoinedMessage(String name);

  /// No description provided for @badgesEarnedHeader.
  ///
  /// In en, this message translates to:
  /// **'Badges Earned'**
  String get badgesEarnedHeader;

  /// No description provided for @bossDefeatedLine.
  ///
  /// In en, this message translates to:
  /// **'Defeated {name}!'**
  String bossDefeatedLine(String name);

  /// No description provided for @regionConqueredLine.
  ///
  /// In en, this message translates to:
  /// **'Conquered the {name} region'**
  String regionConqueredLine(String name);

  /// No description provided for @stageClearedLine.
  ///
  /// In en, this message translates to:
  /// **'{name} Cleared!'**
  String stageClearedLine(String name);

  /// No description provided for @historyMasterAchievedBanner.
  ///
  /// In en, this message translates to:
  /// **'🏆 Full Completion! Certified as Guardian of History!'**
  String get historyMasterAchievedBanner;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @backToMapButton.
  ///
  /// In en, this message translates to:
  /// **'Back to Map'**
  String get backToMapButton;

  /// No description provided for @waveClearShopTitle.
  ///
  /// In en, this message translates to:
  /// **'Wave {wave} Clear! Shop'**
  String waveClearShopTitle(int wave);

  /// No description provided for @chooseOneItemHint.
  ///
  /// In en, this message translates to:
  /// **'Choose one item'**
  String get chooseOneItemHint;

  /// No description provided for @freeLabel.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get freeLabel;

  /// No description provided for @skipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipButton;

  /// No description provided for @cannotPlaceFacility.
  ///
  /// In en, this message translates to:
  /// **'Cannot place facility here'**
  String get cannotPlaceFacility;

  /// No description provided for @notEnoughCoins.
  ///
  /// In en, this message translates to:
  /// **'Not enough coins'**
  String get notEnoughCoins;

  /// No description provided for @blocksPath.
  ///
  /// In en, this message translates to:
  /// **'This blocks the path'**
  String get blocksPath;

  /// No description provided for @tileOccupied.
  ///
  /// In en, this message translates to:
  /// **'A facility is already here'**
  String get tileOccupied;

  /// No description provided for @notEnoughCoinsNeeded.
  ///
  /// In en, this message translates to:
  /// **'🪙 Not enough coins (need: {cost}, have: {coins})'**
  String notEnoughCoinsNeeded(int cost, int coins);

  /// No description provided for @blocksPathDetailed.
  ///
  /// In en, this message translates to:
  /// **'🛤️ This tile blocks the path'**
  String get blocksPathDetailed;

  /// No description provided for @tileOccupiedDetailed.
  ///
  /// In en, this message translates to:
  /// **'⚠️ A facility is already here'**
  String get tileOccupiedDetailed;

  /// No description provided for @selectWaveSkillButton.
  ///
  /// In en, this message translates to:
  /// **'Select Wave Skill'**
  String get selectWaveSkillButton;

  /// No description provided for @effectAppliesNextWaveHint.
  ///
  /// In en, this message translates to:
  /// **'The effect applies from the next wave'**
  String get effectAppliesNextWaveHint;

  /// No description provided for @statAttack.
  ///
  /// In en, this message translates to:
  /// **'Attack'**
  String get statAttack;

  /// No description provided for @statRange.
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get statRange;

  /// No description provided for @statSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get statSpeed;

  /// No description provided for @facilityUpgradeButton.
  ///
  /// In en, this message translates to:
  /// **'Upgrade 🪙{cost}'**
  String facilityUpgradeButton(int cost);

  /// No description provided for @notEnoughCoinsSimple.
  ///
  /// In en, this message translates to:
  /// **'Not enough coins (need: {cost})'**
  String notEnoughCoinsSimple(int cost);

  /// No description provided for @sellForButton.
  ///
  /// In en, this message translates to:
  /// **'Sell (+{amount}🪙)'**
  String sellForButton(int amount);

  /// No description provided for @quitConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Quit Battle?'**
  String get quitConfirmTitle;

  /// No description provided for @quitConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Quit this battle and return to the top screen?'**
  String get quitConfirmBody;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @abortButton.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get abortButton;

  /// No description provided for @historyBattleWaveBadge.
  ///
  /// In en, this message translates to:
  /// **'History Battle {waves} waves'**
  String historyBattleWaveBadge(int waves);

  /// No description provided for @regionBattleWaveBadge.
  ///
  /// In en, this message translates to:
  /// **'Region Battle 7 waves'**
  String get regionBattleWaveBadge;

  /// No description provided for @skillSelectedStatus.
  ///
  /// In en, this message translates to:
  /// **'Skill Selected'**
  String get skillSelectedStatus;

  /// No description provided for @secondsUntilNextWave.
  ///
  /// In en, this message translates to:
  /// **'Next wave in {seconds}s'**
  String secondsUntilNextWave(int seconds);

  /// No description provided for @startNowButton.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get startNowButton;

  /// No description provided for @answerQuizPrompt.
  ///
  /// In en, this message translates to:
  /// **'Answer the quiz!'**
  String get answerQuizPrompt;

  /// No description provided for @gameStartButton.
  ///
  /// In en, this message translates to:
  /// **'Start!'**
  String get gameStartButton;

  /// No description provided for @waveCounter.
  ///
  /// In en, this message translates to:
  /// **'Wave {current}/{total}'**
  String waveCounter(int current, int total);

  /// No description provided for @remainingEnemies.
  ///
  /// In en, this message translates to:
  /// **'{count} remaining'**
  String remainingEnemies(int count);

  /// No description provided for @nextWavePreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Next W{wave}:'**
  String nextWavePreviewLabel(int wave);

  /// No description provided for @enemyCountSuffix.
  ///
  /// In en, this message translates to:
  /// **'{count}  '**
  String enemyCountSuffix(int count);

  /// No description provided for @ultimateReadyLabel.
  ///
  /// In en, this message translates to:
  /// **'Ultimate Ready! Tap!'**
  String get ultimateReadyLabel;

  /// No description provided for @ultimateButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Ultimate: Territory Defense'**
  String get ultimateButtonLabel;

  /// No description provided for @placeFacilitiesHint.
  ///
  /// In en, this message translates to:
  /// **'Place facilities and\npress \"Start!\"'**
  String get placeFacilitiesHint;

  /// No description provided for @clearedOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{cleared} / {total}'**
  String clearedOfTotal(int cleared, int total);

  /// No description provided for @conquestPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Complete'**
  String conquestPercent(String percent);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
