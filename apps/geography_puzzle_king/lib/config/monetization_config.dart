/// 課金なしで遊べる都道府県コード（先頭5県: 北海道・青森・岩手・宮城・秋田）。
/// それ以外の都道府県・地方決戦・歴史ステージは「全都道府県マップ解放」
/// （買い切りIAP、商品ID: [kUnlockMapProductId]）の購入が必要。
/// 「広告除去」（商品ID: [kRemoveAdsProductId]）は別売りの独立した課金。
/// 「プレミアムプラン」（商品ID: [kPremiumPlanProductId]）は広告除去＋マップ解放
/// をまとめた統合商品。個別課金は後方互換のため残しており、購入者の権利は
/// プレミアムプラン追加後も損なわれない。
const Set<String> kFreePrefectureCodes = {'01', '02', '03', '04', '05'};

bool isPrefectureFree(String prefectureCode) =>
    kFreePrefectureCodes.contains(prefectureCode);
