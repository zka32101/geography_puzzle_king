import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

// pubspec.yaml 縺ｮ version 縺ｨ謇句虚縺ｧ蜷梧悄縺輔○繧具ｼ・ackage_info_plus 遲峨・霑ｽ蜉萓晏ｭ倥ｒ驕ｿ縺代ｋ縺溘ａ・・
const _appVersion = '1.0.0';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('縺薙・繧｢繝励Μ縺ｫ縺､縺・※')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(
            '譌･譛ｬ縺ｮ譛ｪ譚･繝槭ャ繝・,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            'v$_appVersion',
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.lg),

          const _SectionCard(
            title: '縺薙・繧｢繝励Μ縺ｫ縺､縺・※',
            icon: Icons.info_outline,
            body:
                '縲梧律譛ｬ縺ｮ譛ｪ譚･縺｣縺ｦ縲∝ｮ滄圀縺ｩ縺・↑縺｣縺ｦ繧九・・溘構n\n'
                '貍辟ｶ縺ｨ縺励◆荳榊ｮ峨ｒ縲∝・菴鍋噪縺ｪ謨ｰ蟄励→荳谺｡雉・侭縺ｧ逅・ｧ｣縺ｧ縺阪ｋ繧｢繝励Μ縺ｧ縺吶・
                '蟷ｴ驥代・蝗ｽ蛯ｵ繝ｻ蟆大ｭ宣ｫ倬ｽ｢蛹悶°繧峨・∈謖吝宛蠎ｦ繧・ｮ伜・讖滓ｧ九→縺・▲縺滓帆豐ｻ縺ｮ讒矩逧・↑隱ｲ鬘後∪縺ｧ縲・
                '50莉ｶ莉･荳翫・繝医ヴ繝・け繧貞・蠑冗ｵｱ險医・荳谺｡雉・侭縺ｫ蝓ｺ縺･縺・※蛻・°繧翫ｄ縺吶￥隗｣隱ｬ縺励∪縺吶・,
          ),
          const SizedBox(height: AppSpacing.md),

          const _SectionCard(
            title: '荳ｻ縺ｪ讖溯・',
            icon: Icons.checklist_outlined,
            body:
                '繝ｻ蟷ｴ鮨｢繧貞・繧後ｋ縺縺代・蟷ｴ驥第錐逶願ｨｺ譁ｭ\n'
                '繝ｻ隱ｲ鬘後∈縺ｮ謚慕･ｨ・剰ｳ帛酔縲∝ｯｾ遲匁｡医・驕ｸ謚杤n'
                '繝ｻ謚慕･ｨ謨ｰ縺縺代〒縺ｪ縺上∵ｳｨ逶ｮ蠎ｦ繧・未騾｣縺吶ｋ蝗ｽ縺ｮ莠育ｮ苓ｦ乗ｨ｡縺ｧ繝槭ャ繝斐Φ繧ｰ縺吶ｋ縲後・繝・・縲崎｡ｨ遉ｺ\n'
                '繝ｻ蝗ｽ莨壹〒縺ｮ螳滄圀縺ｮ隴ｰ譯医∵帆蜈壹・蛟倶ｺｺ縺悟・縺ｫ遉ｺ縺励※縺・ｋ荳ｻ蠑ｵ縺ｨ縺ｮ騾｣蜍表n'
                '繝ｻ驕句霧閠・′髢｢菫ら怐蠎√・遯灘哨縺ｸ蝠上＞蜷医ｏ縺帙◆險倬鹸縺ｮ蜈ｬ髢欺n'
                '繝ｻ繧ｮ繝｣繝・・繧ｯ繧､繧ｺ縲∽ｸ也阜縺ｨ縺ｮ豈碑ｼ・√∩繧薙↑縺ｮ螢ｰ繝ｻ謠先｡・,
          ),
          const SizedBox(height: AppSpacing.md),

          const _SectionCard(
            title: '繝・・繧ｿ縺ｫ縺､縺・※',
            icon: Icons.fact_check_outlined,
            body:
                '謗ｲ霈峨＠縺ｦ縺・ｋ謨ｰ蛟､繝ｻ隴ｰ譯医・荳ｻ蠑ｵ縺ｯ縲∵帆蠎懃ｵｱ險医ｄ荳谺｡雉・侭縲∝ｱ驕鍋ｭ峨↓蝓ｺ縺･縺上せ繝翫ャ繝励す繝ｧ繝・ヨ縺ｧ縺吶・
                '蛻ｶ蠎ｦ謾ｹ豁｣繧・嵜莨壼ｯｩ隴ｰ縺ｮ騾ｲ謐励↓繧医ｊ蜀・ｮｹ縺悟､峨ｏ繧九％縺ｨ縺後≠繧九◆繧√∝推隱ｲ鬘後・縲梧ュ蝣ｱ譎らせ縲崎｡ｨ遉ｺ縺ｨ'
                '蜃ｺ蜈ｸ繝ｪ繝ｳ繧ｯ繧偵≠繧上○縺ｦ縺皮｢ｺ隱阪￥縺縺輔＞縲・,
          ),
          const SizedBox(height: AppSpacing.md),

          const _SectionCard(
            title: '荳埼←蛻・↑謚慕ｨｿ縺ｫ縺､縺・※',
            icon: Icons.flag_outlined,
            body:
                '隱ｹ隰嶺ｸｭ蛯ｷ繝ｻ蟾ｮ蛻･逧・｡ｨ迴ｾ繝ｻ蛟倶ｺｺ諠・ｱ縺ｮ證ｴ髴ｲ繝ｻ繧ｹ繝代Β遲峨・荳埼←蛻・↑謚慕ｨｿ縺ｯ遖∵ｭ｢縺励※縺・∪縺吶・
                '蜷・さ繝｡繝ｳ繝医・謠先｡医・繝｡繝九Η繝ｼ縺九ｉ縲悟ｱ蜻翫☆繧九阪％縺ｨ縺ｧ驕句霧縺ｫ騾壼ｱ縺ｧ縺阪・
                '騾壼ｱ蜀・ｮｹ縺ｯ24譎る俣莉･蜀・↓遒ｺ隱阪・縺・∴縲∝炎髯､遲峨・蟇ｾ蠢懊ｒ陦後＞縺ｾ縺吶・
                '闍ｦ謇九↑繝ｦ繝ｼ繧ｶ繝ｼ縺ｯ縲後ヶ繝ｭ繝・け縲阪°繧蛾撼陦ｨ遉ｺ縺ｫ縺ｧ縺阪∬・蛻・・謚慕ｨｿ縺ｯ縺・▽縺ｧ繧ょ炎髯､縺ｧ縺阪∪縺吶・
                '邱頑･縺ｮ騾壼ｱ繧・√い繝励Μ蜀・〒蟇ｾ蠢懊〒縺阪↑縺・ｴ蜷医・荳玖ｨ倥・騾｣邨｡蜈医∪縺ｧ逶ｴ謗･縺秘｣邨｡縺上□縺輔＞縲・,
          ),
          const SizedBox(height: AppSpacing.lg),

          const Text(
            '繝ｪ繝ｳ繧ｯ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: AppSpacing.sm),
          _LinkRow(
            icon: Icons.privacy_tip_outlined,
            label: '繝励Λ繧､繝舌す繝ｼ繝昴Μ繧ｷ繝ｼ',
            url:
                'https://zka32103-coder.github.io/petitworks-legal/nihon_future_map/privacy.html',
          ),
          _LinkRow(
            icon: Icons.support_agent_outlined,
            label: '繧ｵ繝昴・繝医・縺雁撫縺・粋繧上○',
            url:
                'https://zka32103-coder.github.io/petitworks-legal/nihon_future_map/support.html',
          ),
          _LinkRow(
            icon: Icons.mail_outline,
            label: '驕句霧縺ｫ逶ｴ謗･繝｡繝ｼ繝ｫ縺ｧ騾｣邨｡縺吶ｋ・井ｸ埼←蛻・↑謚慕ｨｿ縺ｮ騾壼ｱ蜷ｫ繧・・,
            url:
                'mailto:petitworksdev@gmail.com?subject=${Uri.encodeComponent('縲先律譛ｬ縺ｮ譛ｪ譚･繝槭ャ繝励代♀蝠上＞蜷医ｏ縺・)}',
          ),
          const SizedBox(height: AppSpacing.lg),

          const Center(
            child: Text(
              '驕句霧:  Apps',
              style: TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String body;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(body, style: const TextStyle(fontSize: 13, height: 1.7)),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _LinkRow({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.badge),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.badge),
        onTap: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: AppSpacing.xs),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppRadius.badge),
          ),
          child: Row(
            children: [
              Icon(icon, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 13)),
              ),
              const Icon(
                Icons.open_in_new,
                size: 14,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

