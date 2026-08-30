import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geography_puzzle_king/config/app_config.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/providers/auth_provider.dart';
import 'package:geography_puzzle_king/providers/monetization_provider.dart';
import 'package:geography_puzzle_king/services/audio_service.dart';

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
  String _playerName = 'ゲストプレイヤー';
  bool _hideFromRanking = false;

  @override
  void initState() {
    super.initState();
    final audio = AudioService();
    _enableBgm = audio.bgmEnabled;
    _enableSoundEffects = audio.sfxEnabled;
  }

  @override
  Widget build(BuildContext context) {
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
                        title: 'ユーザー情報',
                        children: [
                          _buildSettingTile(
                            icon: Icons.person,
                            title: 'プレイヤー名',
                            subtitle: _playerName,
                            onTap: _showPlayerNameDialog,
                          ),
                          _buildSettingTile(
                            icon: Icons.email,
                            title: 'メールアドレス',
                            subtitle: 'not.logged.in@example.com',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Notification Settings
                      _buildSection(
                        title: '通知設定',
                        children: [
                          _buildSwitchTile(
                            icon: Icons.notifications,
                            title: 'プッシュ通知',
                            subtitle: 'デイリーイベント・対戦通知',
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
                        title: 'サウンド設定',
                        children: [
                          _buildSwitchTile(
                            icon: Icons.music_note,
                            title: 'BGM',
                            subtitle: 'バックグラウンドミュージック',
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
                            title: '効果音',
                            subtitle: 'ゲーム内の効果音を有効',
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
                        title: '言語設定',
                        children: [
                          _buildDropdownTile(
                            icon: Icons.language,
                            title: '言語',
                            value: _selectedLanguage,
                            items: const {
                              'ja': '日本語',
                              'en': 'English',
                            },
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedLanguage = value;
                                });
                              }
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Privacy & Legal
                      _buildSection(
                        title: 'プライバシー・その他',
                        children: [
                          _buildSwitchTile(
                            icon: Icons.visibility_off,
                            title: 'ランキング表示',
                            subtitle: _hideFromRanking ? '非表示' : 'プレイヤー名を表示',
                            value: !_hideFromRanking,
                            onChanged: (value) {
                              setState(() {
                                _hideFromRanking = !value;
                              });
                            },
                          ),
                          _buildSettingTile(
                            icon: Icons.shield,
                            title: 'プライバシーポリシー',
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('ブラウザで開く: 実装予定'),
                                ),
                              );
                            },
                          ),
                          _buildSettingTile(
                            icon: Icons.description,
                            title: '利用規約',
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('ブラウザで開く: 実装予定'),
                                ),
                              );
                            },
                            showDivider: false,
                          ),
                        ],
                      ),
                      // Version Info
                      _buildSection(
                        title: 'アプリ情報',
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'バージョン',
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
                                    const Text(
                                      'ビルド番号',
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
                        title: '広告・課金',
                        children: [_buildRemoveAdsTile()],
                      ),
                      // Danger Zone
                      const SizedBox(height: AppSpacing.sm),
                      const Text('その他', style: AppTextStyles.headline3),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showLogoutDialog();
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('ログアウト'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textPrimary,
                            backgroundColor: AppColors.surface,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.large),
                            ),
                            side: const BorderSide(
                              color: AppColors.divider,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showDeleteAccountDialog();
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text('アカウント削除'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            backgroundColor: AppColors.surface,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.large),
                            ),
                            side: const BorderSide(
                              color: AppColors.error,
                            ),
                          ),
                        ),
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
          const Expanded(
            child: Text(
              '設定',
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

  Widget _buildRemoveAdsTile() {
    final adsRemoved = ref.watch(premiumUnlockedProvider);
    if (adsRemoved) {
      return _tileShell(
        icon: Icons.check_circle,
        iconColor: AppColors.success,
        title: '広告除去（購入済み）',
        subtitle: 'ご購入ありがとうございます',
        showDivider: false,
      );
    }

    final productAsync = ref.watch(removeAdsProductProvider);
    return productAsync.when(
      loading: () => _tileShell(
        icon: Icons.block,
        title: '広告を削除',
        trailing: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        showDivider: false,
      ),
      error: (_, __) => _tileShell(
        icon: Icons.block,
        title: '広告を削除',
        subtitle: 'ストアに接続できませんでした',
        showDivider: false,
      ),
      data: (product) {
        if (product == null) {
          return _tileShell(
            icon: Icons.block,
            title: '広告を削除',
            subtitle: '現在ご利用いただけません',
            showDivider: false,
          );
        }
        return _tileShell(
          icon: Icons.block,
          title: '広告を削除',
          subtitle: '${product.price} — ゲーム内の広告表示がすべて非表示になります',
          showDivider: false,
          trailing: FilledButton(
            onPressed: () async {
              final service = ref.read(purchaseServiceProvider);
              if (service == null) return;
              await service.buyRemoveAds(product);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
            ),
            child: const Text('購入'),
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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ログアウト'),
        content: const Text('ログアウトしますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final authService = ref.read(authServiceProvider);
              await authService.logout();
              if (mounted) {
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
            child: const Text(
              'ログアウト',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('アカウント削除'),
        content: const Text(
          'このアクションは取り消せません。本当にアカウントを削除しますか？',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('アカウント削除: 実装予定'),
                ),
              );
            },
            child: const Text(
              '削除',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showPlayerNameDialog() {
    final nameController = TextEditingController(text: _playerName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('プレイヤー名を変更'),
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
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '個人を特定する情報（本名、住所など）は入力しないでください。他のプレイヤーに表示される可能性があります。',
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'プレイヤー名',
                hintText: 'ゲストプレイヤー',
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
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _playerName = nameController.text.isEmpty
                    ? 'ゲストプレイヤー'
                    : nameController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
