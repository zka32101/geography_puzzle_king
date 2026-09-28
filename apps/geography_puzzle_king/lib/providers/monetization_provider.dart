import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart' show sharedPreferencesProvider;
import 'package:geography_puzzle_king/services/ad_service.dart';
import 'package:geography_puzzle_king/services/purchase_service.dart';

// ─── 広告サービス ────────────────────────────────────────────────────────────

final adServiceProvider = Provider<AdService>((ref) {
  final service = AdService();
  ref.onDispose(service.dispose);
  return service;
});

// ─── 課金サービス ────────────────────────────────────────────────────────────

final purchaseServiceProvider = Provider<PurchaseService?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  if (prefs == null) return null;
  final service = PurchaseService(prefs);
  ref.onDispose(service.dispose);
  return service;
});

/// [PurchaseFlagNotifier] の購入済みフラグ読み出し方法。
typedef _IsPurchasedReader = bool Function(PurchaseService service);

/// 単一の買い切りIAPの購入状態を保持する汎用Notifier。
/// 購入完了イベントで [markPurchased] を呼ぶと全画面のUIが即座に更新される。
class PurchaseFlagNotifier extends StateNotifier<bool> {
  PurchaseFlagNotifier(this._ref, this._isPurchased) : super(false) {
    _restoreFromPrefs();
  }

  final Ref _ref;
  final _IsPurchasedReader _isPurchased;

  void _restoreFromPrefs() {
    final service = _ref.read(purchaseServiceProvider);
    if (service != null && _isPurchased(service)) {
      state = true;
    }
  }

  void markPurchased() {
    state = true;
  }
}

/// true の場合: 広告非表示（商品ID: [kRemoveAdsProductId]）。
final adsRemovedProvider = StateNotifierProvider<PurchaseFlagNotifier, bool>((ref) {
  return PurchaseFlagNotifier(ref, (service) => service.isAdsRemoved);
});

/// true の場合: 全都道府県・地方決戦・歴史決戦がプレイ可能
/// （商品ID: [kUnlockMapProductId]）。
final mapUnlockedProvider = StateNotifierProvider<PurchaseFlagNotifier, bool>((ref) {
  return PurchaseFlagNotifier(ref, (service) => service.isMapUnlocked);
});

/// ストア上の「広告除去」商品情報（価格表示用）。
final removeAdsProductProvider = FutureProvider<ProductDetails?>((ref) async {
  final service = ref.watch(purchaseServiceProvider);
  if (service == null) return null;
  if (!await service.isStoreAvailable()) return null;
  return service.fetchRemoveAdsProduct();
});

/// ストア上の「全都道府県マップ解放」商品情報（価格表示用）。
final unlockMapProductProvider = FutureProvider<ProductDetails?>((ref) async {
  final service = ref.watch(purchaseServiceProvider);
  if (service == null) return null;
  if (!await service.isStoreAvailable()) return null;
  return service.fetchUnlockMapProduct();
});
