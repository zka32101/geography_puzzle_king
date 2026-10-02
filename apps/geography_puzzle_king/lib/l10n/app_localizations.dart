import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_zh.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
    Locale('zh'),
  ];

  /// アプリのタイトル
  ///
  /// In ja, this message translates to:
  /// **'都道府県ゲーム'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In ja, this message translates to:
  /// **'ゲームで学ぶ都道府県'**
  String get appSubtitle;

  /// ゲームの説明文
  ///
  /// In ja, this message translates to:
  /// **'47都道府県を守り抜け！'**
  String get gameDescription;

  /// No description provided for @nickname.
  ///
  /// In ja, this message translates to:
  /// **'ニックネームを入力'**
  String get nickname;

  /// No description provided for @nicknameHint.
  ///
  /// In ja, this message translates to:
  /// **'たんけんか'**
  String get nicknameHint;

  /// No description provided for @nicknameInstruction.
  ///
  /// In ja, this message translates to:
  /// **'ひらがなまたはカタカナで入力してください'**
  String get nicknameInstruction;

  /// No description provided for @startButton.
  ///
  /// In ja, this message translates to:
  /// **'はじめる！'**
  String get startButton;

  /// No description provided for @errorInvalidNickname.
  ///
  /// In ja, this message translates to:
  /// **'ニックネームを入力してください'**
  String get errorInvalidNickname;

  /// No description provided for @home.
  ///
  /// In ja, this message translates to:
  /// **'ホーム'**
  String get home;

  /// No description provided for @game.
  ///
  /// In ja, this message translates to:
  /// **'ゲーム'**
  String get game;

  /// No description provided for @map.
  ///
  /// In ja, this message translates to:
  /// **'地図'**
  String get map;

  /// No description provided for @ranking.
  ///
  /// In ja, this message translates to:
  /// **'ランキング'**
  String get ranking;

  /// No description provided for @settings.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get settings;

  /// No description provided for @territory.
  ///
  /// In ja, this message translates to:
  /// **'日本統一マップ'**
  String get territory;

  /// No description provided for @unificationProgress.
  ///
  /// In ja, this message translates to:
  /// **'統一度'**
  String get unificationProgress;

  /// No description provided for @prefectures.
  ///
  /// In ja, this message translates to:
  /// **'都道府県'**
  String get prefectures;

  /// No description provided for @globalRanking.
  ///
  /// In ja, this message translates to:
  /// **'グローバル'**
  String get globalRanking;

  /// No description provided for @prefectureVersus.
  ///
  /// In ja, this message translates to:
  /// **'都道府県対抗'**
  String get prefectureVersus;

  /// No description provided for @userInfo.
  ///
  /// In ja, this message translates to:
  /// **'ユーザー情報'**
  String get userInfo;

  /// No description provided for @playerName.
  ///
  /// In ja, this message translates to:
  /// **'プレイヤー名'**
  String get playerName;

  /// No description provided for @notifications.
  ///
  /// In ja, this message translates to:
  /// **'通知設定'**
  String get notifications;

  /// No description provided for @pushNotifications.
  ///
  /// In ja, this message translates to:
  /// **'プッシュ通知'**
  String get pushNotifications;

  /// No description provided for @dailyEvents.
  ///
  /// In ja, this message translates to:
  /// **'デイリーイベント・対戦通知'**
  String get dailyEvents;

  /// No description provided for @soundSettings.
  ///
  /// In ja, this message translates to:
  /// **'サウンド設定'**
  String get soundSettings;

  /// No description provided for @bgm.
  ///
  /// In ja, this message translates to:
  /// **'BGM'**
  String get bgm;

  /// No description provided for @backgroundMusic.
  ///
  /// In ja, this message translates to:
  /// **'バックグラウンドミュージック'**
  String get backgroundMusic;

  /// No description provided for @sfx.
  ///
  /// In ja, this message translates to:
  /// **'効果音'**
  String get sfx;

  /// No description provided for @sfxDescription.
  ///
  /// In ja, this message translates to:
  /// **'ゲーム内の効果音を有効'**
  String get sfxDescription;

  /// No description provided for @language.
  ///
  /// In ja, this message translates to:
  /// **'言語設定'**
  String get language;

  /// No description provided for @languageSelect.
  ///
  /// In ja, this message translates to:
  /// **'言語'**
  String get languageSelect;

  /// No description provided for @privacySettings.
  ///
  /// In ja, this message translates to:
  /// **'プライバシー・その他'**
  String get privacySettings;

  /// No description provided for @rankingDisplay.
  ///
  /// In ja, this message translates to:
  /// **'ランキング表示'**
  String get rankingDisplay;

  /// No description provided for @hideFromRanking.
  ///
  /// In ja, this message translates to:
  /// **'非表示'**
  String get hideFromRanking;

  /// No description provided for @showInRanking.
  ///
  /// In ja, this message translates to:
  /// **'プレイヤー名を表示'**
  String get showInRanking;

  /// No description provided for @clearedPrefectures.
  ///
  /// In ja, this message translates to:
  /// **'クリア県'**
  String get clearedPrefectures;

  /// No description provided for @totalPlayers.
  ///
  /// In ja, this message translates to:
  /// **'プレイヤー'**
  String get totalPlayers;

  /// No description provided for @gameTitle.
  ///
  /// In ja, this message translates to:
  /// **'地理パズル王'**
  String get gameTitle;

  /// No description provided for @startGame.
  ///
  /// In ja, this message translates to:
  /// **'ゲーム開始'**
  String get startGame;

  /// No description provided for @profile.
  ///
  /// In ja, this message translates to:
  /// **'プロフィール'**
  String get profile;

  /// No description provided for @japanese.
  ///
  /// In ja, this message translates to:
  /// **'日本語'**
  String get japanese;

  /// No description provided for @english.
  ///
  /// In ja, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @chinese.
  ///
  /// In ja, this message translates to:
  /// **'中国語'**
  String get chinese;

  /// No description provided for @korean.
  ///
  /// In ja, this message translates to:
  /// **'韓国語'**
  String get korean;

  /// No description provided for @difficulty.
  ///
  /// In ja, this message translates to:
  /// **'難易度'**
  String get difficulty;

  /// No description provided for @easy.
  ///
  /// In ja, this message translates to:
  /// **'イージー'**
  String get easy;

  /// No description provided for @normal.
  ///
  /// In ja, this message translates to:
  /// **'ノーマル'**
  String get normal;

  /// No description provided for @hard.
  ///
  /// In ja, this message translates to:
  /// **'ハード'**
  String get hard;

  /// No description provided for @score.
  ///
  /// In ja, this message translates to:
  /// **'スコア'**
  String get score;

  /// No description provided for @level.
  ///
  /// In ja, this message translates to:
  /// **'レベル'**
  String get level;

  /// No description provided for @stage.
  ///
  /// In ja, this message translates to:
  /// **'ステージ'**
  String get stage;

  /// No description provided for @gameOver.
  ///
  /// In ja, this message translates to:
  /// **'ゲームオーバー'**
  String get gameOver;

  /// No description provided for @victory.
  ///
  /// In ja, this message translates to:
  /// **'勝利'**
  String get victory;

  /// No description provided for @retry.
  ///
  /// In ja, this message translates to:
  /// **'リトライ'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In ja, this message translates to:
  /// **'戻る'**
  String get back;

  /// No description provided for @ok.
  ///
  /// In ja, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get cancel;

  /// No description provided for @loading.
  ///
  /// In ja, this message translates to:
  /// **'ローディング中...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In ja, this message translates to:
  /// **'エラー'**
  String get error;

  /// No description provided for @tryAgain.
  ///
  /// In ja, this message translates to:
  /// **'もう一度試す'**
  String get tryAgain;

  /// No description provided for @menu.
  ///
  /// In ja, this message translates to:
  /// **'メニュー'**
  String get menu;

  /// No description provided for @pokedex.
  ///
  /// In ja, this message translates to:
  /// **'図鑑'**
  String get pokedex;

  /// No description provided for @hqUpgrade.
  ///
  /// In ja, this message translates to:
  /// **'本部強化'**
  String get hqUpgrade;

  /// No description provided for @nationalConquest.
  ///
  /// In ja, this message translates to:
  /// **'全国制圧'**
  String get nationalConquest;

  /// No description provided for @deploy.
  ///
  /// In ja, this message translates to:
  /// **'出撃する'**
  String get deploy;

  /// No description provided for @deploySubtitle.
  ///
  /// In ja, this message translates to:
  /// **'都道府県を選んで防衛開始'**
  String get deploySubtitle;

  /// No description provided for @conqueredCount.
  ///
  /// In ja, this message translates to:
  /// **'制圧県'**
  String get conqueredCount;

  /// No description provided for @totalScore.
  ///
  /// In ja, this message translates to:
  /// **'総スコア'**
  String get totalScore;

  /// No description provided for @achievements.
  ///
  /// In ja, this message translates to:
  /// **'実績'**
  String get achievements;

  /// No description provided for @commanderName.
  ///
  /// In ja, this message translates to:
  /// **'指揮官 {name}'**
  String commanderName(String name);

  /// No description provided for @appInfo.
  ///
  /// In ja, this message translates to:
  /// **'アプリ情報'**
  String get appInfo;

  /// No description provided for @version.
  ///
  /// In ja, this message translates to:
  /// **'バージョン'**
  String get version;

  /// No description provided for @buildNumber.
  ///
  /// In ja, this message translates to:
  /// **'ビルド番号'**
  String get buildNumber;

  /// No description provided for @adsAndPurchases.
  ///
  /// In ja, this message translates to:
  /// **'広告・課金'**
  String get adsAndPurchases;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In ja, this message translates to:
  /// **'プライバシーポリシー'**
  String get privacyPolicyTitle;

  /// No description provided for @termsOfServiceTitle.
  ///
  /// In ja, this message translates to:
  /// **'利用規約'**
  String get termsOfServiceTitle;

  /// No description provided for @removeAds.
  ///
  /// In ja, this message translates to:
  /// **'広告を削除'**
  String get removeAds;

  /// No description provided for @removeAdsPurchased.
  ///
  /// In ja, this message translates to:
  /// **'広告除去（購入済み）'**
  String get removeAdsPurchased;

  /// No description provided for @purchaseThankYou.
  ///
  /// In ja, this message translates to:
  /// **'ご購入ありがとうございます'**
  String get purchaseThankYou;

  /// No description provided for @storeConnectionError.
  ///
  /// In ja, this message translates to:
  /// **'ストアに接続できませんでした'**
  String get storeConnectionError;

  /// No description provided for @notAvailableNow.
  ///
  /// In ja, this message translates to:
  /// **'現在ご利用いただけません'**
  String get notAvailableNow;

  /// No description provided for @purchaseButton.
  ///
  /// In ja, this message translates to:
  /// **'購入'**
  String get purchaseButton;

  /// No description provided for @guestPlayer.
  ///
  /// In ja, this message translates to:
  /// **'ゲストプレイヤー'**
  String get guestPlayer;

  /// No description provided for @changePlayerName.
  ///
  /// In ja, this message translates to:
  /// **'プレイヤー名を変更'**
  String get changePlayerName;

  /// No description provided for @personalInfoWarning.
  ///
  /// In ja, this message translates to:
  /// **'個人を特定する情報（本名、住所など）は入力しないでください。他のプレイヤーに表示される可能性があります。'**
  String get personalInfoWarning;

  /// No description provided for @save.
  ///
  /// In ja, this message translates to:
  /// **'保存'**
  String get save;

  /// No description provided for @removeAdsDescription.
  ///
  /// In ja, this message translates to:
  /// **'{price} — ゲーム内の広告表示がすべて非表示になります'**
  String removeAdsDescription(String price);

  /// No description provided for @unlockMap.
  ///
  /// In ja, this message translates to:
  /// **'全都道府県マップを解放'**
  String get unlockMap;

  /// No description provided for @unlockMapPurchased.
  ///
  /// In ja, this message translates to:
  /// **'全都道府県マップ解放済み'**
  String get unlockMapPurchased;

  /// No description provided for @unlockMapThankYou.
  ///
  /// In ja, this message translates to:
  /// **'全47都道府県がプレイ可能です'**
  String get unlockMapThankYou;

  /// No description provided for @unlockMapDescription.
  ///
  /// In ja, this message translates to:
  /// **'{price} — 全47都道府県・地方決戦・歴史決戦が解放されます'**
  String unlockMapDescription(String price);

  /// No description provided for @stageLockedTitle.
  ///
  /// In ja, this message translates to:
  /// **'🔒 この都道府県はロック中'**
  String get stageLockedTitle;

  /// No description provided for @stageLockedBody.
  ///
  /// In ja, this message translates to:
  /// **'無料でプレイできるのは最初の{count}都道府県までです。\n「プレミアム」（買い切り）を購入すると、全47都道府県が遊べて広告も消えます。'**
  String stageLockedBody(int count);

  /// No description provided for @goToPurchaseButton.
  ///
  /// In ja, this message translates to:
  /// **'購入画面へ'**
  String get goToPurchaseButton;

  /// No description provided for @rankingTitle.
  ///
  /// In ja, this message translates to:
  /// **'ランキング'**
  String get rankingTitle;

  /// No description provided for @rankingTabGlobal.
  ///
  /// In ja, this message translates to:
  /// **'グローバル'**
  String get rankingTabGlobal;

  /// No description provided for @rankingTabPrefecture.
  ///
  /// In ja, this message translates to:
  /// **'都道府県対抗'**
  String get rankingTabPrefecture;

  /// No description provided for @rankingClearedCount.
  ///
  /// In ja, this message translates to:
  /// **'クリア県: {cleared} / 47'**
  String rankingClearedCount(int cleared);

  /// No description provided for @pointsSuffix.
  ///
  /// In ja, this message translates to:
  /// **'pts'**
  String get pointsSuffix;

  /// No description provided for @rankingPlayerCount.
  ///
  /// In ja, this message translates to:
  /// **'プレイヤー: {count} 人'**
  String rankingPlayerCount(int count);

  /// No description provided for @territoryMapTitle.
  ///
  /// In ja, this message translates to:
  /// **'日本統一マップ'**
  String get territoryMapTitle;

  /// No description provided for @japanMapLabel.
  ///
  /// In ja, this message translates to:
  /// **'日本地図'**
  String get japanMapLabel;

  /// No description provided for @mapDataAttribution.
  ///
  /// In ja, this message translates to:
  /// **'地図データ: 「地球地図日本」国土地理院'**
  String get mapDataAttribution;

  /// No description provided for @genericErrorPrefix.
  ///
  /// In ja, this message translates to:
  /// **'エラー: {error}'**
  String genericErrorPrefix(String error);

  /// No description provided for @territoryUnificationLabel.
  ///
  /// In ja, this message translates to:
  /// **'日本統一度'**
  String get territoryUnificationLabel;

  /// No description provided for @statsSectionTitle.
  ///
  /// In ja, this message translates to:
  /// **'📊 統計情報'**
  String get statsSectionTitle;

  /// No description provided for @statTotalClears.
  ///
  /// In ja, this message translates to:
  /// **'総クリア回数'**
  String get statTotalClears;

  /// No description provided for @statAverageLevel.
  ///
  /// In ja, this message translates to:
  /// **'平均レベル'**
  String get statAverageLevel;

  /// No description provided for @statHighScore.
  ///
  /// In ja, this message translates to:
  /// **'最高スコア'**
  String get statHighScore;

  /// No description provided for @timesSuffix.
  ///
  /// In ja, this message translates to:
  /// **'{count} 回'**
  String timesSuffix(int count);

  /// No description provided for @pokedexTitle.
  ///
  /// In ja, this message translates to:
  /// **'図鑑'**
  String get pokedexTitle;

  /// No description provided for @pokedexTabCleared.
  ///
  /// In ja, this message translates to:
  /// **'クリア県'**
  String get pokedexTabCleared;

  /// No description provided for @pokedexTabStats.
  ///
  /// In ja, this message translates to:
  /// **'統計'**
  String get pokedexTabStats;

  /// No description provided for @pokedexTabAchievements.
  ///
  /// In ja, this message translates to:
  /// **'実績'**
  String get pokedexTabAchievements;

  /// No description provided for @clearProgressLabel.
  ///
  /// In ja, this message translates to:
  /// **'クリア進捗'**
  String get clearProgressLabel;

  /// No description provided for @percentComplete.
  ///
  /// In ja, this message translates to:
  /// **'{percent}% 完成'**
  String percentComplete(String percent);

  /// No description provided for @learningStatsTitle.
  ///
  /// In ja, this message translates to:
  /// **'学習統計'**
  String get learningStatsTitle;

  /// No description provided for @statClearedPrefCount.
  ///
  /// In ja, this message translates to:
  /// **'クリア県数'**
  String get statClearedPrefCount;

  /// No description provided for @statTotalPlayTime.
  ///
  /// In ja, this message translates to:
  /// **'総プレイ時間'**
  String get statTotalPlayTime;

  /// No description provided for @hoursMinutesFormat.
  ///
  /// In ja, this message translates to:
  /// **'{hours} 時間 {minutes} 分'**
  String hoursMinutesFormat(int hours, int minutes);

  /// No description provided for @statTotalScore.
  ///
  /// In ja, this message translates to:
  /// **'総スコア'**
  String get statTotalScore;

  /// No description provided for @statTotalGamesPlayed.
  ///
  /// In ja, this message translates to:
  /// **'総プレイ回数'**
  String get statTotalGamesPlayed;

  /// No description provided for @clearsByDifficultyLabel.
  ///
  /// In ja, this message translates to:
  /// **'難度別クリア数'**
  String get clearsByDifficultyLabel;

  /// No description provided for @achievementsTitle.
  ///
  /// In ja, this message translates to:
  /// **'実績'**
  String get achievementsTitle;

  /// No description provided for @defeatedBossLabel.
  ///
  /// In ja, this message translates to:
  /// **'撃破したボス: '**
  String get defeatedBossLabel;

  /// No description provided for @bossStoryAppears.
  ///
  /// In ja, this message translates to:
  /// **'{bossName} 現る！'**
  String bossStoryAppears(String bossName);

  /// No description provided for @bossStoryFightButton.
  ///
  /// In ja, this message translates to:
  /// **'たたかう！'**
  String get bossStoryFightButton;

  /// No description provided for @howToPlayTitle.
  ///
  /// In ja, this message translates to:
  /// **'遊び方'**
  String get howToPlayTitle;

  /// No description provided for @howToPlayStep1Title.
  ///
  /// In ja, this message translates to:
  /// **'都道府県を選ぼう'**
  String get howToPlayStep1Title;

  /// No description provided for @howToPlayStep1Description.
  ///
  /// In ja, this message translates to:
  /// **'マップから挑戦したい都道府県を選んで出撃準備をしよう。'**
  String get howToPlayStep1Description;

  /// No description provided for @howToPlayStep2Title.
  ///
  /// In ja, this message translates to:
  /// **'施設を配置して防衛しよう'**
  String get howToPlayStep2Title;

  /// No description provided for @howToPlayStep2Description.
  ///
  /// In ja, this message translates to:
  /// **'コインを使って道の周りに施設を建てて、敵の侵攻を防ごう。'**
  String get howToPlayStep2Description;

  /// No description provided for @howToPlayStep3Title.
  ///
  /// In ja, this message translates to:
  /// **'ボスを倒そう'**
  String get howToPlayStep3Title;

  /// No description provided for @howToPlayStep3Description.
  ///
  /// In ja, this message translates to:
  /// **'各都道府県にはその土地を象徴するボスが登場する。すべての波を防ぎきってボスを撃破しよう。'**
  String get howToPlayStep3Description;

  /// No description provided for @howToPlayStep4Title.
  ///
  /// In ja, this message translates to:
  /// **'スコアとランキング'**
  String get howToPlayStep4Title;

  /// No description provided for @howToPlayStep4Description.
  ///
  /// In ja, this message translates to:
  /// **'クリアタイム・ミス回数に応じてスコアが決まる。ランキング画面で全国のプレイヤーと競い合おう。'**
  String get howToPlayStep4Description;

  /// No description provided for @howToPlayStep5Title.
  ///
  /// In ja, this message translates to:
  /// **'図鑑でふりかえろう'**
  String get howToPlayStep5Title;

  /// No description provided for @howToPlayStep5Description.
  ///
  /// In ja, this message translates to:
  /// **'クリアした都道府県は図鑑に記録される。倒したボスや実績も確認できるよ。'**
  String get howToPlayStep5Description;

  /// No description provided for @howToPlaySettingsTile.
  ///
  /// In ja, this message translates to:
  /// **'遊び方'**
  String get howToPlaySettingsTile;

  /// No description provided for @howToPlaySettingsSubtitle.
  ///
  /// In ja, this message translates to:
  /// **'ゲームの基本ルールを確認する'**
  String get howToPlaySettingsSubtitle;

  /// No description provided for @premiumPlanTitle.
  ///
  /// In ja, this message translates to:
  /// **'プレミアム'**
  String get premiumPlanTitle;

  /// No description provided for @premiumPlanTitlePurchased.
  ///
  /// In ja, this message translates to:
  /// **'プレミアム（購入済み）'**
  String get premiumPlanTitlePurchased;

  /// No description provided for @premiumPlanSubtitle.
  ///
  /// In ja, this message translates to:
  /// **'広告を消して、全都道府県・全ステージを解放'**
  String get premiumPlanSubtitle;

  /// No description provided for @premiumPlanSubtitlePurchased.
  ///
  /// In ja, this message translates to:
  /// **'広告非表示・全コンテンツ解放が有効です'**
  String get premiumPlanSubtitlePurchased;

  /// No description provided for @premiumPlanBenefitsHeading.
  ///
  /// In ja, this message translates to:
  /// **'プレミアムの特典'**
  String get premiumPlanBenefitsHeading;

  /// No description provided for @premiumPlanBenefitAdsFreeTitle.
  ///
  /// In ja, this message translates to:
  /// **'広告完全非表示'**
  String get premiumPlanBenefitAdsFreeTitle;

  /// No description provided for @premiumPlanBenefitAdsFreeDescription.
  ///
  /// In ja, this message translates to:
  /// **'プレイ中・結果画面のバナー広告・インタースティシャル広告が表示されなくなります。'**
  String get premiumPlanBenefitAdsFreeDescription;

  /// No description provided for @premiumPlanBenefitMapUnlockTitle.
  ///
  /// In ja, this message translates to:
  /// **'全都道府県マップ解放'**
  String get premiumPlanBenefitMapUnlockTitle;

  /// No description provided for @premiumPlanBenefitMapUnlockDescription.
  ///
  /// In ja, this message translates to:
  /// **'47都道府県すべて・地方決戦・歴史決戦ステージがいつでもプレイ可能になります。'**
  String get premiumPlanBenefitMapUnlockDescription;

  /// No description provided for @premiumPlanBenefitFutureTitle.
  ///
  /// In ja, this message translates to:
  /// **'買い切り・追加料金なし'**
  String get premiumPlanBenefitFutureTitle;

  /// No description provided for @premiumPlanBenefitFutureDescription.
  ///
  /// In ja, this message translates to:
  /// **'一度購入すればずっと有効。今後追加されるプレミアム向けコンテンツも利用できます。'**
  String get premiumPlanBenefitFutureDescription;

  /// No description provided for @premiumPlanDescriptionNote.
  ///
  /// In ja, this message translates to:
  /// **'無料版は広告つきで最初の{count}県まで遊べます。プレミアムは一度の購入で、ずっと使えます（月額・更新なし）。'**
  String premiumPlanDescriptionNote(int count);

  /// No description provided for @premiumPlanPurchasedMessage.
  ///
  /// In ja, this message translates to:
  /// **'プレミアム購入済みです。ご購入ありがとうございます！'**
  String get premiumPlanPurchasedMessage;

  /// No description provided for @premiumPlanPriceLabel.
  ///
  /// In ja, this message translates to:
  /// **'価格'**
  String get premiumPlanPriceLabel;

  /// No description provided for @premiumPlanBuyButton.
  ///
  /// In ja, this message translates to:
  /// **'プレミアムを購入する（買い切り）'**
  String get premiumPlanBuyButton;

  /// No description provided for @hometownLabel.
  ///
  /// In ja, this message translates to:
  /// **'出身地（都道府県対抗ランキング用）'**
  String get hometownLabel;

  /// No description provided for @hometownNotSet.
  ///
  /// In ja, this message translates to:
  /// **'未設定'**
  String get hometownNotSet;

  /// No description provided for @rankingEmptyGlobal.
  ///
  /// In ja, this message translates to:
  /// **'まだランキングデータがありません。ゲームをクリアして最初のランカーになろう！'**
  String get rankingEmptyGlobal;

  /// No description provided for @rankingEmptyPrefecture.
  ///
  /// In ja, this message translates to:
  /// **'まだランキングデータがありません。'**
  String get rankingEmptyPrefecture;

  /// No description provided for @kanaLabel.
  ///
  /// In ja, this message translates to:
  /// **'かな: '**
  String get kanaLabel;

  /// No description provided for @capitalCityLabel.
  ///
  /// In ja, this message translates to:
  /// **'県庁: '**
  String get capitalCityLabel;

  /// No description provided for @populationLabel.
  ///
  /// In ja, this message translates to:
  /// **'人口: 約{population}人'**
  String populationLabel(String population);

  /// No description provided for @areaLabel.
  ///
  /// In ja, this message translates to:
  /// **'面積: '**
  String get areaLabel;

  /// No description provided for @bestScoreLabel.
  ///
  /// In ja, this message translates to:
  /// **'ベストスコア: {score} pts'**
  String bestScoreLabel(String score);

  /// No description provided for @clearedDifficultiesLabel.
  ///
  /// In ja, this message translates to:
  /// **'クリア難度: '**
  String get clearedDifficultiesLabel;

  /// No description provided for @specialtiesLabel.
  ///
  /// In ja, this message translates to:
  /// **'特産品: '**
  String get specialtiesLabel;

  /// No description provided for @closeButton.
  ///
  /// In ja, this message translates to:
  /// **'閉じる'**
  String get closeButton;

  /// No description provided for @researchPointsLabel.
  ///
  /// In ja, this message translates to:
  /// **'研究ポイント'**
  String get researchPointsLabel;

  /// No description provided for @researchPointsHint.
  ///
  /// In ja, this message translates to:
  /// **'都道府県クリアで獲得'**
  String get researchPointsHint;

  /// No description provided for @levelFraction.
  ///
  /// In ja, this message translates to:
  /// **'Lv.{level} / {max}'**
  String levelFraction(int level, int max);

  /// No description provided for @currentEffectLabel.
  ///
  /// In ja, this message translates to:
  /// **'現在の効果: {effect}'**
  String currentEffectLabel(String effect);

  /// No description provided for @maxLabel.
  ///
  /// In ja, this message translates to:
  /// **'MAX'**
  String get maxLabel;

  /// No description provided for @upgradeForCostButton.
  ///
  /// In ja, this message translates to:
  /// **'🔬{cost} で強化'**
  String upgradeForCostButton(int cost);

  /// No description provided for @hqTrackAttackTitle.
  ///
  /// In ja, this message translates to:
  /// **'⚔️ 兵器開発'**
  String get hqTrackAttackTitle;

  /// No description provided for @hqTrackCoinTitle.
  ///
  /// In ja, this message translates to:
  /// **'💰 経済政策'**
  String get hqTrackCoinTitle;

  /// No description provided for @hqTrackHpTitle.
  ///
  /// In ja, this message translates to:
  /// **'🏯 城壁強化'**
  String get hqTrackHpTitle;

  /// No description provided for @hqTrackAttackDescription.
  ///
  /// In ja, this message translates to:
  /// **'全施設のダメージが永続的にアップ'**
  String get hqTrackAttackDescription;

  /// No description provided for @hqTrackCoinDescription.
  ///
  /// In ja, this message translates to:
  /// **'敵撃破時のコイン獲得量が永続的にアップ'**
  String get hqTrackCoinDescription;

  /// No description provided for @hqTrackHpDescription.
  ///
  /// In ja, this message translates to:
  /// **'全ステージの初期HPが永続的にアップ'**
  String get hqTrackHpDescription;

  /// No description provided for @selectPrefectureTitle.
  ///
  /// In ja, this message translates to:
  /// **'都道府県を選択'**
  String get selectPrefectureTitle;

  /// No description provided for @tabPrefectures.
  ///
  /// In ja, this message translates to:
  /// **'都道府県'**
  String get tabPrefectures;

  /// No description provided for @tabRegionBattle.
  ///
  /// In ja, this message translates to:
  /// **'地方決戦'**
  String get tabRegionBattle;

  /// No description provided for @tabHistoryBattle.
  ///
  /// In ja, this message translates to:
  /// **'歴史決戦'**
  String get tabHistoryBattle;

  /// No description provided for @searchByNameHint.
  ///
  /// In ja, this message translates to:
  /// **'県名・かなで検索'**
  String get searchByNameHint;

  /// No description provided for @regionAll.
  ///
  /// In ja, this message translates to:
  /// **'全国'**
  String get regionAll;

  /// No description provided for @countSuffix.
  ///
  /// In ja, this message translates to:
  /// **'{count} 件'**
  String countSuffix(int count);

  /// No description provided for @legendConquered.
  ///
  /// In ja, this message translates to:
  /// **'制圧済'**
  String get legendConquered;

  /// No description provided for @legendDifficulty.
  ///
  /// In ja, this message translates to:
  /// **'難易度'**
  String get legendDifficulty;

  /// No description provided for @regionUnlockHint.
  ///
  /// In ja, this message translates to:
  /// **'地方内の全都道府県をいずれかの難度でクリアすると解放されます'**
  String get regionUnlockHint;

  /// No description provided for @bossLabel.
  ///
  /// In ja, this message translates to:
  /// **'ボス: {name}'**
  String bossLabel(String name);

  /// No description provided for @clearedOfTotalPref.
  ///
  /// In ja, this message translates to:
  /// **'{cleared}/{total}県'**
  String clearedOfTotalPref(int cleared, int total);

  /// No description provided for @regionBattleHeader.
  ///
  /// In ja, this message translates to:
  /// **'{name}地方 決戦'**
  String regionBattleHeader(String name);

  /// No description provided for @regionBattleSubheader.
  ///
  /// In ja, this message translates to:
  /// **'WAVE {waves}  ／  地方統一への道'**
  String regionBattleSubheader(int waves);

  /// No description provided for @conqueredBanner.
  ///
  /// In ja, this message translates to:
  /// **'制圧済み！'**
  String get conqueredBanner;

  /// No description provided for @bossSkillLabel.
  ///
  /// In ja, this message translates to:
  /// **'スキル「{skill}」'**
  String bossSkillLabel(String skill);

  /// No description provided for @targetPrefecturesHeader.
  ///
  /// In ja, this message translates to:
  /// **'対象都道府県（{count}県）'**
  String targetPrefecturesHeader(int count);

  /// No description provided for @selectDifficultyLabel.
  ///
  /// In ja, this message translates to:
  /// **'難度を選択'**
  String get selectDifficultyLabel;

  /// No description provided for @startRegionBattleButton.
  ///
  /// In ja, this message translates to:
  /// **'地方決戦 開始'**
  String get startRegionBattleButton;

  /// No description provided for @historyUnlockedBanner.
  ///
  /// In ja, this message translates to:
  /// **'🏆 全国ハード制覇達成！歴史決戦解放！'**
  String get historyUnlockedBanner;

  /// No description provided for @postgameSectionLabel.
  ///
  /// In ja, this message translates to:
  /// **'⚔️ やりこみ要素'**
  String get postgameSectionLabel;

  /// No description provided for @historyUnlockHint.
  ///
  /// In ja, this message translates to:
  /// **'全47都道府県をハード難度でクリアすると\n「神代の決戦」が解放されます'**
  String get historyUnlockHint;

  /// No description provided for @hardClearedProgress.
  ///
  /// In ja, this message translates to:
  /// **'{count} / 47 県 ハードクリア済み'**
  String hardClearedProgress(int count);

  /// No description provided for @conqueredBadge.
  ///
  /// In ja, this message translates to:
  /// **'制覇'**
  String get conqueredBadge;

  /// No description provided for @bossWaveCount.
  ///
  /// In ja, this message translates to:
  /// **'{name}  •  {waves}波'**
  String bossWaveCount(String name, int waves);

  /// No description provided for @historyLockReason1.
  ///
  /// In ja, this message translates to:
  /// **'全国ハードクリアで解放'**
  String get historyLockReason1;

  /// No description provided for @historyLockReason2.
  ///
  /// In ja, this message translates to:
  /// **'前の歴史ステージをクリアで解放'**
  String get historyLockReason2;

  /// No description provided for @historyConqueredBanner.
  ///
  /// In ja, this message translates to:
  /// **'歴史決戦 制覇済み！'**
  String get historyConqueredBanner;

  /// No description provided for @wavesUltraHard.
  ///
  /// In ja, this message translates to:
  /// **'{waves}波・超高難度'**
  String wavesUltraHard(int waves);

  /// No description provided for @startHistoryBattleButton.
  ///
  /// In ja, this message translates to:
  /// **'歴史決戦 開始！'**
  String get startHistoryBattleButton;

  /// No description provided for @exclusiveBadge.
  ///
  /// In ja, this message translates to:
  /// **'限定'**
  String get exclusiveBadge;

  /// No description provided for @difficultyLabel.
  ///
  /// In ja, this message translates to:
  /// **'難易度'**
  String get difficultyLabel;

  /// No description provided for @terrainLabel.
  ///
  /// In ja, this message translates to:
  /// **'地形'**
  String get terrainLabel;

  /// No description provided for @notConqueredLabel.
  ///
  /// In ja, this message translates to:
  /// **'未制圧'**
  String get notConqueredLabel;

  /// No description provided for @conqueredDifficultiesLabel.
  ///
  /// In ja, this message translates to:
  /// **'制圧難度: {diffs}'**
  String conqueredDifficultiesLabel(String diffs);

  /// No description provided for @capitalCityTitle.
  ///
  /// In ja, this message translates to:
  /// **'県庁'**
  String get capitalCityTitle;

  /// No description provided for @areaTitle.
  ///
  /// In ja, this message translates to:
  /// **'面積'**
  String get areaTitle;

  /// No description provided for @bossStatsLine.
  ///
  /// In ja, this message translates to:
  /// **'HP {hp} / 攻撃 {attack} / スキル「{skill}」'**
  String bossStatsLine(int hp, int attack, String skill);

  /// No description provided for @startDefenseButton.
  ///
  /// In ja, this message translates to:
  /// **'防衛開始'**
  String get startDefenseButton;

  /// No description provided for @exclusiveFacilityLabel.
  ///
  /// In ja, this message translates to:
  /// **'限定施設'**
  String get exclusiveFacilityLabel;

  /// No description provided for @industryBonusLine.
  ///
  /// In ja, this message translates to:
  /// **'{label}施設 強化 +{pct}%（コスト減・威力増）'**
  String industryBonusLine(String label, int pct);

  /// No description provided for @geographySea.
  ///
  /// In ja, this message translates to:
  /// **'海・沿岸'**
  String get geographySea;

  /// No description provided for @geographyMountain.
  ///
  /// In ja, this message translates to:
  /// **'山岳'**
  String get geographyMountain;

  /// No description provided for @geographyUrban.
  ///
  /// In ja, this message translates to:
  /// **'都市'**
  String get geographyUrban;

  /// No description provided for @geographyAgriculture.
  ///
  /// In ja, this message translates to:
  /// **'農業'**
  String get geographyAgriculture;

  /// No description provided for @geographyMixed.
  ///
  /// In ja, this message translates to:
  /// **'複合'**
  String get geographyMixed;

  /// No description provided for @facilityDescDairyFarm.
  ///
  /// In ja, this message translates to:
  /// **'敵の速度を-20%する酪農施設'**
  String get facilityDescDairyFarm;

  /// No description provided for @facilityDescAlpineWatch.
  ///
  /// In ja, this message translates to:
  /// **'長射程＋スロー付与の見張所'**
  String get facilityDescAlpineWatch;

  /// No description provided for @facilityDescToyotaFactory.
  ///
  /// In ja, this message translates to:
  /// **'高速攻撃＋コイン生成'**
  String get facilityDescToyotaFactory;

  /// No description provided for @facilityDescKiyomizuTemple.
  ///
  /// In ja, this message translates to:
  /// **'敵への被ダメージ+40%'**
  String get facilityDescKiyomizuTemple;

  /// No description provided for @facilityDescPeaceShrine.
  ///
  /// In ja, this message translates to:
  /// **'敵にシールドを付与し弱体化'**
  String get facilityDescPeaceShrine;

  /// No description provided for @facilityDescShisaGuardian.
  ///
  /// In ja, this message translates to:
  /// **'40%でスタン（1秒）'**
  String get facilityDescShisaGuardian;

  /// No description provided for @facilityDescUmeSakeBrewery.
  ///
  /// In ja, this message translates to:
  /// **'50%でスロー付与'**
  String get facilityDescUmeSakeBrewery;

  /// No description provided for @facilityDescUdonShop.
  ///
  /// In ja, this message translates to:
  /// **'超低コスト・高速攻撃'**
  String get facilityDescUdonShop;

  /// No description provided for @facilityDescDefault.
  ///
  /// In ja, this message translates to:
  /// **'都道府県限定の特殊施設'**
  String get facilityDescDefault;

  /// No description provided for @searchByPrefNameHint.
  ///
  /// In ja, this message translates to:
  /// **'県名で検索'**
  String get searchByPrefNameHint;

  /// No description provided for @difficultyDescriptionEasy.
  ///
  /// In ja, this message translates to:
  /// **'敵が弱くてゆっくり\nハート多め・休憩長め\nはじめての人・小さい子向け'**
  String get difficultyDescriptionEasy;

  /// No description provided for @difficultyDescriptionNormal.
  ///
  /// In ja, this message translates to:
  /// **'標準の難しさ\n置き方を考えればクリア'**
  String get difficultyDescriptionNormal;

  /// No description provided for @difficultyDescriptionHard.
  ///
  /// In ja, this message translates to:
  /// **'敵HP +30%・速い\n波数 +2・ハート少なめ\nスコア ×1.5'**
  String get difficultyDescriptionHard;

  /// No description provided for @minSecFormat.
  ///
  /// In ja, this message translates to:
  /// **'{m}分{s}秒'**
  String minSecFormat(int m, int s);

  /// No description provided for @secFormat.
  ///
  /// In ja, this message translates to:
  /// **'{s}秒'**
  String secFormat(int s);

  /// No description provided for @victoryTitle.
  ///
  /// In ja, this message translates to:
  /// **'クリア！'**
  String get victoryTitle;

  /// No description provided for @statTime.
  ///
  /// In ja, this message translates to:
  /// **'時間'**
  String get statTime;

  /// No description provided for @statMistakes.
  ///
  /// In ja, this message translates to:
  /// **'ミス'**
  String get statMistakes;

  /// No description provided for @learnAboutPrefHeader.
  ///
  /// In ja, this message translates to:
  /// **'📚 {name} を学ぼう！'**
  String learnAboutPrefHeader(String name);

  /// No description provided for @geographySectionTitle.
  ///
  /// In ja, this message translates to:
  /// **'地理'**
  String get geographySectionTitle;

  /// No description provided for @industryPopSectionTitle.
  ///
  /// In ja, this message translates to:
  /// **'産業・人口'**
  String get industryPopSectionTitle;

  /// No description provided for @populationTitle.
  ///
  /// In ja, this message translates to:
  /// **'人口'**
  String get populationTitle;

  /// No description provided for @specialtiesTitle.
  ///
  /// In ja, this message translates to:
  /// **'特産品'**
  String get specialtiesTitle;

  /// No description provided for @populationApprox.
  ///
  /// In ja, this message translates to:
  /// **'約 {population} 人'**
  String populationApprox(String population);

  /// No description provided for @companionJoinedMessage.
  ///
  /// In ja, this message translates to:
  /// **'{name} が仲間になった！'**
  String companionJoinedMessage(String name);

  /// No description provided for @badgesEarnedHeader.
  ///
  /// In ja, this message translates to:
  /// **'獲得バッジ'**
  String get badgesEarnedHeader;

  /// No description provided for @bossDefeatedLine.
  ///
  /// In ja, this message translates to:
  /// **'{name} を撃破！'**
  String bossDefeatedLine(String name);

  /// No description provided for @regionConqueredLine.
  ///
  /// In ja, this message translates to:
  /// **'{name}地方を制圧しました'**
  String regionConqueredLine(String name);

  /// No description provided for @stageClearedLine.
  ///
  /// In ja, this message translates to:
  /// **'{name} クリア！'**
  String stageClearedLine(String name);

  /// No description provided for @historyMasterAchievedBanner.
  ///
  /// In ja, this message translates to:
  /// **'🏆 やりこみ達成！歴史の守護者に認定！'**
  String get historyMasterAchievedBanner;

  /// No description provided for @retryButton.
  ///
  /// In ja, this message translates to:
  /// **'もう一度'**
  String get retryButton;

  /// No description provided for @backToMapButton.
  ///
  /// In ja, this message translates to:
  /// **'マップへ'**
  String get backToMapButton;

  /// No description provided for @waveClearShopTitle.
  ///
  /// In ja, this message translates to:
  /// **'ウェーブ{wave}クリア！ショップ'**
  String waveClearShopTitle(int wave);

  /// No description provided for @chooseOneItemHint.
  ///
  /// In ja, this message translates to:
  /// **'アイテムを1つ選んでください'**
  String get chooseOneItemHint;

  /// No description provided for @freeLabel.
  ///
  /// In ja, this message translates to:
  /// **'無料'**
  String get freeLabel;

  /// No description provided for @skipButton.
  ///
  /// In ja, this message translates to:
  /// **'スキップ'**
  String get skipButton;

  /// No description provided for @cannotPlaceFacility.
  ///
  /// In ja, this message translates to:
  /// **'施設を配置できません'**
  String get cannotPlaceFacility;

  /// No description provided for @notEnoughCoins.
  ///
  /// In ja, this message translates to:
  /// **'金貨が足りません'**
  String get notEnoughCoins;

  /// No description provided for @blocksPath.
  ///
  /// In ja, this message translates to:
  /// **'道を塞いでます'**
  String get blocksPath;

  /// No description provided for @tileOccupied.
  ///
  /// In ja, this message translates to:
  /// **'すでに施設があります'**
  String get tileOccupied;

  /// No description provided for @notEnoughCoinsNeeded.
  ///
  /// In ja, this message translates to:
  /// **'🪙 金貨が足りません (必要: {cost}, 保持: {coins})'**
  String notEnoughCoinsNeeded(int cost, int coins);

  /// No description provided for @blocksPathDetailed.
  ///
  /// In ja, this message translates to:
  /// **'🛤️ この場所は道を塞ぎます'**
  String get blocksPathDetailed;

  /// No description provided for @tileOccupiedDetailed.
  ///
  /// In ja, this message translates to:
  /// **'⚠️ この場所には既に施設があります'**
  String get tileOccupiedDetailed;

  /// No description provided for @selectWaveSkillButton.
  ///
  /// In ja, this message translates to:
  /// **'ウェーブスキルを選択'**
  String get selectWaveSkillButton;

  /// No description provided for @effectAppliesNextWaveHint.
  ///
  /// In ja, this message translates to:
  /// **'次のウェーブで効果が適用されます'**
  String get effectAppliesNextWaveHint;

  /// No description provided for @statAttack.
  ///
  /// In ja, this message translates to:
  /// **'攻撃力'**
  String get statAttack;

  /// No description provided for @statRange.
  ///
  /// In ja, this message translates to:
  /// **'射程'**
  String get statRange;

  /// No description provided for @statSpeed.
  ///
  /// In ja, this message translates to:
  /// **'速度'**
  String get statSpeed;

  /// No description provided for @facilityUpgradeButton.
  ///
  /// In ja, this message translates to:
  /// **'アップグレード 🪙{cost}'**
  String facilityUpgradeButton(int cost);

  /// No description provided for @notEnoughCoinsSimple.
  ///
  /// In ja, this message translates to:
  /// **'コイン不足 (必要: {cost})'**
  String notEnoughCoinsSimple(int cost);

  /// No description provided for @sellForButton.
  ///
  /// In ja, this message translates to:
  /// **'売却 (+{amount}🪙)'**
  String sellForButton(int amount);

  /// No description provided for @quitConfirmTitle.
  ///
  /// In ja, this message translates to:
  /// **'中断しますか？'**
  String get quitConfirmTitle;

  /// No description provided for @quitConfirmBody.
  ///
  /// In ja, this message translates to:
  /// **'ゲームを中断してトップに戻りますか？'**
  String get quitConfirmBody;

  /// No description provided for @continueButton.
  ///
  /// In ja, this message translates to:
  /// **'続ける'**
  String get continueButton;

  /// No description provided for @abortButton.
  ///
  /// In ja, this message translates to:
  /// **'中断'**
  String get abortButton;

  /// No description provided for @historyBattleWaveBadge.
  ///
  /// In ja, this message translates to:
  /// **'歴史決戦 {waves}波'**
  String historyBattleWaveBadge(int waves);

  /// No description provided for @regionBattleWaveBadge.
  ///
  /// In ja, this message translates to:
  /// **'地方決戦 7波'**
  String get regionBattleWaveBadge;

  /// No description provided for @skillSelectedStatus.
  ///
  /// In ja, this message translates to:
  /// **'スキルが選択されました'**
  String get skillSelectedStatus;

  /// No description provided for @secondsUntilNextWave.
  ///
  /// In ja, this message translates to:
  /// **'次のウェーブまで {seconds} 秒'**
  String secondsUntilNextWave(int seconds);

  /// No description provided for @startNowButton.
  ///
  /// In ja, this message translates to:
  /// **'今すぐ開始'**
  String get startNowButton;

  /// No description provided for @answerQuizPrompt.
  ///
  /// In ja, this message translates to:
  /// **'クイズに答えよう！'**
  String get answerQuizPrompt;

  /// No description provided for @gameStartButton.
  ///
  /// In ja, this message translates to:
  /// **'開始!'**
  String get gameStartButton;

  /// No description provided for @waveCounter.
  ///
  /// In ja, this message translates to:
  /// **'ウェーブ {current}/{total}'**
  String waveCounter(int current, int total);

  /// No description provided for @remainingEnemies.
  ///
  /// In ja, this message translates to:
  /// **'残り {count} 体'**
  String remainingEnemies(int count);

  /// No description provided for @nextWavePreviewLabel.
  ///
  /// In ja, this message translates to:
  /// **'次 W{wave}:'**
  String nextWavePreviewLabel(int wave);

  /// No description provided for @enemyCountSuffix.
  ///
  /// In ja, this message translates to:
  /// **'{count}体  '**
  String enemyCountSuffix(int count);

  /// No description provided for @ultimateReadyLabel.
  ///
  /// In ja, this message translates to:
  /// **'必殺技 発動可能！タップ！'**
  String get ultimateReadyLabel;

  /// No description provided for @ultimateButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'必殺・領土防衛'**
  String get ultimateButtonLabel;

  /// No description provided for @placeFacilitiesHint.
  ///
  /// In ja, this message translates to:
  /// **'施設を配置して\n「開始!」を押してください'**
  String get placeFacilitiesHint;

  /// No description provided for @clearedOfTotal.
  ///
  /// In ja, this message translates to:
  /// **'{cleared} / {total} 県'**
  String clearedOfTotal(int cleared, int total);

  /// No description provided for @conquestPercent.
  ///
  /// In ja, this message translates to:
  /// **'{percent}% 制圧完了'**
  String conquestPercent(String percent);

  /// No description provided for @facilityNameFarm.
  ///
  /// In ja, this message translates to:
  /// **'農業'**
  String get facilityNameFarm;

  /// No description provided for @facilityNameFishery.
  ///
  /// In ja, this message translates to:
  /// **'漁業'**
  String get facilityNameFishery;

  /// No description provided for @facilityNameFactory.
  ///
  /// In ja, this message translates to:
  /// **'工業'**
  String get facilityNameFactory;

  /// No description provided for @facilityNameMine.
  ///
  /// In ja, this message translates to:
  /// **'鉱業'**
  String get facilityNameMine;

  /// No description provided for @facilityNameCastle.
  ///
  /// In ja, this message translates to:
  /// **'城'**
  String get facilityNameCastle;

  /// No description provided for @facilityNameShrine.
  ///
  /// In ja, this message translates to:
  /// **'神社'**
  String get facilityNameShrine;

  /// No description provided for @facilityNameDairyFarm.
  ///
  /// In ja, this message translates to:
  /// **'酪農施設'**
  String get facilityNameDairyFarm;

  /// No description provided for @facilityNameAlpineWatch.
  ///
  /// In ja, this message translates to:
  /// **'高山見張所'**
  String get facilityNameAlpineWatch;

  /// No description provided for @facilityNameToyotaFactory.
  ///
  /// In ja, this message translates to:
  /// **'トヨタ工場'**
  String get facilityNameToyotaFactory;

  /// No description provided for @facilityNameKiyomizuTemple.
  ///
  /// In ja, this message translates to:
  /// **'清水寺'**
  String get facilityNameKiyomizuTemple;

  /// No description provided for @facilityNamePeaceShrine.
  ///
  /// In ja, this message translates to:
  /// **'平和記念碑'**
  String get facilityNamePeaceShrine;

  /// No description provided for @facilityNameShisaGuardian.
  ///
  /// In ja, this message translates to:
  /// **'シーサー守り'**
  String get facilityNameShisaGuardian;

  /// No description provided for @facilityNameUmeSakeBrewery.
  ///
  /// In ja, this message translates to:
  /// **'紀州梅酒醸造所'**
  String get facilityNameUmeSakeBrewery;

  /// No description provided for @facilityNameUdonShop.
  ///
  /// In ja, this message translates to:
  /// **'うどん店'**
  String get facilityNameUdonShop;

  /// No description provided for @prefectureName01.
  ///
  /// In ja, this message translates to:
  /// **'北海道'**
  String get prefectureName01;

  /// No description provided for @prefectureName02.
  ///
  /// In ja, this message translates to:
  /// **'青森県'**
  String get prefectureName02;

  /// No description provided for @prefectureName03.
  ///
  /// In ja, this message translates to:
  /// **'岩手県'**
  String get prefectureName03;

  /// No description provided for @prefectureName04.
  ///
  /// In ja, this message translates to:
  /// **'宮城県'**
  String get prefectureName04;

  /// No description provided for @prefectureName05.
  ///
  /// In ja, this message translates to:
  /// **'秋田県'**
  String get prefectureName05;

  /// No description provided for @prefectureName06.
  ///
  /// In ja, this message translates to:
  /// **'山形県'**
  String get prefectureName06;

  /// No description provided for @prefectureName07.
  ///
  /// In ja, this message translates to:
  /// **'福島県'**
  String get prefectureName07;

  /// No description provided for @prefectureName08.
  ///
  /// In ja, this message translates to:
  /// **'茨城県'**
  String get prefectureName08;

  /// No description provided for @prefectureName09.
  ///
  /// In ja, this message translates to:
  /// **'栃木県'**
  String get prefectureName09;

  /// No description provided for @prefectureName10.
  ///
  /// In ja, this message translates to:
  /// **'群馬県'**
  String get prefectureName10;

  /// No description provided for @prefectureName11.
  ///
  /// In ja, this message translates to:
  /// **'埼玉県'**
  String get prefectureName11;

  /// No description provided for @prefectureName12.
  ///
  /// In ja, this message translates to:
  /// **'千葉県'**
  String get prefectureName12;

  /// No description provided for @prefectureName13.
  ///
  /// In ja, this message translates to:
  /// **'東京都'**
  String get prefectureName13;

  /// No description provided for @prefectureName14.
  ///
  /// In ja, this message translates to:
  /// **'神奈川県'**
  String get prefectureName14;

  /// No description provided for @prefectureName15.
  ///
  /// In ja, this message translates to:
  /// **'新潟県'**
  String get prefectureName15;

  /// No description provided for @prefectureName16.
  ///
  /// In ja, this message translates to:
  /// **'富山県'**
  String get prefectureName16;

  /// No description provided for @prefectureName17.
  ///
  /// In ja, this message translates to:
  /// **'石川県'**
  String get prefectureName17;

  /// No description provided for @prefectureName18.
  ///
  /// In ja, this message translates to:
  /// **'福井県'**
  String get prefectureName18;

  /// No description provided for @prefectureName19.
  ///
  /// In ja, this message translates to:
  /// **'山梨県'**
  String get prefectureName19;

  /// No description provided for @prefectureName20.
  ///
  /// In ja, this message translates to:
  /// **'長野県'**
  String get prefectureName20;

  /// No description provided for @prefectureName21.
  ///
  /// In ja, this message translates to:
  /// **'岐阜県'**
  String get prefectureName21;

  /// No description provided for @prefectureName22.
  ///
  /// In ja, this message translates to:
  /// **'静岡県'**
  String get prefectureName22;

  /// No description provided for @prefectureName23.
  ///
  /// In ja, this message translates to:
  /// **'愛知県'**
  String get prefectureName23;

  /// No description provided for @prefectureName24.
  ///
  /// In ja, this message translates to:
  /// **'三重県'**
  String get prefectureName24;

  /// No description provided for @prefectureName25.
  ///
  /// In ja, this message translates to:
  /// **'滋賀県'**
  String get prefectureName25;

  /// No description provided for @prefectureName26.
  ///
  /// In ja, this message translates to:
  /// **'京都府'**
  String get prefectureName26;

  /// No description provided for @prefectureName27.
  ///
  /// In ja, this message translates to:
  /// **'大阪府'**
  String get prefectureName27;

  /// No description provided for @prefectureName28.
  ///
  /// In ja, this message translates to:
  /// **'兵庫県'**
  String get prefectureName28;

  /// No description provided for @prefectureName29.
  ///
  /// In ja, this message translates to:
  /// **'奈良県'**
  String get prefectureName29;

  /// No description provided for @prefectureName30.
  ///
  /// In ja, this message translates to:
  /// **'和歌山県'**
  String get prefectureName30;

  /// No description provided for @prefectureName31.
  ///
  /// In ja, this message translates to:
  /// **'鳥取県'**
  String get prefectureName31;

  /// No description provided for @prefectureName32.
  ///
  /// In ja, this message translates to:
  /// **'島根県'**
  String get prefectureName32;

  /// No description provided for @prefectureName33.
  ///
  /// In ja, this message translates to:
  /// **'岡山県'**
  String get prefectureName33;

  /// No description provided for @prefectureName34.
  ///
  /// In ja, this message translates to:
  /// **'広島県'**
  String get prefectureName34;

  /// No description provided for @prefectureName35.
  ///
  /// In ja, this message translates to:
  /// **'山口県'**
  String get prefectureName35;

  /// No description provided for @prefectureName36.
  ///
  /// In ja, this message translates to:
  /// **'徳島県'**
  String get prefectureName36;

  /// No description provided for @prefectureName37.
  ///
  /// In ja, this message translates to:
  /// **'香川県'**
  String get prefectureName37;

  /// No description provided for @prefectureName38.
  ///
  /// In ja, this message translates to:
  /// **'愛媛県'**
  String get prefectureName38;

  /// No description provided for @prefectureName39.
  ///
  /// In ja, this message translates to:
  /// **'高知県'**
  String get prefectureName39;

  /// No description provided for @prefectureName40.
  ///
  /// In ja, this message translates to:
  /// **'福岡県'**
  String get prefectureName40;

  /// No description provided for @prefectureName41.
  ///
  /// In ja, this message translates to:
  /// **'佐賀県'**
  String get prefectureName41;

  /// No description provided for @prefectureName42.
  ///
  /// In ja, this message translates to:
  /// **'長崎県'**
  String get prefectureName42;

  /// No description provided for @prefectureName43.
  ///
  /// In ja, this message translates to:
  /// **'熊本県'**
  String get prefectureName43;

  /// No description provided for @prefectureName44.
  ///
  /// In ja, this message translates to:
  /// **'大分県'**
  String get prefectureName44;

  /// No description provided for @prefectureName45.
  ///
  /// In ja, this message translates to:
  /// **'宮崎県'**
  String get prefectureName45;

  /// No description provided for @prefectureName46.
  ///
  /// In ja, this message translates to:
  /// **'鹿児島県'**
  String get prefectureName46;

  /// No description provided for @prefectureName47.
  ///
  /// In ja, this message translates to:
  /// **'沖縄県'**
  String get prefectureName47;

  /// No description provided for @restorePurchases.
  ///
  /// In ja, this message translates to:
  /// **'購入の復元'**
  String get restorePurchases;

  /// No description provided for @restorePurchasesSubtitle.
  ///
  /// In ja, this message translates to:
  /// **'機種変更・再インストール後に購入済みの内容を復元します'**
  String get restorePurchasesSubtitle;

  /// No description provided for @restorePurchasesChecking.
  ///
  /// In ja, this message translates to:
  /// **'購入情報を確認しています…'**
  String get restorePurchasesChecking;

  /// No description provided for @premiumStoreError.
  ///
  /// In ja, this message translates to:
  /// **'ストアに接続できませんでした。時間をおいて再度お試しください。'**
  String get premiumStoreError;

  /// No description provided for @premiumStoreNotReady.
  ///
  /// In ja, this message translates to:
  /// **'※ストア側での商品登録が完了すると購入できるようになります。'**
  String get premiumStoreNotReady;

  /// No description provided for @saidHistory.
  ///
  /// In ja, this message translates to:
  /// **'「{name}の決戦だ！歴史を守れ！」'**
  String saidHistory(String name);

  /// No description provided for @saidRegion.
  ///
  /// In ja, this message translates to:
  /// **'「{name}地方の決戦だ！全力で戦うぞ！」'**
  String saidRegion(String name);

  /// No description provided for @saidPref.
  ///
  /// In ja, this message translates to:
  /// **'「{name}を守るぞ！ぼくにまかせて！」'**
  String saidPref(String name);

  /// No description provided for @bannerHistoryBoss.
  ///
  /// In ja, this message translates to:
  /// **'{emoji} {boss} 降臨！'**
  String bannerHistoryBoss(String emoji, String boss);

  /// No description provided for @bannerHistoryFinal.
  ///
  /// In ja, this message translates to:
  /// **'歴史決戦「{name}」最終決戦！'**
  String bannerHistoryFinal(String name);

  /// No description provided for @bannerRegionBoss.
  ///
  /// In ja, this message translates to:
  /// **'{emoji} {boss} 登場！'**
  String bannerRegionBoss(String emoji, String boss);

  /// No description provided for @bannerRegionFinal.
  ///
  /// In ja, this message translates to:
  /// **'地方決戦「{name}」最終決戦！'**
  String bannerRegionFinal(String name);

  /// No description provided for @bannerPrefBoss.
  ///
  /// In ja, this message translates to:
  /// **'👹 {boss} 登場！'**
  String bannerPrefBoss(String boss);

  /// No description provided for @bannerBossSkill.
  ///
  /// In ja, this message translates to:
  /// **'スキル「{skill}」に警戒せよ'**
  String bannerBossSkill(String skill);

  /// No description provided for @waveRegionElite.
  ///
  /// In ja, this message translates to:
  /// **'{emoji} {region}地方の精鋭が迫る…'**
  String waveRegionElite(String emoji, String region);

  /// No description provided for @waveGeoEnemy.
  ///
  /// In ja, this message translates to:
  /// **'{icon} {geo}の敵が迫る…'**
  String waveGeoEnemy(String icon, String geo);

  /// No description provided for @saidWaveHistory.
  ///
  /// In ja, this message translates to:
  /// **'「ウェーブ{wave}！歴史の脅威が押し寄せる！」'**
  String saidWaveHistory(int wave);

  /// No description provided for @saidWaveRegion.
  ///
  /// In ja, this message translates to:
  /// **'「ウェーブ{wave}、地方最強の敵が来るぞ！」'**
  String saidWaveRegion(int wave);

  /// No description provided for @saidWave.
  ///
  /// In ja, this message translates to:
  /// **'「ウェーブ{wave}、いくよ！」'**
  String saidWave(int wave);

  /// No description provided for @combo5.
  ///
  /// In ja, this message translates to:
  /// **'🔥5コンボ! +{bonus}🪙'**
  String combo5(int bonus);

  /// No description provided for @combo10.
  ///
  /// In ja, this message translates to:
  /// **'💥10コンボ!! +{bonus}🪙'**
  String combo10(int bonus);

  /// No description provided for @comboN.
  ///
  /// In ja, this message translates to:
  /// **'⚡{count}コンボ!!! +{bonus}🪙'**
  String comboN(int count, int bonus);

  /// No description provided for @cheerBonus.
  ///
  /// In ja, this message translates to:
  /// **'応援 +{bonus}🪙'**
  String cheerBonus(int bonus);

  /// No description provided for @saidSpecialtyPower.
  ///
  /// In ja, this message translates to:
  /// **'「{specialty}パワー、いっけー！」'**
  String saidSpecialtyPower(String specialty);

  /// No description provided for @quizCapitalQuestion.
  ///
  /// In ja, this message translates to:
  /// **'{name}の県庁所在地は？'**
  String quizCapitalQuestion(String name);

  /// No description provided for @synergyBonus.
  ///
  /// In ja, this message translates to:
  /// **'✨シナジー +{pct}%'**
  String synergyBonus(int pct);

  /// No description provided for @resultSecretsTitle.
  ///
  /// In ja, this message translates to:
  /// **'📚 {name} のひみつ'**
  String resultSecretsTitle(String name);

  /// No description provided for @resultPopulationApprox.
  ///
  /// In ja, this message translates to:
  /// **'約 {man} 万人'**
  String resultPopulationApprox(int man);

  /// No description provided for @resultTerrain.
  ///
  /// In ja, this message translates to:
  /// **'{icon} 地形'**
  String resultTerrain(String icon);

  /// No description provided for @resultCompanionJoined.
  ///
  /// In ja, this message translates to:
  /// **'{name} が仲間になった！'**
  String resultCompanionJoined(String name);

  /// No description provided for @bossStoryRegion.
  ///
  /// In ja, this message translates to:
  /// **'{region}地方の覇権を賭けた戦い。{boss}が立ちはだかる！'**
  String bossStoryRegion(String region, String boss);

  /// No description provided for @recordClearsCount.
  ///
  /// In ja, this message translates to:
  /// **'{n}回'**
  String recordClearsCount(int n);

  /// No description provided for @recordPointsCount.
  ///
  /// In ja, this message translates to:
  /// **'{n}点'**
  String recordPointsCount(int n);

  /// No description provided for @dateYmd.
  ///
  /// In ja, this message translates to:
  /// **'{y}年{m}月{d}日'**
  String dateYmd(int y, int m, int d);

  /// No description provided for @triviaCapital.
  ///
  /// In ja, this message translates to:
  /// **'{name}の県庁所在地は{capital}だよ。'**
  String triviaCapital(String name, String capital);

  /// No description provided for @triviaArea.
  ///
  /// In ja, this message translates to:
  /// **'面積は約{area}km²。全国でも特徴的な広さなんだ。'**
  String triviaArea(int area);

  /// No description provided for @triviaPopulation.
  ///
  /// In ja, this message translates to:
  /// **'人口は約{man}万人が暮らしているよ。'**
  String triviaPopulation(int man);

  /// No description provided for @triviaSpecialty.
  ///
  /// In ja, this message translates to:
  /// **'名産品の「{item}」がとくに有名なんだ。'**
  String triviaSpecialty(String item);

  /// No description provided for @triviaGeography.
  ///
  /// In ja, this message translates to:
  /// **'地形は「{geo}」タイプ。だから敵もその土地らしいんだ。'**
  String triviaGeography(String geo);

  /// No description provided for @detailWithSpecialty.
  ///
  /// In ja, this message translates to:
  /// **'{region}地方に位置する「{geo}」タイプの地形が特徴の県。名産品は{items}などが知られていて、県庁所在地の{capital}を中心ににぎわっているよ。'**
  String detailWithSpecialty(
    String region,
    String geo,
    String items,
    String capital,
  );

  /// No description provided for @detailNoSpecialty.
  ///
  /// In ja, this message translates to:
  /// **'{region}地方に位置する「{geo}」タイプの地形が特徴の県。県庁所在地は{capital}だよ。'**
  String detailNoSpecialty(String region, String geo, String capital);

  /// No description provided for @parentGateTitle.
  ///
  /// In ja, this message translates to:
  /// **'保護者の方へ'**
  String get parentGateTitle;

  /// No description provided for @parentGateMessage.
  ///
  /// In ja, this message translates to:
  /// **'購入は保護者の方が操作してください。答えを入力してください。'**
  String get parentGateMessage;

  /// No description provided for @parentGateCancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get parentGateCancel;

  /// No description provided for @parentGateOk.
  ///
  /// In ja, this message translates to:
  /// **'確認'**
  String get parentGateOk;

  /// No description provided for @parentGateWrong.
  ///
  /// In ja, this message translates to:
  /// **'答えが違います'**
  String get parentGateWrong;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
