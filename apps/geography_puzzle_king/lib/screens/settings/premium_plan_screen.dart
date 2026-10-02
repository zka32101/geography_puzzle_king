import '../../widgets/parent_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/config/monetization_config.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/providers/monetization_provider.dart';
import 'package:geography_puzzle_king/services/purchase_service.dart';

// NOTE: このスクリーンのテキストはひとまず日本語ハードコードで実装している。
// l10n化（app_localizations.dart / .arbへの追加）は別途対応すること。
// 他エージェントがl10n生成ファイルを同時編集している可能性があるため、
// このタスクではapp_localizations*.dartへの変更を避けている。

/// プレミアムプランの特典・価格を説明し、購入導線を提供する画面。
///
/// 実際のストア商品登録（Google Play Console / App Store Connect）は
/// このタスクの範囲外。[kPremiumPlanProductId] のプレースホルダー定義のみ
/// 用意しており、ストア側で商品が未作成の間はこの画面の「購入する」ボタンは
/// 「現在購入できません」表示になる（クラッシュはしない）。
class PremiumPlanScreen extends ConsumerWidget {
  const PremiumPlanScreen({Key? key}) : super(key: key);

  List<_Benefit> _benefits(AppLocalizations l10n) => [
        _Benefit(icon: Icons.block, title: l10n.premiumPlanBenefitAdsFreeTitle, description: l10n.premiumPlanBenefitAdsFreeDescription),
        _Benefit(icon: Icons.map, title: l10n.premiumPlanBenefitMapUnlockTitle, description: l10n.premiumPlanBenefitMapUnlockDescription),
        _Benefit(icon: Icons.auto_awesome, title: l10n.premiumPlanBenefitFutureTitle, description: l10n.premiumPlanBenefitFutureDescription),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isPremium = ref.watch(premiumPlanProvider);
    final productAsync = ref.watch(premiumPlanProductProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, l10n),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.premiumPlanBenefitsHeading, style: AppTextStyles.headline3),
                    const SizedBox(height: AppSpacing.sm),
                    ..._benefits(l10n).map(_buildBenefitTile),
                    const SizedBox(height: AppSpacing.lg),
                    Text(l10n.premiumPlanDescriptionNote(kFreePrefectureCodes.length), style: AppTextStyles.bodySmall),
                    const SizedBox(height: AppSpacing.xl),
                    _buildPurchaseCard(context, ref, l10n, isPremium, productAsync),
                    if (!isPremium)
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            final service = ref.read(purchaseServiceProvider);
                            await service?.restorePurchases();
                          },
                          child: Text(l10n.restorePurchases),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md, AppSpacing.lg, AppSpacing.lg, AppSpacing.xl,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.heroTop, AppColors.heroBottom],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          const SizedBox(width: AppSpacing.xs),
          const Text('👑', style: TextStyle(fontSize: 26)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              l10n.premiumPlanTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitTile(_Benefit benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.large),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(benefit.icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(benefit.title, style: AppTextStyles.subtitle1),
                    const SizedBox(height: 2),
                    Text(benefit.description, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseCard(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    bool isPremium,
    AsyncValue<ProductDetails?> productAsync,
  ) {
    if (isPremium) {
      return Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.large),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.success),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(l10n.premiumPlanPurchasedMessage, style: AppTextStyles.subtitle1),
              ),
            ],
          ),
        ),
      );
    }

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.large),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: productAsync.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (_, __) => Text(l10n.premiumStoreError, style: AppTextStyles.bodySmall),
          data: (product) {
            // ストア未登録時のプレースホルダー価格表示。
            final priceLabel = product?.price ?? '\$3';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.premiumPlanPriceLabel, style: AppTextStyles.subtitle1),
                    Text(priceLabel, style: AppTextStyles.headline3.copyWith(color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: product == null
                        ? null
                        : () async {
                            final service = ref.read(purchaseServiceProvider);
                            if (service == null) return;
                            if (!await showParentGate(context)) return;
                            await service.buyNonConsumable(product);
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.medium),
                      ),
                    ),
                    child: Text(product == null ? l10n.notAvailableNow : l10n.premiumPlanBuyButton),
                  ),
                ),
                if (product == null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    l10n.premiumStoreNotReady,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Benefit {
  final IconData icon;
  final String title;
  final String description;

  const _Benefit({required this.icon, required this.title, required this.description});
}
