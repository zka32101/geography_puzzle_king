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

/// 「広告除去+全ステージ解放」を購入済みかどうか。
/// 単一の買い切りIAP（商品ID: [kRemoveAdsProductId]）で、広告非表示と
/// 都道府県ロック解除の両方が有効になる。購入完了イベントで [markPurchased]
/// を呼ぶと全画面のUIが即座に更新される。
class PremiumNotifier extends StateNotifier<bool> {
  PremiumNotifier(this._ref) : super(false) {
    _restoreFromPrefs();
  }

  final Ref _ref;

  void _restoreFromPrefs() {
    final service = _ref.read(purchaseServiceProvider);
    if (service != null && service.isAdsRemoved) {
      state = true;
    }
  }

  void markPurchased() {
    state = true;
  }
}

/// true の場合: 広告非表示 かつ 全都道府県プレイ可能。
final premiumUnlockedProvider = StateNotifierProvider<PremiumNotifier, bool>((ref) {
  return PremiumNotifier(ref);
});

/// ストア上の「広告除去+全ステージ解放」商品情報（価格表示用）。
final removeAdsProductProvider = FutureProvider<ProductDetails?>((ref) async {
  final service = ref.watch(purchaseServiceProvider);
  if (service == null) return null;
  if (!await service.isStoreAvailable()) return null;
  return service.fetchRemoveAdsProduct();
});
