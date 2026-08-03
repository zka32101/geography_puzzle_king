/// 課金なしで遊べる都道府県コード（先頭3県: 北海道・青森・岩手）。
/// それ以外の都道府県・地方決戦・歴史ステージは「広告除去+全ステージ解放」
/// （買い切りIAP、商品ID: [kRemoveAdsProductId]）の購入が必要。
const Set<String> kFreePrefectureCodes = {'01', '02', '03'};

bool isPrefectureFree(String prefectureCode) =>
    kFreePrefectureCodes.contains(prefectureCode);
