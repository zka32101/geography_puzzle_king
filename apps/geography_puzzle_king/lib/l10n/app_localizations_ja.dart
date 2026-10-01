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
  String get chinese => '中国語';

  @override
  String get korean => '韓国語';

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
  String get personalInfoWarning =>
      '個人を特定する情報（本名、住所など）は入力しないでください。他のプレイヤーに表示される可能性があります。';

  @override
  String get save => '保存';

  @override
  String removeAdsDescription(String price) {
    return '$price — ゲーム内の広告表示がすべて非表示になります';
  }

  @override
  String get unlockMap => '全都道府県マップを解放';

  @override
  String get unlockMapPurchased => '全都道府県マップ解放済み';

  @override
  String get unlockMapThankYou => '全47都道府県がプレイ可能です';

  @override
  String unlockMapDescription(String price) {
    return '$price — 全47都道府県・地方決戦・歴史決戦が解放されます';
  }

  @override
  String get stageLockedTitle => '🔒 この都道府県はロック中';

  @override
  String stageLockedBody(int count) {
    return '無料でプレイできるのは最初の$count都道府県までです。\n「全都道府県マップを解放」を購入すると全47都道府県がプレイできます。';
  }

  @override
  String get goToPurchaseButton => '購入画面へ';

  @override
  String get rankingTitle => 'ランキング';

  @override
  String get rankingTabGlobal => 'グローバル';

  @override
  String get rankingTabPrefecture => '都道府県対抗';

  @override
  String rankingClearedCount(int cleared) {
    return 'クリア県: $cleared / 47';
  }

  @override
  String get pointsSuffix => 'pts';

  @override
  String rankingPlayerCount(int count) {
    return 'プレイヤー: $count 人';
  }

  @override
  String get territoryMapTitle => '日本統一マップ';

  @override
  String get japanMapLabel => '日本地図';

  @override
  String get mapDataAttribution => '地図データ: 「地球地図日本」国土地理院';

  @override
  String genericErrorPrefix(String error) {
    return 'エラー: $error';
  }

  @override
  String get territoryUnificationLabel => '日本統一度';

  @override
  String get statsSectionTitle => '📊 統計情報';

  @override
  String get statTotalClears => '総クリア回数';

  @override
  String get statAverageLevel => '平均レベル';

  @override
  String get statHighScore => '最高スコア';

  @override
  String timesSuffix(int count) {
    return '$count 回';
  }

  @override
  String get pokedexTitle => '図鑑';

  @override
  String get pokedexTabCleared => 'クリア県';

  @override
  String get pokedexTabStats => '統計';

  @override
  String get pokedexTabAchievements => '実績';

  @override
  String get clearProgressLabel => 'クリア進捗';

  @override
  String percentComplete(String percent) {
    return '$percent% 完成';
  }

  @override
  String get learningStatsTitle => '学習統計';

  @override
  String get statClearedPrefCount => 'クリア県数';

  @override
  String get statTotalPlayTime => '総プレイ時間';

  @override
  String hoursMinutesFormat(int hours, int minutes) {
    return '$hours 時間 $minutes 分';
  }

  @override
  String get statTotalScore => '総スコア';

  @override
  String get statTotalGamesPlayed => '総プレイ回数';

  @override
  String get clearsByDifficultyLabel => '難度別クリア数';

  @override
  String get achievementsTitle => '実績';

  @override
  String get defeatedBossLabel => '撃破したボス: ';

  @override
  String bossStoryAppears(String bossName) {
    return '$bossName 現る！';
  }

  @override
  String get bossStoryFightButton => 'たたかう！';

  @override
  String get howToPlayTitle => '遊び方';

  @override
  String get howToPlayStep1Title => '都道府県を選ぼう';

  @override
  String get howToPlayStep1Description => 'マップから挑戦したい都道府県を選んで出撃準備をしよう。';

  @override
  String get howToPlayStep2Title => '施設を配置して防衛しよう';

  @override
  String get howToPlayStep2Description => 'コインを使って道の周りに施設を建てて、敵の侵攻を防ごう。';

  @override
  String get howToPlayStep3Title => 'ボスを倒そう';

  @override
  String get howToPlayStep3Description =>
      '各都道府県にはその土地を象徴するボスが登場する。すべての波を防ぎきってボスを撃破しよう。';

  @override
  String get howToPlayStep4Title => 'スコアとランキング';

  @override
  String get howToPlayStep4Description =>
      'クリアタイム・ミス回数に応じてスコアが決まる。ランキング画面で全国のプレイヤーと競い合おう。';

  @override
  String get howToPlayStep5Title => '図鑑でふりかえろう';

  @override
  String get howToPlayStep5Description => 'クリアした都道府県は図鑑に記録される。倒したボスや実績も確認できるよ。';

  @override
  String get howToPlaySettingsTile => '遊び方';

  @override
  String get howToPlaySettingsSubtitle => 'ゲームの基本ルールを確認する';

  @override
  String get premiumPlanTitle => 'プレミアムプラン';

  @override
  String get premiumPlanTitlePurchased => 'プレミアムプラン（購入済み）';

  @override
  String get premiumPlanSubtitle => '広告除去＋マップ解放がまとめてお得に';

  @override
  String get premiumPlanSubtitlePurchased => '広告非表示・全マップ解放が有効です';

  @override
  String get premiumPlanBenefitsHeading => 'プレミアムプランの特典';

  @override
  String get premiumPlanBenefitAdsFreeTitle => '広告完全非表示';

  @override
  String get premiumPlanBenefitAdsFreeDescription =>
      'プレイ中・結果画面のバナー広告・インタースティシャル広告が表示されなくなります。';

  @override
  String get premiumPlanBenefitMapUnlockTitle => '全都道府県マップ解放';

  @override
  String get premiumPlanBenefitMapUnlockDescription =>
      '47都道府県すべて・地方決戦・歴史決戦ステージがいつでもプレイ可能になります。';

  @override
  String get premiumPlanBenefitFutureTitle => '今後の追加特典';

  @override
  String get premiumPlanBenefitFutureDescription =>
      '今後追加されるプレミアム限定コンテンツ・機能も順次利用できます。';

  @override
  String get premiumPlanDescriptionNote => '広告除去・マップ解放を個別に購入するよりお得な統合プランです。';

  @override
  String get premiumPlanPurchasedMessage => 'プレミアムプラン購入済みです。ご購入ありがとうございます！';

  @override
  String get premiumPlanPriceLabel => '価格';

  @override
  String get premiumPlanBuyButton => 'プレミアムプランを購入する';

  @override
  String get hometownLabel => '出身地（都道府県対抗ランキング用）';

  @override
  String get hometownNotSet => '未設定';

  @override
  String get rankingEmptyGlobal => 'まだランキングデータがありません。ゲームをクリアして最初のランカーになろう！';

  @override
  String get rankingEmptyPrefecture => 'まだランキングデータがありません。';

  @override
  String get kanaLabel => 'かな: ';

  @override
  String get capitalCityLabel => '県庁: ';

  @override
  String populationLabel(String population) {
    return '人口: 約$population人';
  }

  @override
  String get areaLabel => '面積: ';

  @override
  String bestScoreLabel(String score) {
    return 'ベストスコア: $score pts';
  }

  @override
  String get clearedDifficultiesLabel => 'クリア難度: ';

  @override
  String get specialtiesLabel => '特産品: ';

  @override
  String get closeButton => '閉じる';

  @override
  String get researchPointsLabel => '研究ポイント';

  @override
  String get researchPointsHint => '都道府県クリアで獲得';

  @override
  String levelFraction(int level, int max) {
    return 'Lv.$level / $max';
  }

  @override
  String currentEffectLabel(String effect) {
    return '現在の効果: $effect';
  }

  @override
  String get maxLabel => 'MAX';

  @override
  String upgradeForCostButton(int cost) {
    return '🔬$cost で強化';
  }

  @override
  String get hqTrackAttackTitle => '⚔️ 兵器開発';

  @override
  String get hqTrackCoinTitle => '💰 経済政策';

  @override
  String get hqTrackHpTitle => '🏯 城壁強化';

  @override
  String get hqTrackAttackDescription => '全施設のダメージが永続的にアップ';

  @override
  String get hqTrackCoinDescription => '敵撃破時のコイン獲得量が永続的にアップ';

  @override
  String get hqTrackHpDescription => '全ステージの初期HPが永続的にアップ';

  @override
  String get selectPrefectureTitle => '都道府県を選択';

  @override
  String get tabPrefectures => '都道府県';

  @override
  String get tabRegionBattle => '地方決戦';

  @override
  String get tabHistoryBattle => '歴史決戦';

  @override
  String get searchByNameHint => '県名・かなで検索';

  @override
  String get regionAll => '全国';

  @override
  String countSuffix(int count) {
    return '$count 件';
  }

  @override
  String get legendConquered => '制圧済';

  @override
  String get legendDifficulty => '難易度';

  @override
  String get regionUnlockHint => '地方内の全都道府県をいずれかの難度でクリアすると解放されます';

  @override
  String bossLabel(String name) {
    return 'ボス: $name';
  }

  @override
  String clearedOfTotalPref(int cleared, int total) {
    return '$cleared/$total県';
  }

  @override
  String regionBattleHeader(String name) {
    return '$name地方 決戦';
  }

  @override
  String regionBattleSubheader(int waves) {
    return 'WAVE $waves  ／  地方統一への道';
  }

  @override
  String get conqueredBanner => '制圧済み！';

  @override
  String bossSkillLabel(String skill) {
    return 'スキル「$skill」';
  }

  @override
  String targetPrefecturesHeader(int count) {
    return '対象都道府県（$count県）';
  }

  @override
  String get selectDifficultyLabel => '難度を選択';

  @override
  String get startRegionBattleButton => '地方決戦 開始';

  @override
  String get historyUnlockedBanner => '🏆 全国ハード制覇達成！歴史決戦解放！';

  @override
  String get postgameSectionLabel => '⚔️ やりこみ要素';

  @override
  String get historyUnlockHint => '全47都道府県をハード難度でクリアすると\n「神代の決戦」が解放されます';

  @override
  String hardClearedProgress(int count) {
    return '$count / 47 県 ハードクリア済み';
  }

  @override
  String get conqueredBadge => '制覇';

  @override
  String bossWaveCount(String name, int waves) {
    return '$name  •  $waves波';
  }

  @override
  String get historyLockReason1 => '全国ハードクリアで解放';

  @override
  String get historyLockReason2 => '前の歴史ステージをクリアで解放';

  @override
  String get historyConqueredBanner => '歴史決戦 制覇済み！';

  @override
  String wavesUltraHard(int waves) {
    return '$waves波・超高難度';
  }

  @override
  String get startHistoryBattleButton => '歴史決戦 開始！';

  @override
  String get exclusiveBadge => '限定';

  @override
  String get difficultyLabel => '難易度';

  @override
  String get terrainLabel => '地形';

  @override
  String get notConqueredLabel => '未制圧';

  @override
  String conqueredDifficultiesLabel(String diffs) {
    return '制圧難度: $diffs';
  }

  @override
  String get capitalCityTitle => '県庁';

  @override
  String get areaTitle => '面積';

  @override
  String bossStatsLine(int hp, int attack, String skill) {
    return 'HP $hp / 攻撃 $attack / スキル「$skill」';
  }

  @override
  String get startDefenseButton => '防衛開始';

  @override
  String get exclusiveFacilityLabel => '限定施設';

  @override
  String industryBonusLine(String label, int pct) {
    return '$label施設 強化 +$pct%（コスト減・威力増）';
  }

  @override
  String get geographySea => '海・沿岸';

  @override
  String get geographyMountain => '山岳';

  @override
  String get geographyUrban => '都市';

  @override
  String get geographyAgriculture => '農業';

  @override
  String get geographyMixed => '複合';

  @override
  String get facilityDescDairyFarm => '敵の速度を-20%する酪農施設';

  @override
  String get facilityDescAlpineWatch => '長射程＋スロー付与の見張所';

  @override
  String get facilityDescToyotaFactory => '高速攻撃＋コイン生成';

  @override
  String get facilityDescKiyomizuTemple => '敵への被ダメージ+40%';

  @override
  String get facilityDescPeaceShrine => '敵にシールドを付与し弱体化';

  @override
  String get facilityDescShisaGuardian => '40%でスタン（1秒）';

  @override
  String get facilityDescUmeSakeBrewery => '50%でスロー付与';

  @override
  String get facilityDescUdonShop => '超低コスト・高速攻撃';

  @override
  String get facilityDescDefault => '都道府県限定の特殊施設';

  @override
  String get searchByPrefNameHint => '県名で検索';

  @override
  String get difficultyDescriptionEasy =>
      '敵が弱くてゆっくり\nハート多め・休憩長め\nはじめての人・小さい子向け';

  @override
  String get difficultyDescriptionNormal => '標準の難しさ\n置き方を考えればクリア';

  @override
  String get difficultyDescriptionHard => '敵HP +30%・速い\n波数 +2・ハート少なめ\nスコア ×1.5';

  @override
  String minSecFormat(int m, int s) {
    return '$m分$s秒';
  }

  @override
  String secFormat(int s) {
    return '$s秒';
  }

  @override
  String get victoryTitle => 'クリア！';

  @override
  String get statTime => '時間';

  @override
  String get statMistakes => 'ミス';

  @override
  String learnAboutPrefHeader(String name) {
    return '📚 $name を学ぼう！';
  }

  @override
  String get geographySectionTitle => '地理';

  @override
  String get industryPopSectionTitle => '産業・人口';

  @override
  String get populationTitle => '人口';

  @override
  String get specialtiesTitle => '特産品';

  @override
  String populationApprox(String population) {
    return '約 $population 人';
  }

  @override
  String companionJoinedMessage(String name) {
    return '$name が仲間になった！';
  }

  @override
  String get badgesEarnedHeader => '獲得バッジ';

  @override
  String bossDefeatedLine(String name) {
    return '$name を撃破！';
  }

  @override
  String regionConqueredLine(String name) {
    return '$name地方を制圧しました';
  }

  @override
  String stageClearedLine(String name) {
    return '$name クリア！';
  }

  @override
  String get historyMasterAchievedBanner => '🏆 やりこみ達成！歴史の守護者に認定！';

  @override
  String get retryButton => 'もう一度';

  @override
  String get backToMapButton => 'マップへ';

  @override
  String waveClearShopTitle(int wave) {
    return 'ウェーブ$waveクリア！ショップ';
  }

  @override
  String get chooseOneItemHint => 'アイテムを1つ選んでください';

  @override
  String get freeLabel => '無料';

  @override
  String get skipButton => 'スキップ';

  @override
  String get cannotPlaceFacility => '施設を配置できません';

  @override
  String get notEnoughCoins => '金貨が足りません';

  @override
  String get blocksPath => '道を塞いでます';

  @override
  String get tileOccupied => 'すでに施設があります';

  @override
  String notEnoughCoinsNeeded(int cost, int coins) {
    return '🪙 金貨が足りません (必要: $cost, 保持: $coins)';
  }

  @override
  String get blocksPathDetailed => '🛤️ この場所は道を塞ぎます';

  @override
  String get tileOccupiedDetailed => '⚠️ この場所には既に施設があります';

  @override
  String get selectWaveSkillButton => 'ウェーブスキルを選択';

  @override
  String get effectAppliesNextWaveHint => '次のウェーブで効果が適用されます';

  @override
  String get statAttack => '攻撃力';

  @override
  String get statRange => '射程';

  @override
  String get statSpeed => '速度';

  @override
  String facilityUpgradeButton(int cost) {
    return 'アップグレード 🪙$cost';
  }

  @override
  String notEnoughCoinsSimple(int cost) {
    return 'コイン不足 (必要: $cost)';
  }

  @override
  String sellForButton(int amount) {
    return '売却 (+$amount🪙)';
  }

  @override
  String get quitConfirmTitle => '中断しますか？';

  @override
  String get quitConfirmBody => 'ゲームを中断してトップに戻りますか？';

  @override
  String get continueButton => '続ける';

  @override
  String get abortButton => '中断';

  @override
  String historyBattleWaveBadge(int waves) {
    return '歴史決戦 $waves波';
  }

  @override
  String get regionBattleWaveBadge => '地方決戦 7波';

  @override
  String get skillSelectedStatus => 'スキルが選択されました';

  @override
  String secondsUntilNextWave(int seconds) {
    return '次のウェーブまで $seconds 秒';
  }

  @override
  String get startNowButton => '今すぐ開始';

  @override
  String get answerQuizPrompt => 'クイズに答えよう！';

  @override
  String get gameStartButton => '開始!';

  @override
  String waveCounter(int current, int total) {
    return 'ウェーブ $current/$total';
  }

  @override
  String remainingEnemies(int count) {
    return '残り $count 体';
  }

  @override
  String nextWavePreviewLabel(int wave) {
    return '次 W$wave:';
  }

  @override
  String enemyCountSuffix(int count) {
    return '$count体  ';
  }

  @override
  String get ultimateReadyLabel => '必殺技 発動可能！タップ！';

  @override
  String get ultimateButtonLabel => '必殺・領土防衛';

  @override
  String get placeFacilitiesHint => '施設を配置して\n「開始!」を押してください';

  @override
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total 県';
  }

  @override
  String conquestPercent(String percent) {
    return '$percent% 制圧完了';
  }

  @override
  String get facilityNameFarm => '農業';

  @override
  String get facilityNameFishery => '漁業';

  @override
  String get facilityNameFactory => '工業';

  @override
  String get facilityNameMine => '鉱業';

  @override
  String get facilityNameCastle => '城';

  @override
  String get facilityNameShrine => '神社';

  @override
  String get facilityNameDairyFarm => '酪農施設';

  @override
  String get facilityNameAlpineWatch => '高山見張所';

  @override
  String get facilityNameToyotaFactory => 'トヨタ工場';

  @override
  String get facilityNameKiyomizuTemple => '清水寺';

  @override
  String get facilityNamePeaceShrine => '平和記念碑';

  @override
  String get facilityNameShisaGuardian => 'シーサー守り';

  @override
  String get facilityNameUmeSakeBrewery => '紀州梅酒醸造所';

  @override
  String get facilityNameUdonShop => 'うどん店';

  @override
  String get prefectureName01 => '北海道';

  @override
  String get prefectureName02 => '青森県';

  @override
  String get prefectureName03 => '岩手県';

  @override
  String get prefectureName04 => '宮城県';

  @override
  String get prefectureName05 => '秋田県';

  @override
  String get prefectureName06 => '山形県';

  @override
  String get prefectureName07 => '福島県';

  @override
  String get prefectureName08 => '茨城県';

  @override
  String get prefectureName09 => '栃木県';

  @override
  String get prefectureName10 => '群馬県';

  @override
  String get prefectureName11 => '埼玉県';

  @override
  String get prefectureName12 => '千葉県';

  @override
  String get prefectureName13 => '東京都';

  @override
  String get prefectureName14 => '神奈川県';

  @override
  String get prefectureName15 => '新潟県';

  @override
  String get prefectureName16 => '富山県';

  @override
  String get prefectureName17 => '石川県';

  @override
  String get prefectureName18 => '福井県';

  @override
  String get prefectureName19 => '山梨県';

  @override
  String get prefectureName20 => '長野県';

  @override
  String get prefectureName21 => '岐阜県';

  @override
  String get prefectureName22 => '静岡県';

  @override
  String get prefectureName23 => '愛知県';

  @override
  String get prefectureName24 => '三重県';

  @override
  String get prefectureName25 => '滋賀県';

  @override
  String get prefectureName26 => '京都府';

  @override
  String get prefectureName27 => '大阪府';

  @override
  String get prefectureName28 => '兵庫県';

  @override
  String get prefectureName29 => '奈良県';

  @override
  String get prefectureName30 => '和歌山県';

  @override
  String get prefectureName31 => '鳥取県';

  @override
  String get prefectureName32 => '島根県';

  @override
  String get prefectureName33 => '岡山県';

  @override
  String get prefectureName34 => '広島県';

  @override
  String get prefectureName35 => '山口県';

  @override
  String get prefectureName36 => '徳島県';

  @override
  String get prefectureName37 => '香川県';

  @override
  String get prefectureName38 => '愛媛県';

  @override
  String get prefectureName39 => '高知県';

  @override
  String get prefectureName40 => '福岡県';

  @override
  String get prefectureName41 => '佐賀県';

  @override
  String get prefectureName42 => '長崎県';

  @override
  String get prefectureName43 => '熊本県';

  @override
  String get prefectureName44 => '大分県';

  @override
  String get prefectureName45 => '宮崎県';

  @override
  String get prefectureName46 => '鹿児島県';

  @override
  String get prefectureName47 => '沖縄県';
}
