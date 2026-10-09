import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prefecture_record.dart';
import '../utils/prefecture_data.dart' show allPrefectures, getPrefectureByCode;

final prefectureRecordsProvider = AsyncNotifierProvider<
    PrefectureRecordsNotifier,
    Map<String, PrefectureRecord>>(
  PrefectureRecordsNotifier.new,
);

class PrefectureRecordsNotifier
    extends AsyncNotifier<Map<String, PrefectureRecord>> {
  SharedPreferences? _prefsOrNull;
  SharedPreferences get _prefs => _prefsOrNull!;

  @override
  Future<Map<String, PrefectureRecord>> build() async {
    try {
      _prefsOrNull = await SharedPreferences.getInstance();
      return await _loadFromPrefs();
    } catch (e) {
      print('Error initializing prefecture records: $e');
      return {};
    }
  }

  Future<Map<String, PrefectureRecord>> _loadFromPrefs() async {
    final records = <String, PrefectureRecord>{};

    for (final pref in allPrefectures) {
      final json = _prefs.getString('prefecture_record_${pref.code}');
      if (json != null) {
        try {
          records[pref.code] =
              PrefectureRecord.fromJson(jsonDecode(json) as Map<String, dynamic>);
        } catch (e) {
          print('Error loading prefecture record ${pref.code}: $e');
        }
      }
      // 旧バージョンで記録が保存されなかった（下記 recordClear の初期化競合）端末向け:
      // ホーム/県選択が使う cleared_<県>_<難度> フラグから記録を補完する。
      if (!records.containsKey(pref.code)) {
        final backfilled = _backfillFromClearFlags(pref.code);
        if (backfilled != null) records[pref.code] = backfilled;
      }
    }

    return records;
  }

  PrefectureRecord? _backfillFromClearFlags(String code) {
    const order = ['easy', 'normal', 'hard'];
    String? highest;
    var best = 0;
    for (final d in order) {
      if (_prefs.getBool('cleared_${code}_$d') == true) {
        highest = d;
        final b = _prefs.getInt('best_${code}_$d') ?? 0;
        if (b > best) best = b;
      }
    }
    if (highest == null) return null;
    final now = DateTime.now();
    return PrefectureRecord(
      prefectureCode: code,
      totalClears: 1,
      currentLevel: 1,
      currentExp: 0,
      firstClearedAt: now,
      lastClearedAt: now,
      bestScore: best,
      highestDifficulty: highest,
    );
  }

  Future<void> recordClear(
    String prefectureCode,
    int score,
    String difficulty,
    int baseExp,
  ) async {
    final now = DateTime.now();
    // provider が初回読み込み中（結果画面から初めて参照された場合）でも、
    // 読み込み完了を待ってから保存する。待たないと _prefs 未初期化で例外になり
    // 記録が一切保存されず、地図が常に 0/47 になる。
    final loaded = await future;
    final prefs = _prefsOrNull ?? await SharedPreferences.getInstance();
    final currentState = state.valueOrNull ?? loaded;
    final existing = currentState[prefectureCode];

    final updated = existing != null
        ? existing
            .copyWith(
              totalClears: existing.totalClears + 1,
              lastClearedAt: now,
              bestScore: score > existing.bestScore ? score : existing.bestScore,
              highestDifficulty: _getHighestDifficulty(
                existing.highestDifficulty,
                difficulty,
              ),
            )
            .addExp(baseExp)
        : PrefectureRecord(
            prefectureCode: prefectureCode,
            totalClears: 1,
            currentLevel: 1,
            currentExp: baseExp,
            firstClearedAt: now,
            lastClearedAt: now,
            bestScore: score,
            highestDifficulty: difficulty,
          );

    await prefs.setString(
      'prefecture_record_$prefectureCode',
      jsonEncode(updated.toJson()),
    );

    state = AsyncValue.data({...currentState, prefectureCode: updated});
  }

  String? _getHighestDifficulty(String? current, String newOne) {
    if (current == null) return newOne;
    // difficulty はアプリ全体で小文字表記（'easy'/'normal'/'hard'）で統一されている。
    // ここが大文字表記だと indexOf が常に -1 を返し、初回クリア後は
    // 難易度がどれだけ上がっても highestDifficulty が更新されなくなる。
    const order = ['easy', 'normal', 'hard'];
    final currentIdx = order.indexOf(current);
    final newIdx = order.indexOf(newOne);
    return newIdx > currentIdx ? newOne : current;
  }

  int getTotalClears() {
    final currentState = state.valueOrNull ?? {};
    return currentState.values.fold(0, (sum, record) => sum + record.totalClears);
  }

  int getTotalClearedPrefectures() {
    final currentState = state.valueOrNull ?? {};
    return currentState.length;
  }

  double getAverageLevel() {
    final currentState = state.valueOrNull ?? {};
    if (currentState.isEmpty) return 0.0;
    final sum = currentState.values.fold<int>(0, (sum, record) => sum + record.currentLevel);
    return sum / currentState.length;
  }

  int getHighestScore() {
    final currentState = state.valueOrNull ?? {};
    if (currentState.isEmpty) return 0;
    return currentState.values.fold<int>(0, (max, record) => record.bestScore > max ? record.bestScore : max);
  }

  PrefectureRecord? getRecord(String prefectureCode) {
    final currentState = state.valueOrNull ?? {};
    return currentState[prefectureCode];
  }
}
