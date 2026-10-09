import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geography_puzzle_king/providers/prefecture_records_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('provider未読込のまま recordClear しても記録が保存され、地図が読む件数に反映される', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // 結果画面は地図より先に notifier だけを read して recordClear する。
    await container
        .read(prefectureRecordsProvider.notifier)
        .recordClear('01', 1200, 'easy', 10);

    final records = await container.read(prefectureRecordsProvider.future);
    expect(records.keys, ['01']);
    expect(records['01']!.highestDifficulty, 'easy');

    // アプリ再起動相当: 新しいコンテナで読み直しても残る。
    final reopened = ProviderContainer();
    addTearDown(reopened.dispose);
    final again = await reopened.read(prefectureRecordsProvider.future);
    expect(again.length, 1);
  });

  test('旧版で記録未保存でも cleared_ フラグから補完して 1/47 になる', () async {
    SharedPreferences.setMockInitialValues({
      'cleared_01_easy': true,
      'best_01_easy': 900,
    });
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final records = await container.read(prefectureRecordsProvider.future);
    expect(records.length, 1);
    expect(records['01']!.bestScore, 900);
    expect(records['01']!.highestDifficulty, 'easy');
  });
}
