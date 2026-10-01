/// ゲーム内の画像アセット管理

import 'package:geography_puzzle_king/utils/prefecture_data.dart';

/// 敵タイプ別の画像パス
const Map<String, String> enemyTypeImages = {
  'normal': 'assets/images/characters/1. ノーマル (Normal Enemy).jpg',
  'speedy': 'assets/images/characters/2. スピード (Speedy Enemy).jpg',
  'armored': 'assets/images/characters/3. 装甲 (Armored Enemy).jpg',
  'healer': 'assets/images/characters/4. ヒーラー (Healer Enemy).jpg',
};

/// 地方決戦ボス（r01〜r08）の画像パス
const Map<String, String> regionBossImages = {
  'r01': 'assets/images/characters/R01. 北の覇王 — 北海道地方.jpg',
  'r02': 'assets/images/characters/R02. 東北の荒神 — 東北地方.jpg',
  'r03': 'assets/images/characters/R03. 関東の大覇者 — 関東地方.jpg',
  'r04': 'assets/images/characters/R04. 富士の神将 — 中部地方.jpg',
  'r05': 'assets/images/characters/R05. 千年帝都の覇 — 近畿地方.jpg',
  'r06': 'assets/images/characters/R06. 瀬戸の海神 — 中国地方.jpg',
  'r07': 'assets/images/characters/R07. 四国の巡礼魔 — 四国地方.jpg',
  'r08': 'assets/images/characters/R08. 南海の大魔王 — 九州・沖縄地方.jpg',
};

/// 歴史決戦ボス（h01〜h04）の画像パス
/// ※h02のみアセットファイル名が「02.」始まりになっている（命名の揺れ）。
const Map<String, String> historyBossImages = {
  'h01': 'assets/images/characters/H01. 八岐大蛇 — 神代の決戦.jpg',
  'h02': 'assets/images/characters/02. 覇王の化身 — 戦国の決戦.jpg',
  'h03': 'assets/images/characters/H03. 黒船の怪物 — 幕末・文明開化.jpg',
  'h04': 'assets/images/characters/H04. 令和の覇者 — 令和の最終決戦.jpg',
};

/// 現在のステージ（都道府県 / 地方決戦 / 歴史決戦）に応じたボス画像を取得する。
/// [regionCode] は GameScreen.regionCode（''=都道府県, 'r0X'=地方決戦, 'hXX'=歴史決戦）。
String? getBossImage({required String prefCode, required String regionCode}) {
  if (regionCode.startsWith('h')) {
    return historyBossImages[regionCode];
  }
  if (regionCode.isNotEmpty) {
    return regionBossImages[regionCode];
  }
  return prefectureBossImages[prefCode];
}

/// 施設タイプ別の画像パス
const Map<String, String> facilityTypeImages = {
  'farm': 'assets/images/facilities/農場.jpg',
  'fishery': 'assets/images/facilities/漁場.jpg',
  'factory': 'assets/images/facilities/工場.jpg',
  'mine': 'assets/images/facilities/鉱山.jpg',
  'castle': 'assets/images/facilities/城.jpg',
  'shrine': 'assets/images/facilities/神社.jpg',
  // 都道府県限定施設（特別感を演出する専用ビジュアル）
  'dairyFarm': 'assets/images/facilities/北海道酪農.jpg',
  'alpineWatch': 'assets/images/facilities/高山番所.jpg',
  'toyotaFactory': 'assets/images/facilities/トヨタ.jpg',
  'kiyomizuTemple': 'assets/images/facilities/清水寺.jpg',
  'peaceShrine': 'assets/images/facilities/広島平和.jpg',
  'shisaGuardian': 'assets/images/facilities/沖縄シーサー守り.jpg',
  'umeSakeBrewery': 'assets/images/facilities/梅酒.jpg',
  'udonShop': 'assets/images/facilities/博多うどん.jpg',
};

String? getEnemyImage(String enemyType) => enemyTypeImages[enemyType];
String? getFacilityImage(String facilityType) => facilityTypeImages[facilityType];
