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
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total';
  }

  @override
  String conquestPercent(String percent) {
    return '$percent% Complete';
  }
}
