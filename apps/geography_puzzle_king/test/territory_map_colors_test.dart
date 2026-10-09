import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geography_puzzle_king/config/difficulty_colors.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/models/prefecture_record.dart';
import 'package:geography_puzzle_king/screens/territory/japan_map_widget.dart';

PrefectureRecord rec(String code, String? diff) => PrefectureRecord(
      prefectureCode: code,
      totalClears: 1,
      currentLevel: 1,
      currentExp: 0,
      firstClearedAt: DateTime(2026),
      lastClearedAt: DateTime(2026),
      bestScore: 100,
      highestDifficulty: diff,
    );

void main() {
  test('最高クリア難易度で色が変わる（丸と同じ定数）・未クリアは灰', () {
    expect(territoryColorFor(null), DifficultyColors.uncleared);
    expect(territoryColorFor(rec('01', 'easy')), const Color(0xFF43A047));
    expect(territoryColorFor(rec('13', 'normal')), const Color(0xFF1E88E5));
    expect(territoryColorFor(rec('47', 'hard')), const Color(0xFFE53935));
    expect(territoryColorFor(rec('02', null)), DifficultyColors.easy);
    expect(DifficultyColors.easy, isNot(DifficultyColors.normal));
    expect(DifficultyColors.normal, isNot(DifficultyColors.hard));
  });

  testWidgets('地図の下に凡例（未クリア/Easy/Normal/Hard）が出る', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ja')],
      locale: const Locale('ja'),
      home: Scaffold(
        body: SingleChildScrollView(
          child: JapanMapWidget(
            records: {'01': rec('01', 'easy'), '13': rec('13', 'hard')},
            onPrefectureTap: (_) {},
          ),
        ),
      ),
    ));
    await tester.pump();
    expect(find.byKey(const Key('mapDifficultyLegend')), findsOneWidget);
    for (final t in ['未クリア', 'Easy', 'Normal', 'Hard']) {
      expect(find.text(t), findsOneWidget);
    }
  });
}
