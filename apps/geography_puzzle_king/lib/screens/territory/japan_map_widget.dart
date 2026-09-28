import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:geography_puzzle_king/data/japan_prefecture_boundaries.dart';
import 'package:geography_puzzle_king/models/prefecture_record.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';

/// 都道府県ID（social_quiz_app 由来の境界データのキー）を
/// JIS都道府県コード（'01'〜'47'）に対応させる並び順。
/// prefBoundaryMap の記載順は JIS コード順と一致している。
const List<String> _prefectureIdsInJisOrder = [
  'hokkaido', 'aomori', 'iwate', 'miyagi', 'akita', 'yamagata', 'fukushima',
  'ibaraki', 'tochigi', 'gunma', 'saitama', 'chiba', 'tokyo', 'kanagawa',
  'niigata', 'toyama', 'ishikawa', 'fukui', 'yamanashi', 'nagano', 'gifu',
  'shizuoka', 'aichi', 'mie', 'shiga', 'kyoto', 'osaka', 'hyogo', 'nara',
  'wakayama', 'tottori', 'shimane', 'okayama', 'hiroshima', 'yamaguchi',
  'tokushima', 'kagawa', 'ehime', 'kochi', 'fukuoka', 'saga', 'nagasaki',
  'kumamoto', 'oita', 'miyazaki', 'kagoshima', 'okinawa',
];

/// JIS都道府県コード → 境界データID。
final Map<String, String> _codeToId = {
  for (var i = 0; i < _prefectureIdsInJisOrder.length; i++)
    (i + 1).toString().padLeft(2, '0'): _prefectureIdsInJisOrder[i],
};

const Map<String, String> prefectureEmojis = {
  '01': '🏔️', '02': '🌲', '03': '🌲', '04': '🏔️', '05': '🌲', '06': '🌊',
  '07': '🌲', '08': '🗻', '09': '⛩️', '10': '🏛️', '11': '🌆', '12': '🏞️',
  '13': '🗼', '14': '🌊', '15': '🏔️', '16': '⛩️', '17': '🏔️', '18': '🌲',
  '19': '⛩️', '20': '🏔️', '21': '🌊', '22': '🏔️', '23': '🏭', '24': '🏔️',
  '25': '⛩️', '26': '🏯', '27': '🌲', '28': '🏞️', '29': '🌊', '30': '🏛️',
  '31': '🏞️', '32': '🌊', '33': '🏔️', '34': '🌲', '35': '⛩️', '36': '🌊',
  '37': '⛩️', '38': '🌊', '39': '🌲', '40': '⛩️', '41': '🌊', '42': '🏔️',
  '43': '🌊', '44': '🏔️', '45': '🌲', '46': '⛩️', '47': '🌴',
};

/// 実際の都道府県境界ポリゴンを描画するリアル地図。
/// クリア状況に応じて都道府県を色分けし、タップで onPrefectureTap を呼ぶ。
class JapanMapWidget extends StatefulWidget {
  final Map<String, PrefectureRecord> records;
  final Function(String) onPrefectureTap;

  const JapanMapWidget({
    Key? key,
    required this.records,
    required this.onPrefectureTap,
  }) : super(key: key);

  @override
  State<JapanMapWidget> createState() => _JapanMapWidgetState();
}

// 沖縄は本土から大きく南西に離れているため、通常のバウンディングボックスに
// 含めると本土側の縮尺が大きく下がってしまう。沖縄だけは地図右下に固定表示の
// インセット枠を設け、本土側をズームアップして表示する。
const String _okinawaCode = '47';

/// インセット枠のサイズ・位置（メイン地図の描画領域に対する比率）。
const double _insetWidthRatio = 0.30;
const double _insetHeightRatio = 0.22;
const double _insetMargin = 6.0;

class _JapanMapWidgetState extends State<JapanMapWidget> {
  String? _selectedCode;
  Size? _pathsSize;
  Map<String, List<Path>>? _paths;
  List<Path>? _okinawaPaths;
  Rect? _okinawaInsetRect;

  Map<String, List<Path>> _pathsFor(Size size) {
    if (_paths != null && _pathsSize == size) return _paths!;

    double minLat = 90, maxLat = -90, minLng = 180, maxLng = -180;
    for (final entry in prefBoundaryMap.entries) {
      // 沖縄は本土のバウンディングボックス計算から除外し、別枠で描画する。
      if (entry.key == 'okinawa') continue;
      final boundary = entry.value;
      for (final ring in boundary.borders) {
        for (final p in ring) {
          if (p.lat < minLat) minLat = p.lat;
          if (p.lat > maxLat) maxLat = p.lat;
          if (p.lng < minLng) minLng = p.lng;
          if (p.lng > maxLng) maxLng = p.lng;
        }
      }
    }

    // 緯度による経度方向の縮みを補正する簡易円筒図法
    final centerLatRad = (minLat + maxLat) / 2 * (math.pi / 180);
    final lngScale = math.cos(centerLatRad);

    final geoWidth = (maxLng - minLng) * lngScale;
    final geoHeight = (maxLat - minLat);

    const padding = 8.0;
    final availW = size.width - padding * 2;
    final availH = size.height - padding * 2;
    final scale = (availW / geoWidth < availH / geoHeight)
        ? availW / geoWidth
        : availH / geoHeight;

    final drawnW = geoWidth * scale;
    final drawnH = geoHeight * scale;
    final offsetX = padding + (availW - drawnW) / 2;
    final offsetY = padding + (availH - drawnH) / 2;

    Offset project(GeoPoint p) {
      final x = (p.lng - minLng) * lngScale * scale + offsetX;
      final y = (maxLat - p.lat) * scale + offsetY;
      return Offset(x, y);
    }

    final result = <String, List<Path>>{};
    _codeToId.forEach((code, id) {
      if (code == _okinawaCode) return; // 沖縄はインセット枠で別途描画
      final boundary = prefBoundaryMap[id];
      if (boundary == null) return;
      final ringPaths = <Path>[];
      for (final ring in boundary.borders) {
        if (ring.isEmpty) continue;
        final path = Path();
        final first = project(ring.first);
        path.moveTo(first.dx, first.dy);
        for (final p in ring.skip(1)) {
          final o = project(p);
          path.lineTo(o.dx, o.dy);
        }
        path.close();
        ringPaths.add(path);
      }
      result[code] = ringPaths;
    });

    _paths = result;
    _pathsSize = size;
    _buildOkinawaInset(size);
    return result;
  }

  /// 沖縄を画面右下の固定インセット枠内に独自の縮尺で描画するためのパスを作る。
  void _buildOkinawaInset(Size size) {
    final boundary = prefBoundaryMap['okinawa'];
    if (boundary == null) {
      _okinawaPaths = null;
      _okinawaInsetRect = null;
      return;
    }

    final insetW = size.width * _insetWidthRatio;
    final insetH = size.height * _insetHeightRatio;
    final insetRect = Rect.fromLTWH(
      size.width - insetW - _insetMargin,
      size.height - insetH - _insetMargin,
      insetW,
      insetH,
    );

    double minLat = 90, maxLat = -90, minLng = 180, maxLng = -180;
    for (final ring in boundary.borders) {
      for (final p in ring) {
        if (p.lat < minLat) minLat = p.lat;
        if (p.lat > maxLat) maxLat = p.lat;
        if (p.lng < minLng) minLng = p.lng;
        if (p.lng > maxLng) maxLng = p.lng;
      }
    }
    final centerLatRad = (minLat + maxLat) / 2 * (math.pi / 180);
    final lngScale = math.cos(centerLatRad);
    final geoWidth = (maxLng - minLng) * lngScale;
    final geoHeight = (maxLat - minLat);
    const padding = 4.0;
    final availW = insetRect.width - padding * 2;
    final availH = insetRect.height - padding * 2;
    final scale = geoWidth == 0 || geoHeight == 0
        ? 1.0
        : (availW / geoWidth < availH / geoHeight
            ? availW / geoWidth
            : availH / geoHeight);
    final drawnW = geoWidth * scale;
    final drawnH = geoHeight * scale;
    final offsetX = insetRect.left + padding + (availW - drawnW) / 2;
    final offsetY = insetRect.top + padding + (availH - drawnH) / 2;

    Offset project(GeoPoint p) {
      final x = (p.lng - minLng) * lngScale * scale + offsetX;
      final y = (maxLat - p.lat) * scale + offsetY;
      return Offset(x, y);
    }

    final ringPaths = <Path>[];
    for (final ring in boundary.borders) {
      if (ring.isEmpty) continue;
      final path = Path();
      final first = project(ring.first);
      path.moveTo(first.dx, first.dy);
      for (final p in ring.skip(1)) {
        final o = project(p);
        path.lineTo(o.dx, o.dy);
      }
      path.close();
      ringPaths.add(path);
    }

    _okinawaPaths = ringPaths;
    _okinawaInsetRect = insetRect;
  }

  String? _hitTest(Map<String, List<Path>> paths, Offset position) {
    // 沖縄インセット枠内のタップを優先判定する。
    if (_okinawaPaths != null) {
      for (final path in _okinawaPaths!) {
        if (path.contains(position)) return _okinawaCode;
      }
    }
    for (final entry in paths.entries) {
      for (final path in entry.value) {
        if (path.contains(position)) return entry.key;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.japanMapLabel,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 0.82,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(constraints.maxWidth, constraints.maxHeight);
              final paths = _pathsFor(size);
              return GestureDetector(
                onTapUp: (details) {
                  final code = _hitTest(paths, details.localPosition);
                  if (code == null) return;
                  setState(() => _selectedCode = code);
                  widget.onPrefectureTap(code);
                },
                child: CustomPaint(
                  size: size,
                  painter: _JapanMapPainter(
                    paths: paths,
                    okinawaPaths: _okinawaPaths,
                    okinawaInsetRect: _okinawaInsetRect,
                    records: widget.records,
                    selectedCode: _selectedCode,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.mapDataAttribution,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
      ],
    );
  }
}

class _JapanMapPainter extends CustomPainter {
  final Map<String, List<Path>> paths;
  final List<Path>? okinawaPaths;
  final Rect? okinawaInsetRect;
  final Map<String, PrefectureRecord> records;
  final String? selectedCode;

  _JapanMapPainter({
    required this.paths,
    this.okinawaPaths,
    this.okinawaInsetRect,
    required this.records,
    this.selectedCode,
  });

  Color _colorFor(String code) {
    final record = records[code];
    if (record == null) return Colors.grey.shade300;
    final level = record.currentLevel;
    if (level >= 8) return Colors.amber.shade600;
    if (level >= 5) return Colors.blue.shade600;
    if (level >= 2) return Colors.orange.shade500;
    return Colors.green.shade500;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7
      ..color = Colors.white;
    final selectedBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..color = Colors.black87;

    paths.forEach((code, ringPaths) {
      final fillPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = _colorFor(code);
      for (final path in ringPaths) {
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(
          path,
          code == selectedCode ? selectedBorderPaint : borderPaint,
        );
      }
    });

    // 沖縄インセット枠（別枠であることが分かるよう背景と枠線を描く）。
    if (okinawaPaths != null && okinawaInsetRect != null) {
      final insetBgPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.blueGrey.shade50;
      final insetBorderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0
        ..color = Colors.grey.shade500;
      final insetRRect = RRect.fromRectAndRadius(
        okinawaInsetRect!,
        const Radius.circular(4),
      );
      canvas.drawRRect(insetRRect, insetBgPaint);
      canvas.drawRRect(insetRRect, insetBorderPaint);

      final fillPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = _colorFor(_okinawaCode);
      for (final path in okinawaPaths!) {
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(
          path,
          _okinawaCode == selectedCode ? selectedBorderPaint : borderPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _JapanMapPainter oldDelegate) {
    return oldDelegate.paths != paths ||
        oldDelegate.okinawaPaths != okinawaPaths ||
        oldDelegate.records != records ||
        oldDelegate.selectedCode != selectedCode;
  }
}
