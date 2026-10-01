/// 課金なしで遊べる都道府県コード（先頭10県: 北海道・青森・岩手・宮城・秋田・
/// 山形・福島・茨城・栃木・群馬）。
/// それ以外の都道府県・地方決戦・歴史ステージは「全都道府県マップ解放」
/// （買い切りIAP、商品ID: [kUnlockMapProductId]）の購入が必要。
/// 「広告除去」（商品ID: [kRemoveAdsProductId]）は別売りの独立した課金。
/// 現行の販売商品は「プレミアム」（買い切り約3ドル、商品ID: [kPremiumPlanProductId]）
/// のみ。広告除去＋全解放を含む。上記の個別商品は販売終了で、UIには出さないが
/// 過去の購入者の権利は後方互換のため引き続き有効。
const Set<String> kFreePrefectureCodes = {
  '01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
};

bool isPrefectureFree(String prefectureCode) =>
    kFreePrefectureCodes.contains(prefectureCode);
