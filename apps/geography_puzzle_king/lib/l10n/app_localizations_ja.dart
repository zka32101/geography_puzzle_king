// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '都道府県ゲーム';

  @override
  String get appSubtitle => 'ゲームで学ぶ都道府県';

  @override
  String get gameDescription => '47都道府県を守り抜け！';

  @override
  String get nickname => 'ニックネームを入力';

  @override
  String get nicknameHint => 'たんけんか';

  @override
  String get nicknameInstruction => 'ひらがなまたはカタカナで入力してください';

  @override
  String get startButton => 'はじめる！';

  @override
  String get errorInvalidNickname => 'ニックネームを入力してください';

  @override
  String get home => 'ホーム';

  @override
  String get game => 'ゲーム';

  @override
  String get map => '地図';

  @override
  String get ranking => 'ランキング';

  @override
  String get settings => '設定';

  @override
  String get territory => '日本統一マップ';

  @override
  String get unificationProgress => '統一度';

  @override
  String get prefectures => '都道府県';

  @override
  String get globalRanking => 'グローバル';

  @override
  String get prefectureVersus => '都道府県対抗';

  @override
  String get userInfo => 'ユーザー情報';

  @override
  String get playerName => 'プレイヤー名';

  @override
  String get notifications => '通知設定';

  @override
  String get pushNotifications => 'プッシュ通知';

  @override
  String get dailyEvents => 'デイリーイベント・対戦通知';

  @override
  String get soundSettings => 'サウンド設定';

  @override
  String get bgm => 'BGM';

  @override
  String get backgroundMusic => 'バックグラウンドミュージック';

  @override
  String get sfx => '効果音';

  @override
  String get sfxDescription => 'ゲーム内の効果音を有効';

  @override
  String get language => '言語設定';

  @override
  String get languageSelect => '言語';

  @override
  String get privacySettings => 'プライバシー・その他';

  @override
  String get rankingDisplay => 'ランキング表示';

  @override
  String get hideFromRanking => '非表示';

  @override
  String get showInRanking => 'プレイヤー名を表示';

  @override
  String get clearedPrefectures => 'クリア県';

  @override
  String get totalPlayers => 'プレイヤー';

  @override
  String get gameTitle => '地理パズル王';

  @override
  String get startGame => 'ゲーム開始';

  @override
  String get profile => 'プロフィール';

  @override
  String get japanese => '日本語';

  @override
  String get english => 'English';

  @override
  String get difficulty => '難易度';

  @override
  String get easy => 'イージー';

  @override
  String get normal => 'ノーマル';

  @override
  String get hard => 'ハード';

  @override
  String get score => 'スコア';

  @override
  String get level => 'レベル';

  @override
  String get stage => 'ステージ';

  @override
  String get gameOver => 'ゲームオーバー';

  @override
  String get victory => '勝利';

  @override
  String get retry => 'リトライ';

  @override
  String get back => '戻る';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get loading => 'ローディング中...';

  @override
  String get error => 'エラー';

  @override
  String get tryAgain => 'もう一度試す';

  @override
  String get menu => 'メニュー';

  @override
  String get pokedex => '図鑑';

  @override
  String get hqUpgrade => '本部強化';

  @override
  String get nationalConquest => '全国制圧';

  @override
  String get deploy => '出撃する';

  @override
  String get deploySubtitle => '都道府県を選んで防衛開始';

  @override
  String get conqueredCount => '制圧県';

  @override
  String get totalScore => '総スコア';

  @override
  String get achievements => '実績';

  @override
  String commanderName(String name) {
    return '指揮官 $name';
  }

  @override
  String get appInfo => 'アプリ情報';

  @override
  String get version => 'バージョン';

  @override
  String get buildNumber => 'ビルド番号';

  @override
  String get adsAndPurchases => '広告・課金';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get termsOfServiceTitle => '利用規約';

  @override
  String get removeAds => '広告を削除';

  @override
  String get removeAdsPurchased => '広告除去（購入済み）';

  @override
  String get purchaseThankYou => 'ご購入ありがとうございます';

  @override
  String get storeConnectionError => 'ストアに接続できませんでした';

  @override
  String get notAvailableNow => '現在ご利用いただけません';

  @override
  String get purchaseButton => '購入';

  @override
  String get guestPlayer => 'ゲストプレイヤー';

  @override
  String get changePlayerName => 'プレイヤー名を変更';

  @override
  String get personalInfoWarning => '個人を特定する情報（本名、住所など）は入力しないでください。他のプレイヤーに表示される可能性があります。';

  @override
  String get save => '保存';

  @override
  String removeAdsDescription(String price) {
    return '$price — ゲーム内の広告表示がすべて非表示になります';
  }

  @override
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total 県';
  }

  @override
  String conquestPercent(String percent) {
    return '$percent% 制圧完了';
  }
}
