// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '도도부현 게임';

  @override
  String get appSubtitle => '게임으로 배우는 도도부현';

  @override
  String get gameDescription => '47개 도도부현을 모두 지켜라!';

  @override
  String get nickname => '닉네임 입력';

  @override
  String get nicknameHint => 'tankenkka';

  @override
  String get nicknameInstruction => '히라가나 또는 가타카나로 입력해 주세요';

  @override
  String get startButton => '시작!';

  @override
  String get errorInvalidNickname => '닉네임을 입력해 주세요';

  @override
  String get home => '홈';

  @override
  String get game => '게임';

  @override
  String get map => '지도';

  @override
  String get ranking => '랭킹';

  @override
  String get settings => '설정';

  @override
  String get territory => '일본 통일 지도';

  @override
  String get unificationProgress => '통일도';

  @override
  String get prefectures => '도도부현';

  @override
  String get globalRanking => '글로벌';

  @override
  String get prefectureVersus => '도도부현 대항전';

  @override
  String get userInfo => '사용자 정보';

  @override
  String get playerName => '플레이어 이름';

  @override
  String get notifications => '알림 설정';

  @override
  String get pushNotifications => '푸시 알림';

  @override
  String get dailyEvents => '데일리 이벤트・대전 알림';

  @override
  String get soundSettings => '사운드 설정';

  @override
  String get bgm => 'BGM';

  @override
  String get backgroundMusic => '배경음악';

  @override
  String get sfx => '효과음';

  @override
  String get sfxDescription => '게임 내 효과음 사용';

  @override
  String get language => '언어 설정';

  @override
  String get languageSelect => '언어 선택';

  @override
  String get privacySettings => '개인정보・기타';

  @override
  String get rankingDisplay => '랭킹 표시';

  @override
  String get hideFromRanking => '숨기기';

  @override
  String get showInRanking => '플레이어 이름 표시';

  @override
  String get clearedPrefectures => '클리어 현';

  @override
  String get totalPlayers => '플레이어';

  @override
  String get gameTitle => '지리 퍼즐킹';

  @override
  String get startGame => '게임 시작';

  @override
  String get profile => '프로필';

  @override
  String get japanese => '일본어';

  @override
  String get english => '영어';

  @override
  String get chinese => '중국어';

  @override
  String get korean => '한국어';

  @override
  String get difficulty => '난이도';

  @override
  String get easy => '이지';

  @override
  String get normal => '노멀';

  @override
  String get hard => '하드';

  @override
  String get score => '점수';

  @override
  String get level => '레벨';

  @override
  String get stage => '스테이지';

  @override
  String get gameOver => '게임 오버';

  @override
  String get victory => '승리';

  @override
  String get retry => '재도전';

  @override
  String get back => '뒤로';

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get loading => '로딩 중...';

  @override
  String get error => '오류';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get menu => '메뉴';

  @override
  String get pokedex => '도감';

  @override
  String get hqUpgrade => '본부 강화';

  @override
  String get nationalConquest => '전국 제패';

  @override
  String get deploy => '출격';

  @override
  String get deploySubtitle => '도도부현을 선택해 방어를 시작하세요';

  @override
  String get conqueredCount => '제압 현';

  @override
  String get totalScore => '총 점수';

  @override
  String get achievements => '업적';

  @override
  String commanderName(String name) {
    return '지휘관 $name';
  }

  @override
  String get appInfo => '앱 정보';

  @override
  String get version => '버전';

  @override
  String get buildNumber => '빌드 번호';

  @override
  String get adsAndPurchases => '광고・결제';

  @override
  String get privacyPolicyTitle => '개인정보처리방침';

  @override
  String get termsOfServiceTitle => '이용약관';

  @override
  String get removeAds => '광고 제거';

  @override
  String get removeAdsPurchased => '광고 제거됨 (구매완료)';

  @override
  String get purchaseThankYou => '구매해 주셔서 감사합니다';

  @override
  String get storeConnectionError => '스토어에 연결할 수 없습니다';

  @override
  String get notAvailableNow => '현재 이용할 수 없습니다';

  @override
  String get purchaseButton => '구매';

  @override
  String get guestPlayer => '게스트 플레이어';

  @override
  String get changePlayerName => '플레이어 이름 변경';

  @override
  String get personalInfoWarning => '개인정보(실명, 주소 등)는 입력하지 마세요. 다른 플레이어에게 표시될 수 있습니다.';

  @override
  String get save => '저장';

  @override
  String removeAdsDescription(String price) {
    return '$price — 게임 내 모든 광고를 제거합니다';
  }

  @override
  String get unlockMap => '전체 도도부현 잠금 해제';

  @override
  String get unlockMapPurchased => '전체 도도부현 잠금 해제됨';

  @override
  String get unlockMapThankYou => '47개 도도부현 전부 플레이 가능합니다';

  @override
  String unlockMapDescription(String price) {
    return '$price — 47개 도도부현 전체, 지역전 및 역사전이 해제됩니다';
  }

  @override
  String get stageLockedTitle => '🔒 이 도도부현은 잠겨 있습니다';

  @override
  String stageLockedBody(int count) {
    return '무료로 플레이할 수 있는 것은 처음 $count개 도도부현까지입니다.\n프리미엄(1회 구매)을 구매하면 47개 전부 플레이하고 광고도 사라집니다.';
  }

  @override
  String get goToPurchaseButton => '구매 화면으로';

  @override
  String get rankingTitle => '랭킹';

  @override
  String get rankingTabGlobal => '글로벌';

  @override
  String get rankingTabPrefecture => '도도부현 대항전';

  @override
  String rankingClearedCount(int cleared) {
    return '클리어 현: $cleared / 47';
  }

  @override
  String get pointsSuffix => 'pts';

  @override
  String rankingPlayerCount(int count) {
    return '플레이어: $count 명';
  }

  @override
  String get territoryMapTitle => '일본 통일 지도';

  @override
  String get japanMapLabel => '일본 지도';

  @override
  String get mapDataAttribution => '지도 데이터: Global Map Japan, GSI';

  @override
  String genericErrorPrefix(String error) {
    return '오류: $error';
  }

  @override
  String get territoryUnificationLabel => '일본 통일도';

  @override
  String get statsSectionTitle => '📊 통계 정보';

  @override
  String get statTotalClears => '총 클리어 횟수';

  @override
  String get statAverageLevel => '평균 레벨';

  @override
  String get statHighScore => '최고 점수';

  @override
  String timesSuffix(int count) {
    return '$count 회';
  }

  @override
  String get pokedexTitle => '도감';

  @override
  String get pokedexTabCleared => '클리어 현';

  @override
  String get pokedexTabStats => '통계';

  @override
  String get pokedexTabAchievements => '업적';

  @override
  String get clearProgressLabel => '클리어 진행도';

  @override
  String percentComplete(String percent) {
    return '$percent% 완료';
  }

  @override
  String get learningStatsTitle => '학습 통계';

  @override
  String get statClearedPrefCount => '클리어 현 수';

  @override
  String get statTotalPlayTime => '총 플레이 시간';

  @override
  String hoursMinutesFormat(int hours, int minutes) {
    return '$hours시간 $minutes분';
  }

  @override
  String get statTotalScore => '총 점수';

  @override
  String get statTotalGamesPlayed => '총 플레이 횟수';

  @override
  String get clearsByDifficultyLabel => '난이도별 클리어 수';

  @override
  String get achievementsTitle => '업적';

  @override
  String get kanaLabel => '가나: ';

  @override
  String get capitalCityLabel => '현청 소재지: ';

  @override
  String populationLabel(String population) {
    return '인구: 약 $population명';
  }

  @override
  String get areaLabel => '면적: ';

  @override
  String bestScoreLabel(String score) {
    return '최고 점수: $score pts';
  }

  @override
  String get clearedDifficultiesLabel => '클리어한 난이도: ';

  @override
  String get specialtiesLabel => '특산품: ';

  @override
  String get closeButton => '닫기';

  @override
  String get researchPointsLabel => '연구 포인트';

  @override
  String get researchPointsHint => '도도부현을 클리어하면 획득';

  @override
  String levelFraction(int level, int max) {
    return 'Lv.$level / $max';
  }

  @override
  String currentEffectLabel(String effect) {
    return '현재 효과: $effect';
  }

  @override
  String get maxLabel => 'MAX';

  @override
  String upgradeForCostButton(int cost) {
    return '🔬$cost 강화';
  }

  @override
  String get hqTrackAttackTitle => '⚔️ 무기 개발';

  @override
  String get hqTrackCoinTitle => '💰 경제 정책';

  @override
  String get hqTrackHpTitle => '🏯 성벽 강화';

  @override
  String get hqTrackAttackDescription => '모든 시설의 데미지가 영구적으로 증가';

  @override
  String get hqTrackCoinDescription => '적 처치 시 획득 코인이 영구적으로 증가';

  @override
  String get hqTrackHpDescription => '모든 스테이지의 초기 HP가 영구적으로 증가';

  @override
  String get selectPrefectureTitle => '도도부현 선택';

  @override
  String get tabPrefectures => '도도부현';

  @override
  String get tabRegionBattle => '지역 결전';

  @override
  String get tabHistoryBattle => '역사 결전';

  @override
  String get searchByNameHint => '이름으로 검색';

  @override
  String get regionAll => '전국';

  @override
  String countSuffix(int count) {
    return '$count';
  }

  @override
  String get legendConquered => '제압 완료';

  @override
  String get legendDifficulty => '난이도';

  @override
  String get regionUnlockHint => '지역 내 모든 도도부현을 어느 난이도로든 클리어하면 해제됩니다';

  @override
  String bossLabel(String name) {
    return '보스: $name';
  }

  @override
  String clearedOfTotalPref(int cleared, int total) {
    return '$cleared/$total 현';
  }

  @override
  String regionBattleHeader(String name) {
    return '$name 지역 결전';
  }

  @override
  String regionBattleSubheader(int waves) {
    return 'WAVE $waves  ／  지역 통일로 가는 길';
  }

  @override
  String get conqueredBanner => '제압 완료!';

  @override
  String bossSkillLabel(String skill) {
    return '스킬 「$skill」';
  }

  @override
  String targetPrefecturesHeader(int count) {
    return '대상 도도부현 ($count현)';
  }

  @override
  String get selectDifficultyLabel => '난이도 선택';

  @override
  String get startRegionBattleButton => '지역 결전 시작';

  @override
  String get historyUnlockedBanner => '🏆 전국 하드 제패 달성! 역사 결전 해제!';

  @override
  String get postgameSectionLabel => '⚔️ 엔드콘텐츠';

  @override
  String get historyUnlockHint => '47개 도도부현을 하드 난이도로 클리어하면\n「신들의 시대」가 해제됩니다';

  @override
  String hardClearedProgress(int count) {
    return '$count / 47 현 하드 클리어';
  }

  @override
  String get conqueredBadge => '제패';

  @override
  String bossWaveCount(String name, int waves) {
    return '$name  •  $waves웨이브';
  }

  @override
  String get historyLockReason1 => '전국 하드 클리어 후 해제';

  @override
  String get historyLockReason2 => '이전 역사 스테이지 클리어 후 해제';

  @override
  String get historyConqueredBanner => '역사 결전 제패 완료!';

  @override
  String wavesUltraHard(int waves) {
    return '$waves웨이브・초고난도';
  }

  @override
  String get startHistoryBattleButton => '역사 결전 시작!';

  @override
  String get exclusiveBadge => '한정';

  @override
  String get difficultyLabel => '난이도';

  @override
  String get terrainLabel => '지형';

  @override
  String get notConqueredLabel => '미제압';

  @override
  String conqueredDifficultiesLabel(String diffs) {
    return '제압 난이도: $diffs';
  }

  @override
  String get capitalCityTitle => '현청 소재지';

  @override
  String get areaTitle => '면적';

  @override
  String bossStatsLine(int hp, int attack, String skill) {
    return 'HP $hp / 공격 $attack / 스킬 「$skill」';
  }

  @override
  String get startDefenseButton => '방어 시작';

  @override
  String get exclusiveFacilityLabel => '한정 시설';

  @override
  String industryBonusLine(String label, int pct) {
    return '$label 시설 강화 +$pct% (비용 감소・위력 증가)';
  }

  @override
  String get geographySea => '바다・연안';

  @override
  String get geographyMountain => '산악';

  @override
  String get geographyUrban => '도시';

  @override
  String get geographyAgriculture => '농업';

  @override
  String get geographyMixed => '복합';

  @override
  String get facilityDescDairyFarm => '적의 속도를 -20%하는 낙농 시설';

  @override
  String get facilityDescAlpineWatch => '장거리 공격과 슬로우 효과를 가진 감시소';

  @override
  String get facilityDescToyotaFactory => '고속 공격 + 추가 코인 생성';

  @override
  String get facilityDescKiyomizuTemple => '적에게 주는 피해 +40%';

  @override
  String get facilityDescPeaceShrine => '적에게 실드를 부여해 약화시킴';

  @override
  String get facilityDescShisaGuardian => '40% 확률로 1초간 스턴';

  @override
  String get facilityDescUmeSakeBrewery => '50% 확률로 슬로우 부여';

  @override
  String get facilityDescUdonShop => '초저비용・고속 공격';

  @override
  String get facilityDescDefault => '이 도도부현 한정 특수 시설';

  @override
  String get searchByPrefNameHint => '현 이름으로 검색';

  @override
  String get difficultyDescriptionEasy => '적이 약하고 느림\n하트 많음・휴식 길게\n초보자・어린이에게 추천';

  @override
  String get difficultyDescriptionNormal => '표준 난이도\n배치를 잘 생각하면 클리어';

  @override
  String get difficultyDescriptionHard => '적 HP +30%・빠름\n웨이브 +2・하트 적음\n점수 ×1.5';

  @override
  String minSecFormat(int m, int s) {
    return '$m분 $s초';
  }

  @override
  String secFormat(int s) {
    return '$s초';
  }

  @override
  String get victoryTitle => '클리어!';

  @override
  String get statTime => '시간';

  @override
  String get statMistakes => '실수';

  @override
  String learnAboutPrefHeader(String name) {
    return '📚 $name에 대해 알아보자!';
  }

  @override
  String get geographySectionTitle => '지리';

  @override
  String get industryPopSectionTitle => '산업・인구';

  @override
  String get populationTitle => '인구';

  @override
  String get specialtiesTitle => '특산품';

  @override
  String populationApprox(String population) {
    return '약 $population명';
  }

  @override
  String companionJoinedMessage(String name) {
    return '$name이(가) 동료가 되었습니다!';
  }

  @override
  String get badgesEarnedHeader => '획득한 배지';

  @override
  String bossDefeatedLine(String name) {
    return '$name을(를) 격파했습니다!';
  }

  @override
  String regionConqueredLine(String name) {
    return '$name 지역을 제압했습니다';
  }

  @override
  String stageClearedLine(String name) {
    return '$name 클리어!';
  }

  @override
  String get historyMasterAchievedBanner => '🏆 올클리어 달성! 역사의 수호자로 인정!';

  @override
  String get retryButton => '다시하기';

  @override
  String get backToMapButton => '지도로 돌아가기';

  @override
  String waveClearShopTitle(int wave) {
    return '웨이브 $wave 클리어! 상점';
  }

  @override
  String get chooseOneItemHint => '아이템을 1개 선택하세요';

  @override
  String get freeLabel => '무료';

  @override
  String get skipButton => '건너뛰기';

  @override
  String get cannotPlaceFacility => '시설을 배치할 수 없습니다';

  @override
  String get notEnoughCoins => '코인이 부족합니다';

  @override
  String get blocksPath => '이 위치는 길을 막습니다';

  @override
  String get tileOccupied => '이미 시설이 있습니다';

  @override
  String notEnoughCoinsNeeded(int cost, int coins) {
    return '🪙 코인이 부족합니다 (필요: $cost, 보유: $coins)';
  }

  @override
  String get blocksPathDetailed => '🛤️ 이 타일은 길을 막습니다';

  @override
  String get tileOccupiedDetailed => '⚠️ 이미 시설이 있습니다';

  @override
  String get selectWaveSkillButton => '웨이브 스킬 선택';

  @override
  String get effectAppliesNextWaveHint => '효과는 다음 웨이브부터 적용됩니다';

  @override
  String get statAttack => '공격력';

  @override
  String get statRange => '사거리';

  @override
  String get statSpeed => '속도';

  @override
  String facilityUpgradeButton(int cost) {
    return '업그레이드 🪙$cost';
  }

  @override
  String notEnoughCoinsSimple(int cost) {
    return '코인 부족 (필요: $cost)';
  }

  @override
  String sellForButton(int amount) {
    return '판매 (+$amount🪙)';
  }

  @override
  String get quitConfirmTitle => '전투를 중단하시겠습니까?';

  @override
  String get quitConfirmBody => '이 전투를 중단하고 처음 화면으로 돌아가시겠습니까?';

  @override
  String get continueButton => '계속하기';

  @override
  String get abortButton => '중단';

  @override
  String historyBattleWaveBadge(int waves) {
    return '역사 결전 $waves웨이브';
  }

  @override
  String get regionBattleWaveBadge => '지역 결전 7웨이브';

  @override
  String get skillSelectedStatus => '스킬이 선택되었습니다';

  @override
  String secondsUntilNextWave(int seconds) {
    return '다음 웨이브까지 $seconds초';
  }

  @override
  String get startNowButton => '지금 시작';

  @override
  String get answerQuizPrompt => '퀴즈에 답해 보자!';

  @override
  String get gameStartButton => '시작!';

  @override
  String waveCounter(int current, int total) {
    return '웨이브 $current/$total';
  }

  @override
  String remainingEnemies(int count) {
    return '$count마리 남음';
  }

  @override
  String nextWavePreviewLabel(int wave) {
    return '다음 W$wave:';
  }

  @override
  String enemyCountSuffix(int count) {
    return '$count마리  ';
  }

  @override
  String get ultimateReadyLabel => '필살기 발동 가능! 탭하세요!';

  @override
  String get ultimateButtonLabel => '필살・영토 방어';

  @override
  String get placeFacilitiesHint => '시설을 배치하고\n「시작!」을 눌러주세요';

  @override
  String clearedOfTotal(int cleared, int total) {
    return '$cleared / $total';
  }

  @override
  String conquestPercent(String percent) {
    return '$percent% 제압 완료';
  }

  @override
  String get facilityNameFarm => '농업';

  @override
  String get facilityNameFishery => '어업';

  @override
  String get facilityNameFactory => '공업';

  @override
  String get facilityNameMine => '광업';

  @override
  String get facilityNameCastle => '성';

  @override
  String get facilityNameShrine => '신사';

  @override
  String get facilityNameDairyFarm => '낙농 시설';

  @override
  String get facilityNameAlpineWatch => '고산 감시소';

  @override
  String get facilityNameToyotaFactory => '토요타 공장';

  @override
  String get facilityNameKiyomizuTemple => '기요미즈데라';

  @override
  String get facilityNamePeaceShrine => '평화 기념비';

  @override
  String get facilityNameShisaGuardian => '시사 수호상';

  @override
  String get facilityNameUmeSakeBrewery => '기슈 매실주 양조장';

  @override
  String get facilityNameUdonShop => '우동 가게';

  @override
  String get prefectureName01 => '홋카이도';

  @override
  String get prefectureName02 => '아오모리현';

  @override
  String get prefectureName03 => '이와테현';

  @override
  String get prefectureName04 => '미야기현';

  @override
  String get prefectureName05 => '아키타현';

  @override
  String get prefectureName06 => '야마가타현';

  @override
  String get prefectureName07 => '후쿠시마현';

  @override
  String get prefectureName08 => '이바라키현';

  @override
  String get prefectureName09 => '도치기현';

  @override
  String get prefectureName10 => '군마현';

  @override
  String get prefectureName11 => '사이타마현';

  @override
  String get prefectureName12 => '지바현';

  @override
  String get prefectureName13 => '도쿄도';

  @override
  String get prefectureName14 => '가나가와현';

  @override
  String get prefectureName15 => '니가타현';

  @override
  String get prefectureName16 => '도야마현';

  @override
  String get prefectureName17 => '이시카와현';

  @override
  String get prefectureName18 => '후쿠이현';

  @override
  String get prefectureName19 => '야마나시현';

  @override
  String get prefectureName20 => '나가노현';

  @override
  String get prefectureName21 => '기후현';

  @override
  String get prefectureName22 => '시즈오카현';

  @override
  String get prefectureName23 => '아이치현';

  @override
  String get prefectureName24 => '미에현';

  @override
  String get prefectureName25 => '시가현';

  @override
  String get prefectureName26 => '교토부';

  @override
  String get prefectureName27 => '오사카부';

  @override
  String get prefectureName28 => '효고현';

  @override
  String get prefectureName29 => '나라현';

  @override
  String get prefectureName30 => '와카야마현';

  @override
  String get prefectureName31 => '돗토리현';

  @override
  String get prefectureName32 => '시마네현';

  @override
  String get prefectureName33 => '오카야마현';

  @override
  String get prefectureName34 => '히로시마현';

  @override
  String get prefectureName35 => '야마구치현';

  @override
  String get prefectureName36 => '도쿠시마현';

  @override
  String get prefectureName37 => '가가와현';

  @override
  String get prefectureName38 => '에히메현';

  @override
  String get prefectureName39 => '고치현';

  @override
  String get prefectureName40 => '후쿠오카현';

  @override
  String get prefectureName41 => '사가현';

  @override
  String get prefectureName42 => '나가사키현';

  @override
  String get prefectureName43 => '구마모토현';

  @override
  String get prefectureName44 => '오이타현';

  @override
  String get prefectureName45 => '미야자키현';

  @override
  String get prefectureName46 => '가고시마현';

  @override
  String get prefectureName47 => '오키나와현';

}
