/// ゲーム内の画像アセット管理

/// 敵タイプ別の画像パス
const Map<String, String> enemyTypeImages = {
  'normal': 'assets/images/characters/1. ノーマル (Normal Enemy).jpg',
  'speedy': 'assets/images/characters/2. スピード (Speedy Enemy).jpg',
  'armored': 'assets/images/characters/3. 装甲 (Armored Enemy).jpg',
  'healer': 'assets/images/characters/4. ヒーラー (Healer Enemy).jpg',
};

/// 施設タイプ別の画像パス
const Map<String, String> facilityTypeImages = {
  'farm': 'assets/images/facilities/農場.jpg',
  'fishery': 'assets/images/facilities/漁業.jpg',
  'factory': 'assets/images/facilities/工場.jpg',
  'mine': 'assets/images/facilities/鉱山.jpg',
  'castle': 'assets/images/facilities/城.jpg',
  'shrine': 'assets/images/facilities/神社.jpg',
};

/// ボス敵の画像パス（県ごと）
const Map<String, String> bossEnemyImages = {
  '01': 'assets/images/characters/01. ジャガイモ大王 — 北海道.jpg',
  '02': 'assets/images/characters/02. りんご騎士 — 青森.jpg',
  // ... 全47都道府県
};

String? getEnemyImage(String enemyType) => enemyTypeImages[enemyType];
String? getFacilityImage(String facilityType) => facilityTypeImages[facilityType];
String? getBossImage(String prefCode) => bossEnemyImages[prefCode];
