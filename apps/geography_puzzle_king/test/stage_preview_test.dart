// ステージ背景(県の形)の見た目確認用。実行すると build/stage_preview.png を出力する。
// 実際の _GameFieldPainter は非公開のため、格子・通り道は同じ配色で再現した近似。
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:geography_puzzle_king/screens/game/prefecture_backdrop.dart';
import 'package:geography_puzzle_king/services/td_engine.dart';

void main() {
  test('ステージ背景のプレビュー画像を書き出す', () async {
    const codes = ['01', '13', '27', '37', '47', '15']; // 北海道/東京/大阪/香川/沖縄/新潟
    const cell = 18.0;
    final w = TdEngine.cols * cell, h = TdEngine.rows * cell;
    const cols = 3, gap = 12.0;
    final rows = (codes.length / cols).ceil();
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    canvas.drawRect(ui.Rect.fromLTWH(0, 0, cols * (w + gap) + gap, rows * (h + gap) + gap),
        ui.Paint()..color = const ui.Color(0xFF0B0F14));
    for (var i = 0; i < codes.length; i++) {
      final ox = gap + (i % cols) * (w + gap), oy = gap + (i ~/ cols) * (h + gap);
      canvas.save();
      canvas.translate(ox, oy);
      canvas.clipRect(ui.Rect.fromLTWH(0, 0, w, h));
      final state = TdEngine.createInitial('normal', codes[i]);
      for (var r = 0; r < state.rows; r++) {
        for (var c = 0; c < state.cols; c++) {
          canvas.drawRect(ui.Rect.fromLTWH(c * cell, r * cell, cell, cell),
              ui.Paint()..color = (r + c) % 2 == 0 ? const ui.Color(0xFF1E2E3E) : const ui.Color(0xFF253444));
        }
      }
      paintPrefectureBackdrop(canvas, ui.Size(w, h), cell, codes[i]);
      for (final p in state.pathSet) {
        canvas.drawRect(ui.Rect.fromLTWH(p.col * cell, p.row * cell, cell, cell),
            ui.Paint()..color = const ui.Color(0xFF8B7355));
      }
      canvas.restore();
    }
    final img = await recorder
        .endRecording()
        .toImage((cols * (w + gap) + gap).toInt(), (rows * (h + gap) + gap).toInt());
    final bytes = (await img.toByteData(format: ui.ImageByteFormat.png))!;
    final out = File('build/stage_preview.png')..createSync(recursive: true);
    out.writeAsBytesSync(bytes.buffer.asUint8List());
    expect(out.lengthSync(), greaterThan(1000));
  });
}
