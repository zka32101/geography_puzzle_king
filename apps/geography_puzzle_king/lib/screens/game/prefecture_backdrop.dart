import 'dart:math';
import 'dart:ui';

import 'package:geography_puzzle_king/data/japan_prefecture_boundaries.dart';
import 'package:geography_puzzle_king/screens/territory/japan_map_widget.dart'
    show prefBoundaryByCode;

/// ステージ背景に、その都道府県の実際の形(本土＋主要な島)をうっすら敷く。
/// 試作: 形は見た目のみで、敵の通り道・施設の置き場所には影響しない。
/// 地方決戦・歴史ステージ(県でないコード)では何も描かない。
void paintPrefectureBackdrop(
    Canvas canvas, Size size, double cellSize, String? prefectureCode) {
  final code = prefectureCode;
  if (code == null) return;
  final PrefBoundary? boundary = prefBoundaryByCode(code);
  if (boundary == null || boundary.borders.isEmpty) return;

  // 経度は緯度で補正(cos)し、フィールドに余白付きで収める。
  // 東京(小笠原)・沖縄(大東)のように本土から遠い離島があると、本土が点になってしまうので、
  // 最大の島(本土)から離れすぎた島は描かず、収める範囲にも含めない。
  final cosLat = cos(boundary.center.lat * pi / 180);
  Rect boxOf(List<GeoPoint> ring) {
    var l = double.infinity, t = double.infinity;
    var r = -double.infinity, b = -double.infinity;
    for (final p in ring) {
      final x = p.lng * cosLat, y = -p.lat;
      if (x < l) l = x;
      if (x > r) r = x;
      if (y < t) t = y;
      if (y > b) b = y;
    }
    return Rect.fromLTRB(l, t, r, b);
  }

  final rings = [for (final r in boundary.borders) if (r.length >= 3) r];
  if (rings.isEmpty) return;
  final boxes = [for (final r in rings) boxOf(r)];
  var mainIdx = 0;
  for (var i = 1; i < boxes.length; i++) {
    if (boxes[i].width * boxes[i].height >
        boxes[mainIdx].width * boxes[mainIdx].height) {
      mainIdx = i;
    }
  }
  final main = boxes[mainIdx];
  final reach = max(main.width, main.height) * 1.5;
  final kept = <int>[
    for (var i = 0; i < rings.length; i++)
      if ((boxes[i].center - main.center).distance <= reach) i
  ];
  var minX = double.infinity, minY = double.infinity;
  var maxX = -double.infinity, maxY = -double.infinity;
  for (final i in kept) {
    minX = min(minX, boxes[i].left);
    maxX = max(maxX, boxes[i].right);
    minY = min(minY, boxes[i].top);
    maxY = max(maxY, boxes[i].bottom);
  }
  final w = maxX - minX, h = maxY - minY;
  if (w <= 0 || h <= 0) return;
  final pad = cellSize;
  final scale = min((size.width - 2 * pad) / w, (size.height - 2 * pad) / h);
  final ox = (size.width - w * scale) / 2, oy = (size.height - h * scale) / 2;

  final path = Path();
  for (final i in kept) {
    path.addPolygon([
      for (final p in rings[i])
        Offset(ox + (p.lng * cosLat - minX) * scale,
            oy + (-p.lat - minY) * scale)
    ], true);
  }
  canvas.drawPath(path, Paint()..color = const Color(0x593E6B4A));
  canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = const Color(0x8C9CCC9C));
}
