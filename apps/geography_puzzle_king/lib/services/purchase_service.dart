import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 「広告除去」アプリ内課金の商品ID。
///
/// App Store Connect / Google Play Consoleの両方で、この文字列と
/// 完全に一致する商品を事前に作成しておくこと（未作成だとqueryProductDetailsで
/// notFoundIDsに含まれる）。
const String kRemoveAdsProductId = 'remove_ads';

/// アプリ内課金（広告除去）の管理サービス。
///
/// 購入結果は端末ローカル（SharedPreferences）に保存する。複数端末間の
/// 同期が必要になった場合は、Firestore等への保存を別途追加すること。
class PurchaseService {
  static const _keyAdsRemoved = 'ads_removed_v1';

  final SharedPreferences _prefs;
  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  PurchaseService(this._prefs);

  bool get isAdsRemoved => _prefs.getBool(_keyAdsRemoved) ?? false;

  Future<void> _setAdsRemoved() => _prefs.setBool(_keyAdsRemoved, true);

  /// 購入更新イベントの購読を開始する。アプリ起動時に一度だけ呼ぶこと。
  void startListening({required void Function() onPurchased}) {
    _subscription?.cancel();
    _subscription = _iap.purchaseStream.listen((purchases) async {
      for (final purchase in purchases) {
        if (purchase.productID != kRemoveAdsProductId) continue;

        if (purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored) {
          await _setAdsRemoved();
          onPurchased();
        }

        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
      }
    });
  }

  Future<bool> isStoreAvailable() => _iap.isAvailable();

  /// ストア上の商品情報（価格表示等）を取得する。
  Future<ProductDetails?> fetchRemoveAdsProduct() async {
    final response = await _iap.queryProductDetails({kRemoveAdsProductId});
    if (response.error != null || response.productDetails.isEmpty) {
      return null;
    }
    return response.productDetails.first;
  }

  Future<void> buyRemoveAds(ProductDetails product) async {
    final param = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: param);
  }

  /// 「購入の復元」（機種変更・再インストール時用）。
  Future<void> restorePurchases() => _iap.restorePurchases();

  void dispose() {
    _subscription?.cancel();
  }
}
