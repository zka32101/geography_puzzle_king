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
