/// 課金なしで遊べる都道府県コード（先頭5県: 北海道・青森・岩手・宮城・秋田）。
/// それ以外の都道府県・地方決戦・歴史ステージは「全都道府県マップ解放」
/// （買い切りIAP、商品ID: [kUnlockMapProductId]）の購入が必要。
/// 「広告除去」（商品ID: [kRemoveAdsProductId]）は別売りの独立した課金。
const Set<String> kFreePrefectureCodes = {'01', '02', '03', '04', '05'};

bool isPrefectureFree(String prefectureCode) =>
    kFreePrefectureCodes.contains(prefectureCode);
