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

/// 「広告除去」購入済みかどうか。購入完了イベントで [markAdsRemoved] を呼ぶと
/// 全画面のUIが即座に更新される。
class AdsRemovedNotifier extends StateNotifier<bool> {
  AdsRemovedNotifier(this._ref) : super(false) {
    _restoreFromPrefs();
  }

  final Ref _ref;

  void _restoreFromPrefs() {
    final service = _ref.read(purchaseServiceProvider);
    if (service != null && service.isAdsRemoved) {
      state = true;
    }
  }

  void markAdsRemoved() {
    state = true;
  }
}

final adsRemovedProvider = StateNotifierProvider<AdsRemovedNotifier, bool>((ref) {
  return AdsRemovedNotifier(ref);
});

/// ストア上の「広告除去」商品情報（価格表示用）。
final removeAdsProductProvider = FutureProvider<ProductDetails?>((ref) async {
  final service = ref.watch(purchaseServiceProvider);
  if (service == null) return null;
  if (!await service.isStoreAvailable()) return null;
  return service.fetchRemoveAdsProduct();
});
