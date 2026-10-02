import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';

/// 保護者向けの確認ゲート（計算問題）。購入など保護者の操作が必要な箇所の前に表示する。
/// 正解すると true を返す。
Future<bool> showParentGate(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  final rnd = Random();
  final a = 6 + rnd.nextInt(7);
  final b = 6 + rnd.nextInt(7);
  final controller = TextEditingController();
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      String? error;
      return StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: Text(l10n.parentGateTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.parentGateMessage),
              const SizedBox(height: 12),
              Text('$a × $b = ?', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                decoration: InputDecoration(errorText: error),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.parentGateCancel)),
            FilledButton(
              onPressed: () {
                if (int.tryParse(controller.text) == a * b) {
                  Navigator.pop(ctx, true);
                } else {
                  setState(() => error = l10n.parentGateWrong);
                }
              },
              child: Text(l10n.parentGateOk),
            ),
          ],
        ),
      );
    },
  );
  controller.dispose();
  return ok ?? false;
}
