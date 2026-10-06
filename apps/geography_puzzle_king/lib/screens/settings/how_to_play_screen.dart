import '../../widgets/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

/// 遊び方（ゲームの基本ルール）を説明する静的な画面。
class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final steps = <_HowToPlayStep>[
      _HowToPlayStep(
        emoji: '🗾',
        title: l10n.howToPlayStep1Title,
        description: l10n.howToPlayStep1Description,
      ),
      _HowToPlayStep(
        emoji: '🏗️',
        title: l10n.howToPlayStep2Title,
        description: l10n.howToPlayStep2Description,
      ),
      _HowToPlayStep(
        emoji: '👹',
        title: l10n.howToPlayStep3Title,
        description: l10n.howToPlayStep3Description,
      ),
      _HowToPlayStep(
        emoji: '🏆',
        title: l10n.howToPlayStep4Title,
        description: l10n.howToPlayStep4Description,
      ),
      _HowToPlayStep(
        emoji: '📖',
        title: l10n.howToPlayStep5Title,
        description: l10n.howToPlayStep5Description,
      ),
    ];

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
                  children: steps.map(_buildStepCard).toList(),
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
          const Text('📘', style: TextStyle(fontSize: 26)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: IconText(
              l10n.howToPlayTitle,
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

  Widget _buildStepCard(_HowToPlayStep step) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.medium)),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(step.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconText(step.title, style: AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.xs),
                  IconText(step.description, style: AppTextStyles.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HowToPlayStep {
  final String emoji;
  final String title;
  final String description;

  const _HowToPlayStep({
    required this.emoji,
    required this.title,
    required this.description,
  });
}
