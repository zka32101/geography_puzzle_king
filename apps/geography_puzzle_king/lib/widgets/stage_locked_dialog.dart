import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/config/constants.dart';

/// 未購入ユーザーがロック中の都道府県をタップした際に表示するダイアログ。
/// 実際の購入操作は設定画面の「広告を削除」タイルに集約しているため、
/// ここでは設定画面への遷移のみを行う。
Future<void> showStageLockedDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('🔒 この都道府県はロック中'),
      content: const Text(
        '無料でプレイできるのは最初の3都道府県までです。\n'
        '買い切り¥300で「広告除去 + 全47都道府県が解放」されます。',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('キャンセル'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(ctx).pop();
            Navigator.of(context).pushNamed('/settings');
          },
          style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
          child: const Text('購入画面へ'),
        ),
      ],
    ),
  );
}
