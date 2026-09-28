import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:geography_puzzle_king/config/app_config.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/providers/monetization_provider.dart';
import 'package:geography_puzzle_king/services/purchase_service.dart';
import 'package:geography_puzzle_king/providers/localization_provider.dart';
import 'package:geography_puzzle_king/services/audio_service.dart';
import 'package:geography_puzzle_king/config/legal_content.dart';
import 'package:geography_puzzle_king/screens/settings/legal_text_screen.dart';
import 'package:geography_puzzle_king/screens/settings/premium_plan_screen.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _enableNotifications = true;
  bool _enableSoundEffects = true;
  bool _enableBgm = true;
  String _selectedLanguage = 'ja';
  String? _playerName;
  bool _hideFromRanking = false;

  @override
  void initState() {
    super.initState();
    final audio = AudioService();
    _enableBgm = audio.bgmEnabled;
    _enableSoundEffects = audio.sfxEnabled;
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    // localeProviderから現在の言語を取得
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentLocale = ref.read(localeProvider);
      setState(() {
        _selectedLanguage = currentLocale.languageCode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final playerName = _playerName ?? l10n.guestPlayer;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Transform.translate(
                offset: const Offset(0, -24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Profile Section
                      _buildSection(
                        title: l10n.userInfo,
                        children: [
                          _buildSettingTile(
                            icon: Icons.person,
                            title: l10n.playerName,
                            subtitle: playerName,
                            onTap: _showPlayerNameDialog,
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Notification Settings
                      _buildSection(
                        title: l10n.notifications,
                        children: [
                          _buildSwitchTile(
                            icon: Icons.notifications,
                            title: l10n.pushNotifications,
                            subtitle: l10n.dailyEvents,
                            value: _enableNotifications,
                            onChanged: (value) {
                              setState(() {
                                _enableNotifications = value;
                              });
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Sound & Vibration
                      _buildSection(
                        title: l10n.soundSettings,
                        children: [
                          _buildSwitchTile(
                            icon: Icons.music_note,
                            title: l10n.bgm,
                            subtitle: l10n.backgroundMusic,
                            value: _enableBgm,
                            onChanged: (value) {
                              setState(() {
                                _enableBgm = value;
                              });
                              AudioService().setBgmEnabled(value);
                            },
                          ),
                          _buildSwitchTile(
                            icon: Icons.volume_up,
                            title: l10n.sfx,
                            subtitle: l10n.sfxDescription,
                            value: _enableSoundEffects,
                            onChanged: (value) {
                              setState(() {
                                _enableSoundEffects = value;
                              });
                              AudioService().setSfxEnabled(value);
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Language Settings
                      _buildSection(
                        title: l10n.language,
                        children: [
                          _buildDropdownTile(
                            icon: Icons.language,
                            title: l10n.languageSelect,
                            value: _selectedLanguage,
                            items: {
                              'ja': l10n.japanese,
                              'en': l10n.english,
                              'zh': l10n.chinese,
                              'ko': l10n.korean,
                            },
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedLanguage = value;
                                });
                                ref.read(localeProvider.notifier).setLocale(value);
                              }
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Privacy & Legal
                      _buildSection(
                        title: l10n.privacySettings,
                        children: [
                          _buildSwitchTile(
                            icon: Icons.visibility_off,
                            title: l10n.rankingDisplay,
                            subtitle: _hideFromRanking ? l10n.hideFromRanking : l10n.showInRanking,
                            value: !_hideFromRanking,
                            onChanged: (value) {
                              setState(() {
                                _hideFromRanking = !value;
                              });
                            },
                          ),
                          _buildSettingTile(
                            icon: Icons.shield,
                            title: l10n.privacyPolicyTitle,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => LegalTextScreen(
                                    title: l10n.privacyPolicyTitle,
                                    updatedAt: _selectedLanguage == 'en'
                                        ? kPrivacyPolicyUpdatedAtEn
                                        : kPrivacyPolicyUpdatedAt,
                                    sections: _selectedLanguage == 'en'
                                        ? kPrivacyPolicySectionsEn
                                        : kPrivacyPolicySections,
                                  ),
                                ),
                              );
                            },
                          ),
                          _buildSettingTile(
                            icon: Icons.description,
                            title: l10n.termsOfServiceTitle,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => LegalTextScreen(
                                    title: l10n.termsOfServiceTitle,
                                    updatedAt: _selectedLanguage == 'en'
                                        ? kTermsOfServiceUpdatedAtEn
                                        : kTermsOfServiceUpdatedAt,
                                    sections: _selectedLanguage == 'en'
                                        ? kTermsOfServiceSectionsEn
                                        : kTermsOfServiceSections,
                                  ),
                                ),
                              );
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Version Info
                      _buildSection(
                        title: l10n.appInfo,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      l10n.version,
                                      style: AppTextStyles.subtitle1,
                                    ),
                                    Text(
                                      AppConfig.appVersion,
                                      style: AppTextStyles.subtitle1,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.md),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      l10n.buildNumber,
                                      style: AppTextStyles.subtitle1,
                                    ),
                                    Text(
                                      AppConfig.buildNumber.toString(),
                                      style: AppTextStyles.subtitle1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _buildSection(
                        title: l10n.adsAndPurchases,
                        children: [
                          _buildPremiumPlanTile(),
                          _buildRemoveAdsTile(),
                          _buildUnlockMapTile(),
                        ],
                      ),
                      // TODO: cross_promo_kit連携（別セッションで進行中）はpubspec.yamlの依存が
                      // 未整備のため一時的に無効化。パッケージ配置後にCrossPromoSectionを復元すること。

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── ヘッダー（ホーム画面のヒーローヘッダーと統一） ────────────────────
  Widget _buildHeader() {
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
          const Text('⚙️', style: TextStyle(fontSize: 26)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.settings,
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

  // NOTE: このタイルの文言は日本語ハードコード。l10n化は別途対応すること。
  Widget _buildPremiumPlanTile() {
    final isPremium = ref.watch(premiumPlanProvider);
    return _tileShell(
      icon: Icons.workspace_premium,
      iconColor: isPremium ? AppColors.success : AppColors.primary,
      title: isPremium ? 'プレミアムプラン（購入済み）' : 'プレミアムプラン',
      subtitle: isPremium
          ? '広告非表示・全マップ解放が有効です'
          : '広告除去＋マップ解放がまとめてお得に',
      trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PremiumPlanScreen()),
        );
      },
      showDivider: true,
    );
  }

  Widget _buildRemoveAdsTile() {
    final l10n = AppLocalizations.of(context)!;
    return _buildIapTile(
      purchased: ref.watch(adsRemovedProvider),
      productAsync: ref.watch(removeAdsProductProvider),
      notPurchasedTitle: l10n.removeAds,
      purchasedTitle: l10n.removeAdsPurchased,
      purchasedSubtitle: l10n.purchaseThankYou,
      describeProduct: (price) => l10n.removeAdsDescription(price),
      onBuy: (service, product) => service.buyNonConsumable(product),
      showDivider: true,
    );
  }

  Widget _buildUnlockMapTile() {
    final l10n = AppLocalizations.of(context)!;
    return _buildIapTile(
      purchased: ref.watch(mapUnlockedProvider),
      productAsync: ref.watch(unlockMapProductProvider),
      notPurchasedTitle: l10n.unlockMap,
      purchasedTitle: l10n.unlockMapPurchased,
      purchasedSubtitle: l10n.unlockMapThankYou,
      describeProduct: (price) => l10n.unlockMapDescription(price),
      onBuy: (service, product) => service.buyNonConsumable(product),
      showDivider: false,
    );
  }

  Widget _buildIapTile({
    required bool purchased,
    required AsyncValue<ProductDetails?> productAsync,
    required String notPurchasedTitle,
    required String purchasedTitle,
    required String purchasedSubtitle,
    required String Function(String price) describeProduct,
    required Future<void> Function(PurchaseService service, ProductDetails product) onBuy,
    required bool showDivider,
  }) {
    final l10n = AppLocalizations.of(context)!;
    if (purchased) {
      return _tileShell(
        icon: Icons.check_circle,
        iconColor: AppColors.success,
        title: purchasedTitle,
        subtitle: purchasedSubtitle,
        showDivider: showDivider,
      );
    }

    return productAsync.when(
      loading: () => _tileShell(
        icon: Icons.block,
        title: notPurchasedTitle,
        trailing: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        showDivider: showDivider,
      ),
      error: (_, __) => _tileShell(
        icon: Icons.block,
        title: notPurchasedTitle,
        subtitle: l10n.storeConnectionError,
        showDivider: showDivider,
      ),
      data: (product) {
        if (product == null) {
          return _tileShell(
            icon: Icons.block,
            title: notPurchasedTitle,
            subtitle: l10n.notAvailableNow,
            showDivider: showDivider,
          );
        }
        return _tileShell(
          icon: Icons.block,
          title: notPurchasedTitle,
          subtitle: describeProduct(product.price),
          showDivider: showDivider,
          trailing: FilledButton(
            onPressed: () async {
              final service = ref.read(purchaseServiceProvider);
              if (service == null) return;
              await onBuy(service, product);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
            ),
            child: Text(l10n.purchaseButton),
          ),
        );
      },
    );
  }

  // ── セクション（ホーム画面と同じカード見た目：白背景・角丸・淡い影） ──
  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(title, style: AppTextStyles.headline3),
          ),
          Material(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.large),
            elevation: 2,
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _iconBubble(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _tileShell({
    required IconData icon,
    required String title,
    String? subtitle,
    Color iconColor = AppColors.primary,
    Widget? trailing,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    final tile = InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            _iconBubble(icon, iconColor),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.subtitle1),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.bodySmall),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );

    if (!showDivider) return tile;
    return Column(
      children: [
        tile,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Divider(height: 1, color: AppColors.divider),
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return _tileShell(
      icon: icon,
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      showDivider: showDivider,
      trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool showDivider = true,
  }) {
    return _tileShell(
      icon: icon,
      title: title,
      subtitle: subtitle,
      showDivider: showDivider,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
      ),
    );
  }

  Widget _buildDropdownTile({
    required IconData icon,
    required String title,
    required String value,
    required Map<String, String> items,
    required ValueChanged<String?> onChanged,
    bool showDivider = true,
  }) {
    return _tileShell(
      icon: icon,
      title: title,
      showDivider: showDivider,
      trailing: DropdownButton<String>(
        value: value,
        underline: const SizedBox.shrink(),
        items: items.entries
            .map(
              (e) => DropdownMenuItem(
                value: e.key,
                child: Text(e.value),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _showPlayerNameDialog() {
    final l10n = AppLocalizations.of(context)!;
    final nameController = TextEditingController(text: _playerName ?? l10n.guestPlayer);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.changePlayerName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.personalInfoWarning,
                      style: const TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: l10n.playerName,
                hintText: l10n.guestPlayer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLength: 20,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _playerName = nameController.text.isEmpty
                    ? l10n.guestPlayer
                    : nameController.text;
              });
              Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }
}
