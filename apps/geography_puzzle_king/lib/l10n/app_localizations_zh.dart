// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '都道府县游戏';

  @override
  String get appSubtitle => '在游戏中学习都道府县';

  @override
  String get gameDescription => '守护全部47个都道府县！';

  @override
  String get nickname => '输入昵称';

  @override
  String get nicknameHint => 'tankenkka';

  @override
  String get nicknameInstruction => '请使用平假名或片假名输入';

  @override
  String get startButton => '开始！';

  @override
  String get errorInvalidNickname => '请输入昵称';

  @override
  String get home => '首页';

  @override
  String get game => '游戏';

  @override
  String get map => '地图';

  @override
  String get ranking => '排行榜';

  @override
  String get settings => '设置';

  @override
  String get territory => '日本统一地图';

  @override
  String get unificationProgress => '统一度';

  @override
  String get prefectures => '都道府县';

  @override
  String get globalRanking => '全球';

  @override
  String get prefectureVersus => '都道府县对抗';

  @override
  String get userInfo => '用户信息';

  @override
  String get playerName => '玩家名称';

  @override
  String get notifications => '通知设置';

  @override
  String get pushNotifications => '推送通知';

  @override
  String get dailyEvents => '每日活动・对战通知';

  @override
  String get soundSettings => '音效设置';

  @override
  String get bgm => '背景音乐';

  @override
  String get backgroundMusic => '背景音乐';

  @override
  String get sfx => '音效';

  @override
  String get sfxDescription => '启用游戏内音效';

  @override
  String get language => '语言设置';

  @override
  String get languageSelect => '选择语言';

  @override
  String get privacySettings => '隐私与其他';

  @override
  String get rankingDisplay => '排行榜显示';

  @override
  String get hideFromRanking => '隐藏';

  @override
  String get showInRanking => '显示玩家名称';

  @override
  String get clearedPrefectures => '通关县';

  @override
  String get totalPlayers => '玩家数';

  @override
  String get gameTitle => '地理拼图王';

  @override
  String get startGame => '开始游戏';

  @override
  String get profile => '个人资料';

  @override
  String get japanese => '日语';

  @override
  String get english => '英语';

  @override
  String get chinese => '中文';

  @override
  String get korean => '韩语';

  @override
  String get difficulty => '难度';

  @override
  String get easy => '简单';

  @override
  String get normal => '普通';

  @override
  String get hard => '困难';

  @override
  String get score => '分数';

  @override
  String get level => '等级';

  @override
  String get stage => '关卡';

  @override
  String get gameOver => '游戏结束';

  @override
  String get victory => '胜利';

  @override
  String get retry => '重试';

  @override
  String get back => '返回';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get tryAgain => '再试一次';

  @override
  String get menu => '菜单';

  @override
  String get pokedex => '图鉴';

  @override
  String get hqUpgrade => '总部强化';

  @override
  String get nationalConquest => '全国制霸';

  @override
  String get deploy => '出击';

  @override
  String get deploySubtitle => '选择都道府县开始防守';

  @override
  String get conqueredCount => '制霸县';

  @override
  String get totalScore => '总分';

  @override
  String get achievements => '成就';

  @override
  String commanderName(String name) {
    return '指挥官 $name';
  }

  @override
  String get appInfo => '应用信息';

  @override
  String get version => '版本';

  @override
  String get buildNumber => '构建号';

  @override
  String get adsAndPurchases => '广告与购买';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get termsOfServiceTitle => '服务条款';

  @override
  String get removeAds => '移除广告';

  @override
  String get removeAdsPurchased => '广告已移除（已购买）';

  @override
  String get purchaseThankYou => '感谢您的购买';

  @override
  String get storeConnectionError => '无法连接到商店';

  @override
  String get notAvailableNow => '当前不可用';

  @override
  String get purchaseButton => '购买';

  @override
  String get guestPlayer => '访客玩家';

  @override
  String get changePlayerName => '更改玩家名称';

  @override
  String get personalInfoWarning => '请勿输入个人信息（真实姓名、地址等）。可能会显示给其他玩家。';

  @override
  String get save => '保存';

  @override
  String removeAdsDescription(String price) {
    return '$price — 移除所有游戏内广告';
  }

  @override
  String get unlockMap => '解锁全部都道府县';

  @override
  String get unlockMapPurchased => '全部都道府县已解锁';

  @override
  String get unlockMapThankYou => '全部47个都道府县均可游玩';

  @override
  String unlockMapDescription(String price) {
    return '$price — 解锁全部47个都道府县、地区战与历史战';
  }

  @override
  String get stageLockedTitle => '🔒 该都道府县已锁定';

  @override
  String stageLockedBody(int count) {
    return '仅前$count个都道府县可免费游玩。\n购买“解锁全部都道府县”即可游玩全部47个。';
  }

  @override
  String get goToPurchaseButton => '前往购买';

  @override
  String get rankingTitle => '排行榜';

  @override
  String get rankingTabGlobal => '全球';

  @override
  String get rankingTabPrefecture => '都道府县对抗';

  @override
  String rankingClearedCount(int cleared) {
    return '通关县：$cleared / 47';
  }

  @override
  String get pointsSuffix => '分';

  @override
  String rankingPlayerCount(int count) {
    return '玩家：$count 人';
  }

  @override
  String get territoryMapTitle => '日本统一地图';

  @override
  String get japanMapLabel => '日本地图';

  @override
  String get mapDataAttribution => '地图数据：Global Map Japan, GSI';

  @override
  String genericErrorPrefix(String error) {
    return '错误：$error';
  }

  @override
  String get territoryUnificationLabel => '日本统一度';

  @override
  String get statsSectionTitle => '📊 统计信息';

  @override
  String get statTotalClears => '总通关次数';

  @override
  String get statAverageLevel => '平均等级';

  @override
  String get statHighScore => '最高分';

  @override
  String timesSuffix(int count) {
    return '$count 次';
  }

  @override
  String get pokedexTitle => '图鉴';

  @override
  String get pokedexTabCleared => '通关县';

  @override
  String get pokedexTabStats => '统计';

  @override
  String get pokedexTabAchievements => '成就';

  @override
  String get clearProgressLabel => '通关进度';

  @override
  String percentComplete(String percent) {
    return '完成 $percent%';
  }

  @override
  String get learningStatsTitle => '学习统计';

  @override
  String get statClearedPrefCount => '通关县数';

  @override
  String get statTotalPlayTime => '总游玩时间';

  @override
  String hoursMinutesFormat(int hours, int minutes) {
    return '$hours小时$minutes分钟';
  }

  @override
  String get statTotalScore => '总分';

  @override
  String get statTotalGamesPlayed => '总游玩次数';

  @override
  String get clearsByDifficultyLabel => '各难度通关数';

  @override
  String get achievementsTitle => '成就';

  @override
  String get kanaLabel => '假名：';

  @override
  String get capitalCityLabel => '县厅：';

  @override
  String populationLabel(String population) {
    return '人口：约$population人';
  }

  @override
  String get areaLabel => '面积：';

  @override
  String bestScoreLabel(String score) {
    return '最高分：$score 分';
  }

  @override
  String get clearedDifficultiesLabel => '已通关难度：';

  @override
  String get specialtiesLabel => '特产：';

  @override
  String get closeButton => '关闭';

  @override
  String get researchPointsLabel => '研究点数';

  @override
  String get researchPointsHint => '通过通关都道府县获得';

  @override
  String levelFraction(int level, int max) {
    return 'Lv.$level / $max';
  }

  @override
  String currentEffectLabel(String effect) {
    return '当前效果：$effect';
  }

  @override
  String get maxLabel => 'MAX';

  @override
  String upgradeForCostButton(int cost) {
    return '🔬$cost 强化';
  }

  @override
  String get hqTrackAttackTitle => '⚔️ 武器开发';

  @override
  String get hqTrackCoinTitle => '💰 经济政策';

  @override
  String get hqTrackHpTitle => '🏯 城墙强化';

  @override
  String get hqTrackAttackDescription => '永久提升所有设施伤害';

  @override
  String get hqTrackCoinDescription => '永久提升击败敌人获得的金币';

  @override
  String get hqTrackHpDescription => '永久提升所有关卡初始生命值';

  @override
  String get selectPrefectureTitle => '选择都道府县';

  @override
  String get tabPrefectures => '都道府县';

  @override
  String get tabRegionBattle => '地区决战';

  @override
  String get tabHistoryBattle => '历史决战';

  @override
  String get searchByNameHint => '按名称搜索';

  @override
  String get regionAll => '全国';

  @override
  String countSuffix(int count) {
    return '$count 项';
  }

  @override
  String get legendConquered => '已制霸';

  @override
  String get legendDifficulty => '难度';

  @override
  String get regionUnlockHint => '以任意难度通关该地区全部都道府县即可解锁';

  @override
  String bossLabel(String name) {
    return '首领：$name';
  }

  @override
  String clearedOfTotalPref(int cleared, int total) {
    return '$cleared/$total 县';
  }

  @override
  String regionBattleHeader(String name) {
    return '$name地区 决战';
  }

  @override
  String regionBattleSubheader(int waves) {
    return 'WAVE $waves  ／  通往地区统一之路';
  }

  @override
  String get conqueredBanner => '已制霸！';

  @override
  String bossSkillLabel(String skill) {
    return '技能「$skill」';
  }

  @override
  String targetPrefecturesHeader(int count) {
    return '目标都道府县（$count县）';
  }

  @override
  String get selectDifficultyLabel => '选择难度';

  @override
  String get startRegionBattleButton => '开始地区决战';

  @override
  String get historyUnlockedBanner => '🏆 全国困难制霸达成！历史决战已解锁！';

  @override
  String get postgameSectionLabel => '⚔️ 后续挑战内容';

  @override
  String get historyUnlockHint => '以困难难度通关全部47个都道府县\n即可解锁「诸神时代」';

  @override
  String hardClearedProgress(int count) {
    return '$count / 47 县 已困难通关';
  }

  @override
  String get conqueredBadge => '制霸';

  @override
  String bossWaveCount(String name, int waves) {
    return '$name  •  $waves波';
  }

  @override
  String get historyLockReason1 => '通关全部困难难度后解锁';

  @override
  String get historyLockReason2 => '通关上一历史关卡后解锁';

  @override
  String get historyConqueredBanner => '历史决战已制霸！';

  @override
  String wavesUltraHard(int waves) {
    return '$waves波・极高难度';
  }

  @override
  String get startHistoryBattleButton => '开始历史决战！';

  @override
  String get exclusiveBadge => '限定';

  @override
  String get difficultyLabel => '难度';

  @override
  String get terrainLabel => '地形';

  @override
  String get notConqueredLabel => '未制霸';

  @override
  String conqueredDifficultiesLabel(String diffs) {
    return '已制霸难度：$diffs';
  }

  @override
  String get capitalCityTitle => '县厅所在地';

  @override
  String get areaTitle => '面积';

  @override
  String bossStatsLine(int hp, int attack, String skill) {
    return 'HP $hp / 攻击 $attack / 技能「$skill」';
  }

  @override
  String get startDefenseButton => '开始防守';

  @override
  String get exclusiveFacilityLabel => '限定设施';

  @override
  String industryBonusLine(String label, int pct) {
    return '$label设施 强化 +$pct%（成本降低・威力提升）';
  }

  @override
  String get geographySea => '海・沿海';

  @override
  String get geographyMountain => '山岳';

  @override
  String get geographyUrban => '都市';

  @override
  String get geographyAgriculture => '农业';

  @override
  String get geographyMixed => '综合';

  @override
  String get facilityDescDairyFarm => '使敌人速度降低20%的酪农设施';

  @override
  String get facilityDescAlpineWatch => '远程瞭望台，附带减速效果';

  @override
  String get facilityDescToyotaFactory => '高速攻击＋额外金币产出';

  @override
  String get facilityDescKiyomizuTemple => '对敌人造成伤害 +40%';

  @override
  String get facilityDescPeaceShrine => '为敌人附加护盾使其弱化';

  @override
  String get facilityDescShisaGuardian => '40%几率使敌人眩晕1秒';

  @override
  String get facilityDescUmeSakeBrewery => '50%几率附加减速效果';

  @override
  String get facilityDescUdonShop => '超低成本・高速攻击';

  @override
  String get facilityDescDefault => '该都道府县限定的特殊设施';

  @override
  String get searchByPrefNameHint => '按县名搜索';

  @override
  String get difficultyDescriptionEasy => '敌人较弱且较慢\n生命更多・休息更长\n适合新手和小朋友';

  @override
  String get difficultyDescriptionNormal => '标准难度\n合理布置即可通关';

  @override
  String get difficultyDescriptionHard => '敌方HP +30%・更快\n波数 +2・生命更少\n分数 ×1.5';

  @override
  String minSecFormat(int m, int s) {
    return '$m分$s秒';
  }

  @override
  String secFormat(int s) {
    return '$s秒';
  }

  @override
  String get victoryTitle => '通关！';

  @override
  String get statTime => '时间';

  @override
  String get statMistakes => '失误';

  @override
  String learnAboutPrefHeader(String name) {
    return '📚 了解$name吧！';
  }

  @override
  String get geographySectionTitle => '地理';

  @override
  String get industryPopSectionTitle => '产业与人口';

  @override
  String get populationTitle => '人口';

  @override
  String get specialtiesTitle => '特产';

  @override
  String populationApprox(String population) {
    return '约 $population 人';
  }

  @override
  String companionJoinedMessage(String name) {
    return '$name 加入了你的队伍！';
  }

  @override
  String get badgesEarnedHeader => '获得的徽章';

  @override
  String bossDefeatedLine(String name) {
    return '击败了$name！';
  }

  @override
  String regionConqueredLine(String name) {
    return '制霸了$name地区';
  }

  @override
  String stageClearedLine(String name) {
    return '$name 通关！';
  }

  @override
  String get historyMasterAchievedBanner => '🏆 全部达成！被认证为历史守护者！';

  @override
  String get retryButton => '再来一次';

  @override
  String get backToMapButton => '返回地图';

  @override
  String waveClearShopTitle(int wave) {
    return '波数$wave通关！商店';
  }

  @override
  String get chooseOneItemHint => '请选择一个道具';

  @override
  String get freeLabel => '免费';

  @override
  String get skipButton => '跳过';

  @override
  String get cannotPlaceFacility => '无法在此放置设施';

  @override
  String get notEnoughCoins => '金币不足';

  @override
  String get blocksPath => '这会挡住道路';

  @override
  String get tileOccupied => '此处已有设施';

  @override
  String notEnoughCoinsNeeded(int cost, int coins) {
    return '🪙 金币不足（需要：$cost，持有：$coins）';
  }

  @override
  String get blocksPathDetailed => '🛤️ 该位置会挡住道路';

  @override
  String get tileOccupiedDetailed => '⚠️ 此处已有设施';

  @override
  String get selectWaveSkillButton => '选择波数技能';

  @override
  String get effectAppliesNextWaveHint => '效果将从下一波开始生效';

  @override
  String get statAttack => '攻击力';

  @override
  String get statRange => '射程';

  @override
  String get statSpeed => '速度';

  @override
  String facilityUpgradeButton(int cost) {
    return '升级 🪙$cost';
  }

  @override
  String notEnoughCoinsSimple(int cost) {
    return '金币不足（需要：$cost）';
  }

  @override
  String sellForButton(int amount) {
    return '卖出 (+$amount🪙)';
  }

  @override
  String get quitConfirmTitle => '要中断战斗吗？';

  @override
  String get quitConfirmBody => '要中断本场战斗并返回首页吗？';

  @override
  String get continueButton => '继续';

  @override
  String get abortButton => '中断';

  @override
  String historyBattleWaveBadge(int waves) {
    return '历史决战 $waves波';
  }

  @override
  String get regionBattleWaveBadge => '地区决战 7波';

  @override
  String get skillSelectedStatus => '技能已选择';

  @override
  String secondsUntilNextWave(int seconds) {
    return '距下一波还有 $seconds 秒';
  }

  @override
  String get startNowButton => '立即开始';

  @override
  String get answerQuizPrompt => '回答问题吧！';

  @override
  String get gameStartButton => '开始!';

  @override
  String waveCounter(int current, int total) {
    return '波数 $current/$total';
  }

  @override
  String remainingEnemies(int count) {
    return '剩余 $count 个';
  }

  @override
  String nextWavePreviewLabel(int wave) {
    return '下一波 W$wave:';
  }

  @override
  String enemyCountSuffix(int count) {
    return '$count只  ';
  }

  @override
  String get ultimateReadyLabel => '必杀技已就绪！点击！';

  @override
  String get ultimateButtonLabel => '必杀・领土防卫';

  @override
  String get placeFacilitiesHint => '放置设施后\n按下「开始!」';

  @override
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total';
  }

  @override
  String conquestPercent(String percent) {
    return '已制霸 $percent%';
  }

  @override
  String get facilityNameFarm => '农业';

  @override
  String get facilityNameFishery => '渔业';

  @override
  String get facilityNameFactory => '工业';

  @override
  String get facilityNameMine => '矿业';

  @override
  String get facilityNameCastle => '城堡';

  @override
  String get facilityNameShrine => '神社';

  @override
  String get facilityNameDairyFarm => '酪农设施';

  @override
  String get facilityNameAlpineWatch => '高山瞭望台';

  @override
  String get facilityNameToyotaFactory => '丰田工厂';

  @override
  String get facilityNameKiyomizuTemple => '清水寺';

  @override
  String get facilityNamePeaceShrine => '和平纪念碑';

  @override
  String get facilityNameShisaGuardian => '风狮爷守卫';

  @override
  String get facilityNameUmeSakeBrewery => '纪州梅酒酿造所';

  @override
  String get facilityNameUdonShop => '乌冬面店';

  @override
  String get prefectureName01 => '北海道';

  @override
  String get prefectureName02 => '青森县';

  @override
  String get prefectureName03 => '岩手县';

  @override
  String get prefectureName04 => '宫城县';

  @override
  String get prefectureName05 => '秋田县';

  @override
  String get prefectureName06 => '山形县';

  @override
  String get prefectureName07 => '福岛县';

  @override
  String get prefectureName08 => '茨城县';

  @override
  String get prefectureName09 => '枥木县';

  @override
  String get prefectureName10 => '群马县';

  @override
  String get prefectureName11 => '埼玉县';

  @override
  String get prefectureName12 => '千叶县';

  @override
  String get prefectureName13 => '东京都';

  @override
  String get prefectureName14 => '神奈川县';

  @override
  String get prefectureName15 => '新潟县';

  @override
  String get prefectureName16 => '富山县';

  @override
  String get prefectureName17 => '石川县';

  @override
  String get prefectureName18 => '福井县';

  @override
  String get prefectureName19 => '山梨县';

  @override
  String get prefectureName20 => '长野县';

  @override
  String get prefectureName21 => '岐阜县';

  @override
  String get prefectureName22 => '静冈县';

  @override
  String get prefectureName23 => '爱知县';

  @override
  String get prefectureName24 => '三重县';

  @override
  String get prefectureName25 => '滋贺县';

  @override
  String get prefectureName26 => '京都府';

  @override
  String get prefectureName27 => '大阪府';

  @override
  String get prefectureName28 => '兵库县';

  @override
  String get prefectureName29 => '奈良县';

  @override
  String get prefectureName30 => '和歌山县';

  @override
  String get prefectureName31 => '鸟取县';

  @override
  String get prefectureName32 => '岛根县';

  @override
  String get prefectureName33 => '冈山县';

  @override
  String get prefectureName34 => '广岛县';

  @override
  String get prefectureName35 => '山口县';

  @override
  String get prefectureName36 => '德岛县';

  @override
  String get prefectureName37 => '香川县';

  @override
  String get prefectureName38 => '爱媛县';

  @override
  String get prefectureName39 => '高知县';

  @override
  String get prefectureName40 => '福冈县';

  @override
  String get prefectureName41 => '佐贺县';

  @override
  String get prefectureName42 => '长崎县';

  @override
  String get prefectureName43 => '熊本县';

  @override
  String get prefectureName44 => '大分县';

  @override
  String get prefectureName45 => '宫崎县';

  @override
  String get prefectureName46 => '鹿儿岛县';

  @override
  String get prefectureName47 => '冲绳县';

}
