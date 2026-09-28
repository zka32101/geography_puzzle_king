import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 「広告除去」アプリ内課金の商品ID。
///
/// App Store Connect / Google Play Consoleの両方で、この文字列と
/// 完全に一致する商品を事前に作成しておくこと（未作成だとqueryProductDetailsで
/// notFoundIDsに含まれる）。
const String kRemoveAdsProductId = 'remove_ads';

/// 「全都道府県マップ解放」アプリ内課金の商品ID。
///
/// [kRemoveAdsProductId] とは別の買い切り商品。App Store Connect /
/// Google Play Consoleの両方でこの文字列と完全に一致する商品を
/// 事前に作成しておくこと。
const String kUnlockMapProductId = 'unlock_map';

/// 「プレミアムプラン」アプリ内課金の商品ID。
///
/// [kRemoveAdsProductId]（広告除去）と [kUnlockMapProductId]（マップ解放）を
/// 1つにまとめた統合商品。購入すると広告非表示＋全マップ解放＋今後追加される
/// プレミアム特典が有効になる。App Store Connect / Google Play Consoleの
/// 両方でこの文字列と完全に一致する商品を事前に作成しておくこと（未作成の間は
/// queryProductDetailsでnotFoundIDsに含まれ、[PurchaseService.fetchPremiumPlanProduct]は
/// nullを返す＝画面上は「現在購入できません」表示になるだけで、既存の個別課金には
/// 影響しない）。
const String kPremiumPlanProductId = 'premium_plan_unlock';

/// アプリ内課金（広告除去・マップ解放・プレミアムプラン）の管理サービス。
///
/// 購入結果は端末ローカル（SharedPreferences）に保存する。複数端末間の
/// 同期が必要になった場合は、Firestore等への保存を別途追加すること。
///
/// 後方互換について: [kRemoveAdsProductId] / [kUnlockMapProductId] は
/// 個別課金として引き続き購入可能。[kPremiumPlanProductId]
/// （プレミアムプラン）はこの2つを内包する上位互換の統合商品で、
/// 購入すると両方のフラグが同時に立つ。既に個別購入済みのユーザーが
/// 後からプレミアムプランを買う必要はない（[isAdsRemoved] /
/// [isMapUnlocked] は個別購入・プレミアムプランのどちらでもtrueになる）。
class PurchaseService {
  static const _keyAdsRemoved = 'ads_removed_v1';
  static const _keyMapUnlocked = 'map_unlocked_v1';
  static const _keyPremiumPlan = 'premium_plan_v1';

  final SharedPreferences _prefs;
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  PurchaseService(this._prefs);

  bool get isPremiumPlan => _prefs.getBool(_keyPremiumPlan) ?? false;

  // 広告除去・マップ解放は「個別課金」または「プレミアムプラン」のどちらか
  // 一方でも購入済みならtrueを返す。
  bool get isAdsRemoved => (_prefs.getBool(_keyAdsRemoved) ?? false) || isPremiumPlan;
  bool get isMapUnlocked => (_prefs.getBool(_keyMapUnlocked) ?? false) || isPremiumPlan;

  Future<void> _setAdsRemoved() => _prefs.setBool(_keyAdsRemoved, true);
  Future<void> _setMapUnlocked() => _prefs.setBool(_keyMapUnlocked, true);
  Future<void> _setPremiumPlan() => _prefs.setBool(_keyPremiumPlan, true);

  /// 購入更新イベントの購読を開始する。アプリ起動時に一度だけ呼ぶこと。
  ///
  /// [onPurchased] には購入が確定した商品IDが渡される
  /// （[kRemoveAdsProductId] / [kUnlockMapProductId] / [kPremiumPlanProductId]）。
  void startListening({required void Function(String productId) onPurchased}) {
    _subscription?.cancel();
    _subscription = _iap.purchaseStream.listen((purchases) async {
      for (final purchase in purchases) {
        final isKnownProduct = purchase.productID == kRemoveAdsProductId ||
            purchase.productID == kUnlockMapProductId ||
            purchase.productID == kPremiumPlanProductId;
        if (!isKnownProduct) continue;

        if (purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored) {
          if (purchase.productID == kRemoveAdsProductId) {
            await _setAdsRemoved();
          } else if (purchase.productID == kUnlockMapProductId) {
            await _setMapUnlocked();
          } else {
            // プレミアムプラン: 広告除去＋マップ解放を同時に有効化。
            await _setPremiumPlan();
          }
          onPurchased(purchase.productID);
        }

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
      }
    });
  }

  Future<bool> isStoreAvailable() => _iap.isAvailable();

  /// ストア上の商品情報（価格表示等）を取得する共通ヘルパー。
  Future<ProductDetails?> _fetchProduct(String productId) async {
    final response = await _iap.queryProductDetails({productId});
    if (response.error != null || response.productDetails.isEmpty) {
      return null;
    }
    return response.productDetails.first;
  }

  Future<ProductDetails?> fetchRemoveAdsProduct() => _fetchProduct(kRemoveAdsProductId);
  Future<ProductDetails?> fetchUnlockMapProduct() => _fetchProduct(kUnlockMapProductId);
  Future<ProductDetails?> fetchPremiumPlanProduct() => _fetchProduct(kPremiumPlanProductId);

  Future<void> buyNonConsumable(ProductDetails product) async {
    final param = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: param);
  }

  /// 「購入の復元」（機種変更・再インストール時用）。
  Future<void> restorePurchases() => _iap.restorePurchases();

  void dispose() {
    _subscription?.cancel();
  }
}
