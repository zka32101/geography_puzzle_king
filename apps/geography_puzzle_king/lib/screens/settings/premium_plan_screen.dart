import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:geography_puzzle_king/config/constants.dart';
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

  static const _benefits = <_Benefit>[
    _Benefit(icon: Icons.block, title: '広告完全非表示', description: 'プレイ中・結果画面のバナー広告・インタースティシャル広告が表示されなくなります。'),
    _Benefit(icon: Icons.map, title: '全都道府県・全ステージ解放', description: '47都道府県すべて・地方決戦・歴史決戦ステージがいつでもプレイ可能になります。'),
    _Benefit(icon: Icons.auto_awesome, title: '買い切り・追加料金なし', description: '一度購入すればずっと有効。今後追加されるプレミアム向けコンテンツも利用できます。'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('プレミアムの特典', style: AppTextStyles.headline3),
                    const SizedBox(height: AppSpacing.sm),
                    ..._benefits.map(_buildBenefitTile),
                    const SizedBox(height: AppSpacing.lg),
                    Text('無料版は広告つきで最初の5県まで遊べます。プレミアムは一度の購入で、ずっと使えます（月額・更新なし）。', style: AppTextStyles.bodySmall),
                    const SizedBox(height: AppSpacing.xl),
                    _buildPurchaseCard(context, ref, isPremium, productAsync),
                    if (!isPremium)
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            final service = ref.read(purchaseServiceProvider);
                            await service?.restorePurchases();
                          },
                          child: const Text('購入を復元する'),
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

  Widget _buildHeader(BuildContext context) {
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
          const Expanded(
            child: Text(
              'プレミアム',
              style: TextStyle(
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
    bool isPremium,
    AsyncValue<ProductDetails?> productAsync,
  ) {
    if (isPremium) {
      return Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.large),
        elevation: 2,
        child: const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.success),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text('プレミアム購入済みです。ご購入ありがとうございます！', style: AppTextStyles.subtitle1),
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
          error: (_, __) => const Text('ストアに接続できませんでした。時間をおいて再度お試しください。', style: AppTextStyles.bodySmall),
          data: (product) {
            // ストア未登録時のプレースホルダー価格表示。
            final priceLabel = product?.price ?? '\$3';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('価格', style: AppTextStyles.subtitle1),
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
                            await service.buyNonConsumable(product);
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.medium),
                      ),
                    ),
                    child: Text(product == null ? '現在購入できません' : 'プレミアムを購入する（買い切り）'),
                  ),
                ),
                if (product == null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  const Text(
                    '※ストア側での商品登録が完了すると購入できるようになります。',
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
