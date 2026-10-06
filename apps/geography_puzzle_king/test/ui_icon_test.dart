import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geography_puzzle_king/widgets/ui_icon.dart';

void main() {
  test('containsIconEmoji detects target emoji incl. variation selector', () {
    expect(containsIconEmoji('🪙 100'), isTrue);
    expect(containsIconEmoji('⚔FE0F 攻撃'), isTrue);
    expect(containsIconEmoji('🗾'), isTrue);
    expect(containsIconEmoji('🗺️ マップ'), isTrue);
    expect(containsIconEmoji('ふつうの文字'), isFalse);
  });

  testWidgets('IconText replaces emoji with image, plain text stays Text', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Column(children: [IconText('🪙 100'), IconText('ABC')]),
    ));
    expect(find.byType(UiIcon), findsOneWidget);
    expect(find.text('ABC'), findsOneWidget);
  });

  test('every UiIconKind has an asset file', () {
    // ファイル名の取り違え防止（pubspec 登録は assets/images/icons/）。
    for (final k in UiIconKind.values) {
      expect(k.assetPath, startsWith('assets/images/icons/'));
    }
  });
}
