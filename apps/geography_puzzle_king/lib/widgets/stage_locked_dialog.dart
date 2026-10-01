import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/config/monetization_config.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/screens/settings/premium_plan_screen.dart';

/// 未購入ユーザーがロック中の都道府県をタップした際に表示するダイアログ。
/// 実際の購入操作はプレミアム画面に集約しているため、
/// ここではプレミアム画面への遷移のみを行う。
Future<void> showStageLockedDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.stageLockedTitle),
      content: Text(l10n.stageLockedBody(kFreePrefectureCodes.length)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(ctx).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PremiumPlanScreen()),
            );
          },
          style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text(l10n.goToPurchaseButton),
        ),
      ],
    ),
  );
}
