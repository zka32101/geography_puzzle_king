// japan_prefecture_boundaries.dart
// 都道府県の中心座標と境界ポリゴン（WGS84 緯度経度、簡易フラット地図描画用）
//
// 出典（データソース）:
//   「地球地図日本」国土地理院（GSI）
//   https://github.com/dataofjapan/land （japan.geojson, 非公式ミラー）
//   地球地図日本の利用条件により、非営利利用は出典明記、
//   営利利用は出典明記に加え著作権者（国土地理院）への利用報告が必要。
//   → 本アプリ（買い切り課金あり）は利用報告の対応が必要（対応済み/対応予定）。
//   → アプリ内で出典表示を行うこと（territory_screen.dart 参照）。
//
// social_quiz_app（社会コレ）の lib/data/japan_prefecture_latlng.dart から
// 移植（緯度経度データ本体は同一、型を本アプリ用に GeoPoint に変更し
// latlong2 パッケージへの依存を排除）。

class GeoPoint {
  final double lat;
  final double lng;
  const GeoPoint(this.lat, this.lng);
}

class PrefBoundary {
  final GeoPoint center;
  final List<List<GeoPoint>> borders; // 1県あたり複数ポリゴン（本土＋主要な島）
  const PrefBoundary(this.center, this.borders);
}

// ignore_for_file: prefer_const_constructors
final Map<String, PrefBoundary> prefBoundaryMap = {
  // ━━━━ 北海道 ━━━━
  'hokkaido': PrefBoundary(
    const GeoPoint(43.3842, 142.5718),
    [
      [
        GeoPoint(45.1769, 141.5791), GeoPoint(45.4507, 141.6457), GeoPoint(45.5225, 141.9432), GeoPoint(44.5579, 142.9968),
        GeoPoint(43.9451, 144.4070), GeoPoint(43.9320, 144.7953), GeoPoint(44.3459, 145.3331), GeoPoint(43.7532, 145.0684),
        GeoPoint(43.5865, 145.3415), GeoPoint(43.6005, 145.1966), GeoPoint(43.2924, 145.3856), GeoPoint(43.3861, 145.8174),
        GeoPoint(42.9822, 144.9744), GeoPoint(42.8748, 143.9196), GeoPoint(42.4158, 143.3891), GeoPoint(41.9255, 143.2502),
        GeoPoint(42.6581, 141.6960), GeoPoint(42.3020, 141.0016), GeoPoint(42.5865, 140.4685), GeoPoint(42.2532, 140.2869),
        GeoPoint(41.8025, 141.1864), GeoPoint(41.8175, 140.6411), GeoPoint(41.4184, 140.0891), GeoPoint(41.9759, 140.1328),
        GeoPoint(42.2601, 139.7751), GeoPoint(42.6138, 139.8234), GeoPoint(42.9917, 140.5224), GeoPoint(43.3345, 140.3466),
        GeoPoint(43.1449, 141.1617), GeoPoint(43.3289, 141.4239), GeoPoint(43.7253, 141.3299), GeoPoint(43.9448, 141.6477),
        GeoPoint(44.6437, 141.7925), GeoPoint(45.1699, 141.5819),
      ],
      [
        GeoPoint(45.2912, 148.3427), GeoPoint(45.5571, 148.7540), GeoPoint(45.3396, 148.8435), GeoPoint(44.9976, 147.6635),
        GeoPoint(44.4265, 146.9527), GeoPoint(44.8183, 147.1041), GeoPoint(45.2112, 147.8531), GeoPoint(45.4293, 147.9094),
        GeoPoint(45.2839, 148.3193),
      ],
      [
        GeoPoint(44.0647, 145.7473), GeoPoint(44.5091, 146.1290), GeoPoint(44.4558, 146.5776), GeoPoint(44.1373, 145.9245),
        GeoPoint(43.6583, 145.5448), GeoPoint(43.8365, 145.4028), GeoPoint(44.0599, 145.7476),
      ],
    ],
  ),

  // ━━━━ 青森県 ━━━━
  'aomori': PrefBoundary(
    const GeoPoint(40.7837, 140.8287),
    [
      [
        GeoPoint(41.2108, 140.7786), GeoPoint(41.5470, 140.9128), GeoPoint(41.3565, 141.2659), GeoPoint(41.4301, 141.4643),
        GeoPoint(40.7532, 141.4158), GeoPoint(40.5573, 141.4877), GeoPoint(40.4509, 141.6831), GeoPoint(40.2185, 141.0061),
        GeoPoint(40.4275, 140.9854), GeoPoint(40.4405, 140.8613), GeoPoint(40.5115, 140.8797), GeoPoint(40.4039, 140.6471),
        GeoPoint(40.4876, 140.3884), GeoPoint(40.4287, 139.9364), GeoPoint(40.6140, 139.8606), GeoPoint(40.8020, 140.2510),
        GeoPoint(41.0458, 140.3235), GeoPoint(41.1344, 140.2490), GeoPoint(41.2605, 140.3395), GeoPoint(41.1925, 140.6310),
        GeoPoint(40.8317, 140.7329), GeoPoint(41.0097, 140.8802), GeoPoint(40.8903, 141.1631), GeoPoint(41.1551, 141.2785),
        GeoPoint(41.2532, 141.2230), GeoPoint(41.1285, 140.8123), GeoPoint(41.2077, 140.7785),
      ],
    ],
  ),

  // ━━━━ 岩手県 ━━━━
  'iwate': PrefBoundary(
    const GeoPoint(39.5965, 141.3599),
    [
      [
        GeoPoint(40.3745, 141.5819), GeoPoint(40.4509, 141.6831), GeoPoint(40.2707, 141.8167), GeoPoint(39.7761, 142.0046),
        GeoPoint(39.5915, 141.9475), GeoPoint(39.6557, 142.0268), GeoPoint(39.5487, 142.0726), GeoPoint(39.3037, 141.8879),
        GeoPoint(39.2491, 141.9712), GeoPoint(39.1462, 141.8375), GeoPoint(39.1051, 141.9218), GeoPoint(39.1121, 141.8115),
        GeoPoint(39.0265, 141.8456), GeoPoint(39.0666, 141.7231), GeoPoint(38.9392, 141.7057), GeoPoint(38.9985, 141.4910),
        GeoPoint(38.7729, 141.4233), GeoPoint(38.7495, 141.2170), GeoPoint(38.8779, 141.1401), GeoPoint(38.9585, 140.7739),
        GeoPoint(39.1803, 140.8085), GeoPoint(39.3909, 140.6541), GeoPoint(39.6498, 140.8219), GeoPoint(39.8657, 140.7830),
        GeoPoint(39.8747, 140.8781), GeoPoint(40.2140, 140.8962), GeoPoint(40.3702, 141.5732),
      ],
    ],
  ),

  // ━━━━ 宮城県 ━━━━
  'miyagi': PrefBoundary(
    const GeoPoint(38.4497, 140.9236),
    [
      [
        GeoPoint(38.9785, 141.4839), GeoPoint(38.9710, 141.6322), GeoPoint(38.8667, 141.6746), GeoPoint(38.9059, 141.5754),
        GeoPoint(38.6905, 141.5609), GeoPoint(38.6738, 141.4448), GeoPoint(38.6374, 141.5294), GeoPoint(38.5763, 141.4600),
        GeoPoint(38.5032, 141.5427), GeoPoint(38.4415, 141.4476), GeoPoint(38.4000, 141.5388), GeoPoint(38.2719, 141.5242),
        GeoPoint(38.3995, 141.4312), GeoPoint(38.3697, 141.0628), GeoPoint(37.8963, 140.9312), GeoPoint(37.7734, 140.7929),
        GeoPoint(37.9007, 140.6613), GeoPoint(37.9821, 140.2752), GeoPoint(38.4555, 140.6201), GeoPoint(38.6341, 140.5380),
        GeoPoint(38.7688, 140.6463), GeoPoint(38.8895, 140.5473), GeoPoint(38.9635, 140.8262), GeoPoint(38.8779, 141.1401),
        GeoPoint(38.7484, 141.2348), GeoPoint(38.7833, 141.4383), GeoPoint(38.9707, 141.4878),
      ],
    ],
  ),

  // ━━━━ 秋田県 ━━━━
  'akita': PrefBoundary(
    const GeoPoint(39.7528, 140.4053),
    [
      [
        GeoPoint(40.5115, 140.8797), GeoPoint(40.4405, 140.8613), GeoPoint(40.4275, 140.9854), GeoPoint(40.3537, 140.9950),
        GeoPoint(40.2282, 140.9421), GeoPoint(40.1738, 140.8605), GeoPoint(39.8747, 140.8781), GeoPoint(39.8657, 140.7830),
        GeoPoint(39.7961, 140.8478), GeoPoint(39.7349, 140.7749), GeoPoint(39.6498, 140.8219), GeoPoint(39.3909, 140.6541),
        GeoPoint(39.2380, 140.7888), GeoPoint(39.1977, 140.7657), GeoPoint(39.1787, 140.8083), GeoPoint(39.0865, 140.7529),
        GeoPoint(39.0574, 140.8103), GeoPoint(38.9585, 140.7739), GeoPoint(38.8833, 140.6385), GeoPoint(38.8952, 140.5024),
        GeoPoint(38.9923, 140.4322), GeoPoint(39.0495, 140.1509), GeoPoint(39.1339, 140.0626), GeoPoint(39.1186, 139.8698),
        GeoPoint(39.4199, 140.0256), GeoPoint(39.7738, 140.0496), GeoPoint(39.9011, 139.9209), GeoPoint(39.8571, 139.7553),
        GeoPoint(39.9960, 139.6931), GeoPoint(39.9592, 139.8133), GeoPoint(40.0865, 139.9530), GeoPoint(40.3395, 140.0259),
        GeoPoint(40.4287, 139.9364), GeoPoint(40.4205, 140.0197), GeoPoint(40.4693, 140.0685), GeoPoint(40.4399, 140.3354),
        GeoPoint(40.4876, 140.3884), GeoPoint(40.4032, 140.5415), GeoPoint(40.4367, 140.5899), GeoPoint(40.4039, 140.6471),
        GeoPoint(40.5097, 140.8718),
      ],
    ],
  ),

  // ━━━━ 山形県 ━━━━
  'yamagata': PrefBoundary(
    const GeoPoint(38.4505, 140.1000),
    [
      [
        GeoPoint(39.1186, 139.8698), GeoPoint(39.1339, 140.0626), GeoPoint(39.0495, 140.1509), GeoPoint(39.0260, 140.3625),
        GeoPoint(38.7688, 140.6463), GeoPoint(38.6399, 140.6007), GeoPoint(38.6341, 140.5380), GeoPoint(38.4555, 140.6201),
        GeoPoint(38.2697, 140.4714), GeoPoint(38.1807, 140.4795), GeoPoint(38.0705, 140.4021), GeoPoint(38.0565, 140.2772),
        GeoPoint(37.7827, 140.2771), GeoPoint(37.7346, 140.1175), GeoPoint(37.7603, 139.9895), GeoPoint(37.8299, 139.9326),
        GeoPoint(37.8035, 139.8102), GeoPoint(37.8472, 139.6811), GeoPoint(37.9187, 139.6249), GeoPoint(38.0572, 139.6928),
        GeoPoint(38.1825, 139.6880), GeoPoint(38.1929, 139.7867), GeoPoint(38.2925, 139.8988), GeoPoint(38.3919, 139.7061),
        GeoPoint(38.4966, 139.7219), GeoPoint(38.5584, 139.5403), GeoPoint(38.8005, 139.7617), GeoPoint(39.1153, 139.8704),
      ],
    ],
  ),

  // ━━━━ 福島県 ━━━━
  'fukushima': PrefBoundary(
    const GeoPoint(37.3820, 140.2226),
    [
      [
        GeoPoint(37.9769, 140.2801), GeoPoint(37.8883, 140.6904), GeoPoint(37.7817, 140.7280), GeoPoint(37.7958, 140.8526),
        GeoPoint(37.8913, 140.8567), GeoPoint(37.9039, 140.8991), GeoPoint(37.8241, 140.9866), GeoPoint(37.4812, 141.0433),
        GeoPoint(36.9949, 140.9818), GeoPoint(36.8575, 140.7912), GeoPoint(36.9455, 140.5863), GeoPoint(36.8731, 140.5919),
        GeoPoint(36.7918, 140.4637), GeoPoint(36.9435, 140.2432), GeoPoint(37.0261, 140.2492), GeoPoint(37.1064, 140.1378),
        GeoPoint(37.1550, 139.9549), GeoPoint(36.9109, 139.3934), GeoPoint(36.9368, 139.2311), GeoPoint(37.1648, 139.2534),
        GeoPoint(37.2380, 139.1648), GeoPoint(37.3439, 139.2336), GeoPoint(37.4430, 139.2161), GeoPoint(37.5131, 139.5852),
        GeoPoint(37.6488, 139.5494), GeoPoint(37.8179, 139.7415), GeoPoint(37.8562, 139.7075), GeoPoint(37.8035, 139.8102),
        GeoPoint(37.8285, 139.9374), GeoPoint(37.7589, 139.9927), GeoPoint(37.7467, 140.2373), GeoPoint(37.8090, 140.2988),
        GeoPoint(37.8355, 140.2627), GeoPoint(37.9763, 140.2784),
      ],
    ],
  ),

  // ━━━━ 茨城県 ━━━━
  'ibaraki': PrefBoundary(
    const GeoPoint(36.3105, 140.3164),
    [
      [
        GeoPoint(36.9375, 140.5682), GeoPoint(36.8313, 140.8062), GeoPoint(36.4871, 140.6117), GeoPoint(36.3813, 140.6268),
        GeoPoint(36.2558, 140.5597), GeoPoint(35.9377, 140.7011), GeoPoint(35.8970, 140.6748), GeoPoint(35.9250, 140.7071),
        GeoPoint(35.7439, 140.8519), GeoPoint(35.9587, 140.5113), GeoPoint(35.9058, 140.5028), GeoPoint(35.8456, 140.1466),
        GeoPoint(35.9403, 139.9392), GeoPoint(36.1041, 139.7868), GeoPoint(36.0879, 139.7298), GeoPoint(36.1726, 139.6912),
        GeoPoint(36.3785, 139.9733), GeoPoint(36.4043, 140.1916), GeoPoint(36.5176, 140.2603), GeoPoint(36.6859, 140.2206),
        GeoPoint(36.7127, 140.2926), GeoPoint(36.9277, 140.2524), GeoPoint(36.7918, 140.4637), GeoPoint(36.8731, 140.5919),
        GeoPoint(36.9369, 140.5676),
      ],
    ],
  ),

  // ━━━━ 栃木県 ━━━━
  'tochigi': PrefBoundary(
    const GeoPoint(36.6927, 139.8162),
    [
      [
        GeoPoint(37.1535, 139.9614), GeoPoint(37.1064, 140.1378), GeoPoint(37.0641, 140.1941), GeoPoint(37.0240, 140.2046),
        GeoPoint(37.0261, 140.2492), GeoPoint(36.7645, 140.2555), GeoPoint(36.7127, 140.2926), GeoPoint(36.6859, 140.2206),
        GeoPoint(36.5176, 140.2603), GeoPoint(36.5029, 140.2309), GeoPoint(36.3983, 140.1853), GeoPoint(36.4147, 140.1304),
        GeoPoint(36.4038, 140.0665), GeoPoint(36.3751, 140.0449), GeoPoint(36.3785, 139.9733), GeoPoint(36.3509, 139.9645),
        GeoPoint(36.3365, 139.9142), GeoPoint(36.3006, 139.9096), GeoPoint(36.3230, 139.8782), GeoPoint(36.3113, 139.8487),
        GeoPoint(36.2398, 139.8217), GeoPoint(36.2014, 139.6777), GeoPoint(36.2545, 139.6309), GeoPoint(36.2667, 139.6428),
        GeoPoint(36.2715, 139.4644), GeoPoint(36.3667, 139.3695), GeoPoint(36.4160, 139.3805), GeoPoint(36.4642, 139.4351),
        GeoPoint(36.5009, 139.4192), GeoPoint(36.5482, 139.4383), GeoPoint(36.5824, 139.4834), GeoPoint(36.6065, 139.4653),
        GeoPoint(36.6272, 139.3309), GeoPoint(36.7457, 139.3718), GeoPoint(36.7737, 139.3531), GeoPoint(36.8296, 139.4064),
        GeoPoint(36.8527, 139.3487), GeoPoint(36.9697, 139.4599), GeoPoint(36.9811, 139.5356), GeoPoint(37.0917, 139.7758),
        GeoPoint(37.0855, 139.8220), GeoPoint(37.1182, 139.8163), GeoPoint(37.1474, 139.8664), GeoPoint(37.1550, 139.9549),
      ],
    ],
  ),

  // ━━━━ 群馬県 ━━━━
  'gunma': PrefBoundary(
    const GeoPoint(36.5076, 138.9824),
    [
      [
        GeoPoint(36.4115, 138.6443), GeoPoint(36.4347, 138.4009), GeoPoint(36.5961, 138.4274), GeoPoint(36.6515, 138.5252),
        GeoPoint(36.6903, 138.5140), GeoPoint(36.7641, 138.8209), GeoPoint(36.8171, 138.8215), GeoPoint(36.8326, 138.9284),
        GeoPoint(36.8835, 138.9230), GeoPoint(36.8911, 138.9790), GeoPoint(36.9789, 138.9665), GeoPoint(36.9875, 139.0470),
        GeoPoint(37.0588, 139.0970), GeoPoint(36.9302, 139.2415), GeoPoint(36.9109, 139.3934), GeoPoint(36.8527, 139.3487),
        GeoPoint(36.8296, 139.4064), GeoPoint(36.6336, 139.3279), GeoPoint(36.5824, 139.4834), GeoPoint(36.3838, 139.3611),
        GeoPoint(36.2715, 139.4644), GeoPoint(36.2667, 139.6428), GeoPoint(36.1969, 139.6503), GeoPoint(36.1906, 139.4572),
        GeoPoint(36.2532, 139.3595), GeoPoint(36.2834, 139.1293), GeoPoint(36.1296, 139.0428), GeoPoint(35.9853, 138.7127),
        GeoPoint(36.0283, 138.6314), GeoPoint(36.1198, 138.6452), GeoPoint(36.1681, 138.5773), GeoPoint(36.1745, 138.6370),
        GeoPoint(36.2785, 138.6004), GeoPoint(36.3031, 138.6535), GeoPoint(36.4083, 138.6481),
      ],
    ],
  ),

  // ━━━━ 埼玉県 ━━━━
  'saitama': PrefBoundary(
    const GeoPoint(35.9998, 139.3446),
    [
      [
        GeoPoint(36.2834, 139.1293), GeoPoint(36.2297, 139.3235), GeoPoint(36.2532, 139.3595), GeoPoint(36.1906, 139.4572),
        GeoPoint(36.2037, 139.6861), GeoPoint(36.0879, 139.7298), GeoPoint(36.0909, 139.7762), GeoPoint(35.8965, 139.8873),
        GeoPoint(35.7827, 139.8938), GeoPoint(35.8175, 139.7677), GeoPoint(35.7805, 139.7378), GeoPoint(35.8005, 139.6571),
        GeoPoint(35.7667, 139.6218), GeoPoint(35.7786, 139.5887), GeoPoint(35.7537, 139.5479), GeoPoint(35.7738, 139.5478),
        GeoPoint(35.7655, 139.5161), GeoPoint(35.8074, 139.5416), GeoPoint(35.7633, 139.3919), GeoPoint(35.7912, 139.3702),
        GeoPoint(35.7950, 139.3257), GeoPoint(35.8341, 139.3015), GeoPoint(35.8401, 139.1964), GeoPoint(35.8974, 139.0239),
        GeoPoint(35.8399, 138.8929), GeoPoint(35.9039, 138.7348), GeoPoint(35.9853, 138.7127), GeoPoint(36.0346, 138.7550),
        GeoPoint(36.0373, 138.8285), GeoPoint(36.0777, 138.8661), GeoPoint(36.0963, 138.9458), GeoPoint(36.1243, 138.9584),
        GeoPoint(36.1296, 139.0428), GeoPoint(36.2731, 139.1218),
      ],
    ],
  ),

  // ━━━━ 千葉県 ━━━━
  'chiba': PrefBoundary(
    const GeoPoint(35.5165, 140.2009),
    [
      [
        GeoPoint(36.0909, 139.7762), GeoPoint(35.9403, 139.9392), GeoPoint(35.8426, 140.1548), GeoPoint(35.9058, 140.5028),
        GeoPoint(35.9587, 140.5113), GeoPoint(35.7360, 140.8690), GeoPoint(35.6934, 140.8655), GeoPoint(35.6882, 140.6554),
        GeoPoint(35.5475, 140.4689), GeoPoint(35.4187, 140.3972), GeoPoint(35.1810, 140.3775), GeoPoint(35.1155, 140.1218),
        GeoPoint(35.0113, 139.9815), GeoPoint(34.9162, 139.9390), GeoPoint(34.9032, 139.8371), GeoPoint(34.9745, 139.7529),
        GeoPoint(34.9897, 139.8552), GeoPoint(35.0392, 139.8107), GeoPoint(35.1773, 139.8169), GeoPoint(35.2349, 139.8698),
        GeoPoint(35.3150, 139.7805), GeoPoint(35.3747, 139.8454), GeoPoint(35.3583, 139.8969), GeoPoint(35.4320, 139.9052),
        GeoPoint(35.5675, 140.1271), GeoPoint(35.6919, 139.9848), GeoPoint(35.6255, 139.8726), GeoPoint(35.6978, 139.9187),
        GeoPoint(35.8653, 139.9000), GeoPoint(36.0865, 139.7779),
      ],
    ],
  ),

  // ━━━━ 東京都 ━━━━
  'tokyo': PrefBoundary(
    const GeoPoint(35.7154, 139.4342),
    [
      [
        GeoPoint(35.8547, 138.9440), GeoPoint(35.8974, 139.0239), GeoPoint(35.8401, 139.1964), GeoPoint(35.8341, 139.3015),
        GeoPoint(35.7950, 139.3257), GeoPoint(35.7912, 139.3702), GeoPoint(35.7633, 139.3919), GeoPoint(35.8074, 139.5416),
        GeoPoint(35.7655, 139.5161), GeoPoint(35.7738, 139.5478), GeoPoint(35.7537, 139.5479), GeoPoint(35.7786, 139.5887),
        GeoPoint(35.7667, 139.6218), GeoPoint(35.8005, 139.6571), GeoPoint(35.7805, 139.7378), GeoPoint(35.8175, 139.7677),
        GeoPoint(35.7827, 139.8938), GeoPoint(35.7647, 139.8808), GeoPoint(35.6978, 139.9187), GeoPoint(35.6440, 139.8821),
        GeoPoint(35.6406, 139.8065), GeoPoint(35.6219, 139.7986), GeoPoint(35.6375, 139.7788), GeoPoint(35.6498, 139.7956),
        GeoPoint(35.6422, 139.7767), GeoPoint(35.6569, 139.7895), GeoPoint(35.6581, 139.7673), GeoPoint(35.6345, 139.7526),
        GeoPoint(35.5673, 139.7502), GeoPoint(35.5705, 139.7855), GeoPoint(35.5384, 139.8087), GeoPoint(35.5365, 139.7034),
        GeoPoint(35.5889, 139.6653), GeoPoint(35.6427, 139.5254), GeoPoint(35.6048, 139.4968), GeoPoint(35.6118, 139.4493),
        GeoPoint(35.5757, 139.5072), GeoPoint(35.5763, 139.4732), GeoPoint(35.5039, 139.4850), GeoPoint(35.5022, 139.4678),
        GeoPoint(35.5844, 139.3986), GeoPoint(35.6063, 139.2406), GeoPoint(35.6461, 139.2157), GeoPoint(35.7193, 139.0256),
        GeoPoint(35.8493, 138.9483),
      ],
      [
        GeoPoint(34.6786, 139.4388), GeoPoint(34.6833, 139.3967), GeoPoint(34.7017, 139.3595), GeoPoint(34.7089, 139.3611),
        GeoPoint(34.7180, 139.3529), GeoPoint(34.7408, 139.3564), GeoPoint(34.7518, 139.3499), GeoPoint(34.7839, 139.3507),
        GeoPoint(34.7988, 139.3603), GeoPoint(34.7983, 139.3718), GeoPoint(34.7887, 139.3889), GeoPoint(34.7870, 139.4119),
        GeoPoint(34.7703, 139.4345), GeoPoint(34.7385, 139.4484), GeoPoint(34.7153, 139.4496), GeoPoint(34.7039, 139.4435),
        GeoPoint(34.6985, 139.4492), GeoPoint(34.6847, 139.4450), GeoPoint(34.6882, 139.4367), GeoPoint(34.6828, 139.4402),
      ],
      [
        GeoPoint(33.0461, 139.8322), GeoPoint(33.1044, 139.7548), GeoPoint(33.1559, 139.7468), GeoPoint(33.1164, 139.8464),
        GeoPoint(33.0785, 139.8581), GeoPoint(33.0474, 139.8351),
      ],
      [
        GeoPoint(34.0454, 139.5021), GeoPoint(34.0765, 139.4731), GeoPoint(34.1214, 139.4982), GeoPoint(34.1021, 139.5649),
        GeoPoint(34.0685, 139.5624), GeoPoint(34.0470, 139.5087),
      ],
      [
        GeoPoint(34.3299, 139.2725), GeoPoint(34.3476, 139.2447), GeoPoint(34.3623, 139.2426), GeoPoint(34.3999, 139.2554),
        GeoPoint(34.4288, 139.2852), GeoPoint(34.4083, 139.2910), GeoPoint(34.3888, 139.2777), GeoPoint(34.3365, 139.2727),
      ],
      [
        GeoPoint(27.0353, 142.2207), GeoPoint(27.0420, 142.1847), GeoPoint(27.0740, 142.1829), GeoPoint(27.0847, 142.2073),
        GeoPoint(27.1043, 142.1862), GeoPoint(27.0773, 142.2323), GeoPoint(27.0355, 142.2299),
      ],
      [
        GeoPoint(24.7452, 141.2862), GeoPoint(24.7895, 141.2869), GeoPoint(24.8116, 141.3222), GeoPoint(24.7822, 141.3475),
        GeoPoint(24.7469, 141.2901),
      ],
      [
        GeoPoint(33.8520, 139.6208), GeoPoint(33.8625, 139.5778), GeoPoint(33.8968, 139.5905), GeoPoint(33.8876, 139.6218),
        GeoPoint(33.8531, 139.6218),
      ],
    ],
  ),

  // ━━━━ 神奈川県 ━━━━
  'kanagawa': PrefBoundary(
    const GeoPoint(35.4169, 139.3349),
    [
      [
        GeoPoint(35.6718, 139.1310), GeoPoint(35.5844, 139.3986), GeoPoint(35.5022, 139.4678), GeoPoint(35.5757, 139.5072),
        GeoPoint(35.6118, 139.4493), GeoPoint(35.6427, 139.5254), GeoPoint(35.5267, 139.7898), GeoPoint(35.4660, 139.6322),
        GeoPoint(35.4392, 139.6907), GeoPoint(35.3960, 139.6221), GeoPoint(35.3727, 139.6565), GeoPoint(35.2951, 139.6340),
        GeoPoint(35.2532, 139.7466), GeoPoint(35.1850, 139.6565), GeoPoint(35.1393, 139.6780), GeoPoint(35.1365, 139.6308),
        GeoPoint(35.2155, 139.6275), GeoPoint(35.3081, 139.5449), GeoPoint(35.3121, 139.3301), GeoPoint(35.2407, 139.1477),
        GeoPoint(35.1410, 139.1610), GeoPoint(35.1506, 139.0287), GeoPoint(35.2356, 138.9760), GeoPoint(35.3988, 139.0017),
        GeoPoint(35.4100, 138.9174), GeoPoint(35.5323, 139.1088), GeoPoint(35.6699, 139.1304),
      ],
    ],
  ),

  // ━━━━ 新潟県 ━━━━
  'niigata': PrefBoundary(
    const GeoPoint(37.4847, 138.9561),
    [
      [
        GeoPoint(38.5534, 139.5482), GeoPoint(38.4966, 139.7219), GeoPoint(38.3919, 139.7061), GeoPoint(38.2761, 139.9001),
        GeoPoint(38.1699, 139.6826), GeoPoint(37.9187, 139.6249), GeoPoint(37.8179, 139.7415), GeoPoint(37.6488, 139.5494),
        GeoPoint(37.5131, 139.5852), GeoPoint(37.4109, 139.1972), GeoPoint(36.9415, 139.2410), GeoPoint(37.0588, 139.0970),
        GeoPoint(36.8326, 138.9284), GeoPoint(36.7369, 138.7026), GeoPoint(37.0222, 138.5625), GeoPoint(36.8001, 138.0528),
        GeoPoint(36.9039, 138.0137), GeoPoint(36.9161, 137.8688), GeoPoint(36.7664, 137.7625), GeoPoint(36.9803, 137.6349),
        GeoPoint(37.3783, 138.5540), GeoPoint(37.8142, 138.8402), GeoPoint(38.1060, 139.3718), GeoPoint(38.5480, 139.5500),
      ],
      [
        GeoPoint(37.8027, 138.2449), GeoPoint(37.8281, 138.2060), GeoPoint(37.9645, 138.3431), GeoPoint(38.0070, 138.3014),
        GeoPoint(37.9795, 138.2286), GeoPoint(38.0875, 138.2423), GeoPoint(38.3313, 138.4855), GeoPoint(38.3256, 138.5211),
        GeoPoint(38.2517, 138.5062), GeoPoint(38.0865, 138.4349), GeoPoint(38.0635, 138.5735), GeoPoint(37.9207, 138.5002),
        GeoPoint(37.8030, 138.2468),
      ],
    ],
  ),

  // ━━━━ 富山県 ━━━━
  'toyama': PrefBoundary(
    const GeoPoint(36.6394, 137.2650),
    [
      [
        GeoPoint(36.9803, 137.6349), GeoPoint(36.9446, 137.7110), GeoPoint(36.7664, 137.7625), GeoPoint(36.5896, 137.7509),
        GeoPoint(36.5628, 137.6887), GeoPoint(36.5185, 137.7053), GeoPoint(36.4257, 137.6334), GeoPoint(36.3881, 137.5606),
        GeoPoint(36.4597, 137.3902), GeoPoint(36.4251, 137.3135), GeoPoint(36.4639, 137.3085), GeoPoint(36.4567, 137.1607),
        GeoPoint(36.2745, 136.9751), GeoPoint(36.3461, 136.9467), GeoPoint(36.3675, 136.8713), GeoPoint(36.2991, 136.7921),
        GeoPoint(36.4234, 136.7688), GeoPoint(36.5521, 136.8169), GeoPoint(36.7185, 136.7891), GeoPoint(36.7578, 136.8473),
        GeoPoint(36.9167, 136.8872), GeoPoint(36.9673, 137.0373), GeoPoint(36.8728, 136.9837), GeoPoint(36.7706, 137.0920),
        GeoPoint(36.7587, 137.3170), GeoPoint(36.8066, 137.3922), GeoPoint(36.9245, 137.4266), GeoPoint(36.9785, 137.6218),
      ],
    ],
  ),

  // ━━━━ 石川県 ━━━━
  'ishikawa': PrefBoundary(
    const GeoPoint(36.7673, 136.7678),
    [
      [
        GeoPoint(37.4663, 137.0857), GeoPoint(37.5335, 137.2768), GeoPoint(37.5157, 137.3449), GeoPoint(37.4518, 137.3605),
        GeoPoint(37.4318, 137.2568), GeoPoint(37.2980, 137.2344), GeoPoint(37.3069, 137.1509), GeoPoint(37.1835, 137.0105),
        GeoPoint(37.2335, 136.9249), GeoPoint(37.1447, 136.8728), GeoPoint(37.0727, 136.8585), GeoPoint(37.0477, 136.9709),
        GeoPoint(37.1081, 137.0574), GeoPoint(36.9681, 137.0565), GeoPoint(36.9249, 136.8954), GeoPoint(36.7578, 136.8473),
        GeoPoint(36.7185, 136.7891), GeoPoint(36.5521, 136.8169), GeoPoint(36.4234, 136.7688), GeoPoint(36.2991, 136.7921),
        GeoPoint(36.2484, 136.8515), GeoPoint(36.0864, 136.7540), GeoPoint(36.0676, 136.6637), GeoPoint(36.1550, 136.5516),
        GeoPoint(36.1655, 136.3595), GeoPoint(36.2956, 136.2437), GeoPoint(36.5865, 136.5745), GeoPoint(36.8365, 136.7474),
        GeoPoint(37.0016, 136.7674), GeoPoint(37.1339, 136.7270), GeoPoint(37.1491, 136.6701), GeoPoint(37.3480, 136.7378),
        GeoPoint(37.4635, 137.0810),
      ],
      [
        GeoPoint(37.0915, 136.9464), GeoPoint(37.1520, 136.9013), GeoPoint(37.1639, 137.0443), GeoPoint(37.1234, 137.0498),
        GeoPoint(37.0971, 136.9508),
      ],
    ],
  ),

  // ━━━━ 福井県 ━━━━
  'fukui': PrefBoundary(
    const GeoPoint(35.8503, 136.2248),
    [
      [
        GeoPoint(36.2956, 136.2437), GeoPoint(36.1655, 136.3595), GeoPoint(36.1550, 136.5516), GeoPoint(36.0676, 136.6637),
        GeoPoint(36.0864, 136.7540), GeoPoint(35.9959, 136.7264), GeoPoint(35.8581, 136.8320), GeoPoint(35.7995, 136.7891),
        GeoPoint(35.7883, 136.5233), GeoPoint(35.7504, 136.5057), GeoPoint(35.7952, 136.3775), GeoPoint(35.6587, 136.2806),
        GeoPoint(35.6978, 136.1500), GeoPoint(35.5655, 136.1685), GeoPoint(35.5829, 136.1133), GeoPoint(35.5288, 136.1051),
        GeoPoint(35.4916, 136.0059), GeoPoint(35.5204, 135.9398), GeoPoint(35.4038, 135.8904), GeoPoint(35.4131, 135.8151),
        GeoPoint(35.3437, 135.7007), GeoPoint(35.3797, 135.5285), GeoPoint(35.4675, 135.4591), GeoPoint(35.5509, 135.4646),
        GeoPoint(35.5499, 135.5177), GeoPoint(35.4889, 135.5342), GeoPoint(35.5476, 135.6609), GeoPoint(35.4899, 135.5807),
        GeoPoint(35.4843, 135.7181), GeoPoint(35.5361, 135.7639), GeoPoint(35.5202, 135.7183), GeoPoint(35.5690, 135.7132),
        GeoPoint(35.5363, 135.8336), GeoPoint(35.5713, 135.8011), GeoPoint(35.5917, 135.8557), GeoPoint(35.6423, 135.8143),
        GeoPoint(35.6299, 135.9801), GeoPoint(35.7205, 135.9539), GeoPoint(35.7639, 136.0169), GeoPoint(35.6806, 136.0250),
        GeoPoint(35.6625, 136.0737), GeoPoint(35.7771, 136.1000), GeoPoint(35.9816, 135.9575), GeoPoint(36.1919, 136.1293),
        GeoPoint(36.2493, 136.1232), GeoPoint(36.2879, 136.2353),
      ],
    ],
  ),

  // ━━━━ 山梨県 ━━━━
  'yamanashi': PrefBoundary(
    const GeoPoint(35.6155, 138.6084),
    [
      [
        GeoPoint(35.9715, 138.3703), GeoPoint(35.8967, 138.4711), GeoPoint(35.9196, 138.5906), GeoPoint(35.8699, 138.6761),
        GeoPoint(35.9093, 138.7288), GeoPoint(35.8547, 138.9440), GeoPoint(35.7193, 139.0256), GeoPoint(35.6742, 139.1295),
        GeoPoint(35.5637, 139.1291), GeoPoint(35.3815, 138.8732), GeoPoint(35.3577, 138.6804), GeoPoint(35.4341, 138.5589),
        GeoPoint(35.3141, 138.5125), GeoPoint(35.2015, 138.5329), GeoPoint(35.1819, 138.4292), GeoPoint(35.3117, 138.3654),
        GeoPoint(35.3315, 138.2488), GeoPoint(35.5157, 138.2680), GeoPoint(35.7128, 138.1803), GeoPoint(35.7575, 138.2356),
        GeoPoint(35.7949, 138.1855), GeoPoint(35.8822, 138.2379), GeoPoint(35.8595, 138.2835), GeoPoint(35.9709, 138.3701),
      ],
    ],
  ),

  // ━━━━ 長野県 ━━━━
  'nagano': PrefBoundary(
    const GeoPoint(36.1364, 138.0431),
    [
      [
        GeoPoint(37.0305, 138.5246), GeoPoint(36.9874, 138.5864), GeoPoint(36.9141, 138.5895), GeoPoint(36.8572, 138.6909),
        GeoPoint(36.7386, 138.6957), GeoPoint(36.6333, 138.4580), GeoPoint(36.4347, 138.4009), GeoPoint(36.4083, 138.6481),
        GeoPoint(36.3031, 138.6535), GeoPoint(36.2785, 138.6004), GeoPoint(36.1745, 138.6370), GeoPoint(36.1681, 138.5773),
        GeoPoint(36.1198, 138.6452), GeoPoint(36.0283, 138.6314), GeoPoint(35.9269, 138.7371), GeoPoint(35.8703, 138.6218),
        GeoPoint(35.9196, 138.5906), GeoPoint(35.9003, 138.4544), GeoPoint(35.9715, 138.3703), GeoPoint(35.8595, 138.2835),
        GeoPoint(35.8822, 138.2379), GeoPoint(35.7949, 138.1855), GeoPoint(35.7575, 138.2356), GeoPoint(35.7128, 138.1803),
        GeoPoint(35.6445, 138.2186), GeoPoint(35.4547, 138.1204), GeoPoint(35.3707, 138.1419), GeoPoint(35.2188, 137.8718),
        GeoPoint(35.1993, 137.5774), GeoPoint(35.2532, 137.5459), GeoPoint(35.3365, 137.6040), GeoPoint(35.4000, 137.5750),
        GeoPoint(35.4017, 137.6348), GeoPoint(35.4467, 137.5933), GeoPoint(35.5091, 137.6317), GeoPoint(35.6071, 137.5145),
        GeoPoint(35.6499, 137.5450), GeoPoint(35.7553, 137.4645), GeoPoint(35.8375, 137.3311), GeoPoint(35.8919, 137.3802),
        GeoPoint(35.8940, 137.4761), GeoPoint(36.0134, 137.5946), GeoPoint(36.0762, 137.6137), GeoPoint(36.1403, 137.5546),
        GeoPoint(36.3045, 137.6528), GeoPoint(36.3899, 137.5873), GeoPoint(36.5896, 137.7509), GeoPoint(36.7527, 137.7518),
        GeoPoint(36.8672, 137.8764), GeoPoint(36.9148, 137.8654), GeoPoint(36.9039, 138.0137), GeoPoint(36.8267, 138.0033),
        GeoPoint(36.8001, 138.0528), GeoPoint(36.8703, 138.2136), GeoPoint(36.8474, 138.2889), GeoPoint(36.9973, 138.3947),
        GeoPoint(37.0284, 138.5201),
      ],
    ],
  ),

  // ━━━━ 岐阜県 ━━━━
  'gifu': PrefBoundary(
    const GeoPoint(35.7809, 137.0537),
    [
      [
        GeoPoint(36.3721, 137.0582), GeoPoint(36.4567, 137.1607), GeoPoint(36.4639, 137.3085), GeoPoint(36.4251, 137.3135),
        GeoPoint(36.4597, 137.3902), GeoPoint(36.3414, 137.6455), GeoPoint(36.1403, 137.5546), GeoPoint(36.0762, 137.6137),
        GeoPoint(36.0134, 137.5946), GeoPoint(35.8157, 137.3255), GeoPoint(35.7613, 137.4589), GeoPoint(35.6499, 137.5450),
        GeoPoint(35.6071, 137.5145), GeoPoint(35.5091, 137.6317), GeoPoint(35.4467, 137.5933), GeoPoint(35.4017, 137.6348),
        GeoPoint(35.4000, 137.5750), GeoPoint(35.3365, 137.6040), GeoPoint(35.2839, 137.5615), GeoPoint(35.2228, 137.4297),
        GeoPoint(35.2911, 137.3078), GeoPoint(35.2532, 137.1858), GeoPoint(35.2921, 137.0817), GeoPoint(35.4222, 136.9714),
        GeoPoint(35.3687, 136.7703), GeoPoint(35.2410, 136.6777), GeoPoint(35.1336, 136.6694), GeoPoint(35.2569, 136.5337),
        GeoPoint(35.2427, 136.3781), GeoPoint(35.3895, 136.4441), GeoPoint(35.5299, 136.4002), GeoPoint(35.5469, 136.3178),
        GeoPoint(35.6533, 136.2759), GeoPoint(35.7952, 136.3775), GeoPoint(35.7504, 136.5057), GeoPoint(35.7883, 136.5233),
        GeoPoint(35.7995, 136.7891), GeoPoint(35.8962, 136.8221), GeoPoint(35.9959, 136.7264), GeoPoint(36.1611, 136.7657),
        GeoPoint(36.2484, 136.8515), GeoPoint(36.2991, 136.7921), GeoPoint(36.3675, 136.8713), GeoPoint(36.3461, 136.9467),
        GeoPoint(36.2745, 136.9751), GeoPoint(36.3690, 137.0584),
      ],
    ],
  ),

  // ━━━━ 静岡県 ━━━━
  'shizuoka': PrefBoundary(
    const GeoPoint(35.0201, 138.3274),
    [
      [
        GeoPoint(35.6445, 138.2186), GeoPoint(35.3315, 138.2488), GeoPoint(35.1779, 138.4404), GeoPoint(35.2015, 138.5329),
        GeoPoint(35.4457, 138.5819), GeoPoint(35.3577, 138.6804), GeoPoint(35.3988, 139.0017), GeoPoint(35.2356, 138.9760),
        GeoPoint(35.1413, 139.1115), GeoPoint(34.9361, 139.1479), GeoPoint(34.6579, 138.9872), GeoPoint(34.6011, 138.8436),
        GeoPoint(34.6899, 138.7392), GeoPoint(35.0174, 138.7797), GeoPoint(35.0479, 138.9063), GeoPoint(35.1451, 138.6850),
        GeoPoint(34.9151, 138.3573), GeoPoint(34.5946, 138.2267), GeoPoint(34.6738, 137.4839), GeoPoint(34.8114, 137.4868),
        GeoPoint(34.8921, 137.6398), GeoPoint(35.2114, 137.8278), GeoPoint(35.3707, 138.1419), GeoPoint(35.6359, 138.2118),
      ],
    ],
  ),

  // ━━━━ 愛知県 ━━━━
  'aichi': PrefBoundary(
    const GeoPoint(35.0376, 137.2109),
    [
      [
        GeoPoint(35.4145, 136.9609), GeoPoint(35.2532, 137.1858), GeoPoint(35.2911, 137.3078), GeoPoint(35.2228, 137.4297),
        GeoPoint(35.2896, 137.5673), GeoPoint(35.1984, 137.5785), GeoPoint(35.2125, 137.8380), GeoPoint(34.8921, 137.6398),
        GeoPoint(34.8114, 137.4868), GeoPoint(34.6738, 137.4839), GeoPoint(34.5783, 137.0175), GeoPoint(34.6623, 137.0740),
        GeoPoint(34.6348, 137.1185), GeoPoint(34.7309, 137.2847), GeoPoint(34.6784, 137.3069), GeoPoint(34.7274, 137.3515),
        GeoPoint(34.8105, 137.2979), GeoPoint(34.8229, 137.2161), GeoPoint(34.7652, 137.1705), GeoPoint(34.8234, 136.9509),
        GeoPoint(34.9592, 136.9826), GeoPoint(34.7709, 136.9143), GeoPoint(34.6956, 136.9720), GeoPoint(34.7639, 136.8398),
        GeoPoint(34.8365, 136.8663), GeoPoint(34.9662, 136.8202), GeoPoint(35.0841, 136.8963), GeoPoint(35.0214, 136.7704),
        GeoPoint(35.1347, 136.6725), GeoPoint(35.2410, 136.6777), GeoPoint(35.3687, 136.7703), GeoPoint(35.4101, 136.9622),
      ],
    ],
  ),

  // ━━━━ 三重県 ━━━━
  'mie': PrefBoundary(
    const GeoPoint(34.5184, 136.3778),
    [
      [
        GeoPoint(35.2575, 136.5275), GeoPoint(35.0243, 136.7725), GeoPoint(34.9931, 136.6514), GeoPoint(34.9369, 136.6666),
        GeoPoint(34.7532, 136.5337), GeoPoint(34.6109, 136.5279), GeoPoint(34.5061, 136.8309), GeoPoint(34.4286, 136.8756),
        GeoPoint(34.4450, 136.9233), GeoPoint(34.3759, 136.9125), GeoPoint(34.3676, 136.8133), GeoPoint(34.3653, 136.9082),
        GeoPoint(34.2761, 136.8998), GeoPoint(34.2604, 136.7660), GeoPoint(34.2653, 136.8589), GeoPoint(34.3133, 136.8478),
        GeoPoint(34.2840, 136.6900), GeoPoint(34.3422, 136.7270), GeoPoint(34.3453, 136.6598), GeoPoint(34.2583, 136.6048),
        GeoPoint(34.2946, 136.5907), GeoPoint(34.2500, 136.5483), GeoPoint(34.2777, 136.5041), GeoPoint(34.2296, 136.5083),
        GeoPoint(34.2567, 136.4662), GeoPoint(34.1959, 136.3219), GeoPoint(34.1616, 136.2783), GeoPoint(34.0865, 136.2975),
        GeoPoint(34.0947, 136.2492), GeoPoint(34.1288, 136.2684), GeoPoint(34.0769, 136.2019), GeoPoint(34.0196, 136.2821),
        GeoPoint(34.0146, 136.2428), GeoPoint(33.9731, 136.2715), GeoPoint(33.9996, 136.2108), GeoPoint(33.9474, 136.2315),
        GeoPoint(33.8721, 136.0879), GeoPoint(33.7235, 136.0113), GeoPoint(33.7351, 135.9412), GeoPoint(33.8610, 135.8531),
        GeoPoint(33.9662, 136.0110), GeoPoint(34.0359, 136.0186), GeoPoint(34.0255, 136.1033), GeoPoint(34.2517, 136.1311),
        GeoPoint(34.3010, 136.0947), GeoPoint(34.3159, 136.1292), GeoPoint(34.3935, 136.0687), GeoPoint(34.4941, 136.2290),
        GeoPoint(34.5801, 136.0495), GeoPoint(34.6633, 136.0403), GeoPoint(34.6763, 136.0855), GeoPoint(34.7892, 136.0203),
        GeoPoint(34.8139, 136.0903), GeoPoint(34.9019, 136.1106), GeoPoint(34.8578, 136.2503), GeoPoint(34.9049, 136.3656),
        GeoPoint(35.0651, 136.4412), GeoPoint(35.2177, 136.4149), GeoPoint(35.2543, 136.5189),
      ],
    ],
  ),

  // ━━━━ 滋賀県 ━━━━
  'shiga': PrefBoundary(
    const GeoPoint(35.2189, 136.1349),
    [
      [
        GeoPoint(35.6978, 136.1500), GeoPoint(35.6163, 136.3233), GeoPoint(35.5469, 136.3178), GeoPoint(35.5299, 136.4002),
        GeoPoint(35.3895, 136.4441), GeoPoint(35.2427, 136.3781), GeoPoint(35.1616, 136.4543), GeoPoint(35.0651, 136.4412),
        GeoPoint(34.9049, 136.3656), GeoPoint(34.8578, 136.2503), GeoPoint(34.9019, 136.1106), GeoPoint(34.8139, 136.0903),
        GeoPoint(34.7907, 136.0263), GeoPoint(34.8932, 135.9405), GeoPoint(34.8764, 135.8850), GeoPoint(35.0461, 135.8150),
        GeoPoint(35.2830, 135.8604), GeoPoint(35.3445, 135.7637), GeoPoint(35.4131, 135.8151), GeoPoint(35.4038, 135.8904),
        GeoPoint(35.5204, 135.9398), GeoPoint(35.4916, 136.0059), GeoPoint(35.5288, 136.1051), GeoPoint(35.5829, 136.1133),
        GeoPoint(35.5655, 136.1685), GeoPoint(35.6942, 136.1498),
      ],
    ],
  ),

  // ━━━━ 京都府 ━━━━
  'kyoto': PrefBoundary(
    const GeoPoint(35.2556, 135.4413),
    [
      [
        GeoPoint(35.5373, 135.0367), GeoPoint(35.5125, 134.9265), GeoPoint(35.5881, 134.8542), GeoPoint(35.6581, 134.8671),
        GeoPoint(35.7792, 135.2230), GeoPoint(35.6944, 135.3080), GeoPoint(35.5383, 135.1931), GeoPoint(35.5989, 135.2547),
        GeoPoint(35.5359, 135.2442), GeoPoint(35.5170, 135.3303), GeoPoint(35.4512, 135.3163), GeoPoint(35.4788, 135.3975),
        GeoPoint(35.5518, 135.3423), GeoPoint(35.6035, 135.4619), GeoPoint(35.4675, 135.4591), GeoPoint(35.3797, 135.5285),
        GeoPoint(35.3561, 135.7684), GeoPoint(35.2891, 135.8581), GeoPoint(34.9911, 135.8268), GeoPoint(34.9475, 135.8782),
        GeoPoint(34.8923, 135.8664), GeoPoint(34.8427, 136.0050), GeoPoint(34.7384, 136.0552), GeoPoint(34.7275, 135.7551),
        GeoPoint(34.8987, 135.6749), GeoPoint(34.9280, 135.5999), GeoPoint(34.9713, 135.6129), GeoPoint(34.9153, 135.5418),
        GeoPoint(34.9919, 135.4874), GeoPoint(35.0101, 135.3821), GeoPoint(35.1288, 135.3894), GeoPoint(35.1718, 135.1869),
        GeoPoint(35.2599, 135.1583), GeoPoint(35.2372, 135.0675), GeoPoint(35.3112, 134.9256), GeoPoint(35.4074, 134.9338),
        GeoPoint(35.4074, 135.0483), GeoPoint(35.5301, 135.0362),
      ],
    ],
  ),

  // ━━━━ 大阪府 ━━━━
  'osaka': PrefBoundary(
    const GeoPoint(34.6263, 135.5085),
    [
      [
        GeoPoint(35.0453, 135.3708), GeoPoint(35.0101, 135.3821), GeoPoint(34.9893, 135.4914), GeoPoint(34.9495, 135.4810),
        GeoPoint(34.9153, 135.5418), GeoPoint(34.9236, 135.5807), GeoPoint(34.9381, 135.5568), GeoPoint(34.9717, 135.5733),
        GeoPoint(34.9713, 135.6129), GeoPoint(34.9280, 135.5999), GeoPoint(34.9298, 135.6428), GeoPoint(34.8043, 135.7447),
        GeoPoint(34.7813, 135.7110), GeoPoint(34.6087, 135.6503), GeoPoint(34.5849, 135.6815), GeoPoint(34.5449, 135.6505),
        GeoPoint(34.5246, 135.6766), GeoPoint(34.4083, 135.6799), GeoPoint(34.3365, 135.5077), GeoPoint(34.3627, 135.4850),
        GeoPoint(34.3351, 135.3382), GeoPoint(34.2993, 135.2931), GeoPoint(34.3178, 135.2822), GeoPoint(34.3081, 135.2076),
        GeoPoint(34.2794, 135.1844), GeoPoint(34.2720, 135.1112), GeoPoint(34.3146, 135.0933), GeoPoint(34.3449, 135.2182),
        GeoPoint(34.4508, 135.3531), GeoPoint(34.5320, 135.3783), GeoPoint(34.5055, 135.3901), GeoPoint(34.5512, 135.4439),
        GeoPoint(34.5608, 135.4105), GeoPoint(34.5999, 135.4020), GeoPoint(34.5696, 135.4209), GeoPoint(34.5897, 135.4261),
        GeoPoint(34.5649, 135.4525), GeoPoint(34.5846, 135.4664), GeoPoint(34.5934, 135.4255), GeoPoint(34.6453, 135.4508),
        GeoPoint(34.6516, 135.4143), GeoPoint(34.6932, 135.4239), GeoPoint(34.6932, 135.4028), GeoPoint(34.7332, 135.4599),
        GeoPoint(34.8195, 135.4157), GeoPoint(34.8985, 135.4446), GeoPoint(34.9088, 135.4182), GeoPoint(34.9287, 135.4668),
        GeoPoint(34.9653, 135.3456), GeoPoint(35.0241, 135.3542), GeoPoint(35.0345, 135.3304), GeoPoint(35.0445, 135.3662),
      ],
      [
        GeoPoint(34.4460, 135.2294), GeoPoint(34.4377, 135.2646), GeoPoint(34.4171, 135.2347), GeoPoint(34.4283, 135.2013),
        GeoPoint(34.4383, 135.2180),
      ],
    ],
  ),

  // ━━━━ 兵庫県 ━━━━
  'hyogo': PrefBoundary(
    const GeoPoint(35.0942, 134.8242),
    [
      [
        GeoPoint(35.6581, 134.8671), GeoPoint(35.5881, 134.8542), GeoPoint(35.5125, 134.9265), GeoPoint(35.5085, 135.0447),
        GeoPoint(35.4074, 135.0483), GeoPoint(35.4074, 134.9338), GeoPoint(35.3112, 134.9256), GeoPoint(35.2372, 135.0675),
        GeoPoint(35.2599, 135.1583), GeoPoint(35.1718, 135.1869), GeoPoint(35.1288, 135.3894), GeoPoint(35.0761, 135.3992),
        GeoPoint(35.0345, 135.3304), GeoPoint(34.9653, 135.3456), GeoPoint(34.9287, 135.4668), GeoPoint(34.9088, 135.4182),
        GeoPoint(34.7332, 135.4599), GeoPoint(34.6800, 135.3922), GeoPoint(34.7259, 135.3225), GeoPoint(34.6255, 135.0596),
        GeoPoint(34.7885, 134.6554), GeoPoint(34.7552, 134.4739), GeoPoint(34.8085, 134.4658), GeoPoint(34.7278, 134.4105),
        GeoPoint(34.7218, 134.3213), GeoPoint(34.8016, 134.3165), GeoPoint(34.8513, 134.2531), GeoPoint(34.9075, 134.2944),
        GeoPoint(35.0157, 134.2641), GeoPoint(35.1479, 134.4082), GeoPoint(35.2236, 134.3849), GeoPoint(35.2773, 134.5146),
        GeoPoint(35.6146, 134.3695), GeoPoint(35.6699, 134.5369), GeoPoint(35.6589, 134.8646),
      ],
      [
        GeoPoint(34.4272, 134.7871), GeoPoint(34.6090, 135.0024), GeoPoint(34.5763, 135.0254), GeoPoint(34.4181, 134.8947),
        GeoPoint(34.2671, 134.9519), GeoPoint(34.1889, 134.7293), GeoPoint(34.2549, 134.7214), GeoPoint(34.2413, 134.6577),
        GeoPoint(34.2943, 134.6543), GeoPoint(34.4199, 134.7844),
      ],
    ],
  ),

  // ━━━━ 奈良県 ━━━━
  'nara': PrefBoundary(
    const GeoPoint(34.3191, 135.8683),
    [
      [
        GeoPoint(34.7813, 135.7116), GeoPoint(34.7059, 135.8486), GeoPoint(34.7575, 135.9254), GeoPoint(34.7077, 136.0140),
        GeoPoint(34.7384, 136.0552), GeoPoint(34.6763, 136.0855), GeoPoint(34.6633, 136.0403), GeoPoint(34.5801, 136.0495),
        GeoPoint(34.4941, 136.2290), GeoPoint(34.3935, 136.0687), GeoPoint(34.3159, 136.1292), GeoPoint(34.3010, 136.0947),
        GeoPoint(34.2517, 136.1311), GeoPoint(34.0255, 136.1033), GeoPoint(33.9811, 135.9268), GeoPoint(33.8588, 135.8718),
        GeoPoint(33.9065, 135.8082), GeoPoint(33.8719, 135.6183), GeoPoint(33.9908, 135.6356), GeoPoint(34.0750, 135.5396),
        GeoPoint(34.2187, 135.6475), GeoPoint(34.2283, 135.7297), GeoPoint(34.3832, 135.6507), GeoPoint(34.4509, 135.6864),
        GeoPoint(34.6087, 135.6503), GeoPoint(34.7813, 135.7110),
      ],
    ],
  ),

  // ━━━━ 和歌山県 ━━━━
  'wakayama': PrefBoundary(
    const GeoPoint(33.9134, 135.5038),
    [
      [
        GeoPoint(34.3513, 135.5287), GeoPoint(34.3832, 135.6507), GeoPoint(34.2338, 135.7290), GeoPoint(34.2187, 135.6475),
        GeoPoint(34.0978, 135.5459), GeoPoint(33.9908, 135.6356), GeoPoint(33.8719, 135.6183), GeoPoint(33.8956, 135.8479),
        GeoPoint(33.8180, 135.8563), GeoPoint(33.7235, 136.0113), GeoPoint(33.6402, 135.9358), GeoPoint(33.5806, 135.9576),
        GeoPoint(33.4989, 135.7982), GeoPoint(33.4378, 135.7873), GeoPoint(33.4841, 135.7594), GeoPoint(33.5491, 135.4463),
        GeoPoint(33.6701, 135.3300), GeoPoint(33.7203, 135.3998), GeoPoint(33.7813, 135.2344), GeoPoint(33.8834, 135.1438),
        GeoPoint(33.8797, 135.0572), GeoPoint(33.9597, 135.1146), GeoPoint(33.9761, 135.0675), GeoPoint(34.0319, 135.1734),
        GeoPoint(34.0734, 135.0789), GeoPoint(34.1518, 135.2089), GeoPoint(34.2635, 135.0611), GeoPoint(34.3041, 135.0735),
        GeoPoint(34.2742, 135.1531), GeoPoint(34.3477, 135.5227),
      ],
      [
        GeoPoint(33.9725, 135.9153), GeoPoint(34.0097, 136.0032), GeoPoint(33.9737, 136.0129), GeoPoint(33.9143, 135.9215),
        GeoPoint(33.9701, 135.9150),
      ],
    ],
  ),

  // ━━━━ 鳥取県 ━━━━
  'tottori': PrefBoundary(
    const GeoPoint(35.3630, 133.8495),
    [
      [
        GeoPoint(35.6146, 134.3695), GeoPoint(35.3539, 134.5133), GeoPoint(35.2773, 134.5146), GeoPoint(35.2367, 134.4624),
        GeoPoint(35.1699, 134.1718), GeoPoint(35.2790, 134.1387), GeoPoint(35.3076, 134.0101), GeoPoint(35.3504, 134.0142),
        GeoPoint(35.2489, 133.8308), GeoPoint(35.3193, 133.7451), GeoPoint(35.3451, 133.5957), GeoPoint(35.2464, 133.5592),
        GeoPoint(35.2286, 133.5053), GeoPoint(35.1829, 133.5256), GeoPoint(35.1809, 133.3965), GeoPoint(35.1143, 133.4029),
        GeoPoint(35.0578, 133.2684), GeoPoint(35.0743, 133.1357), GeoPoint(35.1699, 133.1944), GeoPoint(35.2191, 133.1528),
        GeoPoint(35.2685, 133.3099), GeoPoint(35.4069, 133.3205), GeoPoint(35.4815, 133.2215), GeoPoint(35.5461, 133.2175),
        GeoPoint(35.4535, 133.3932), GeoPoint(35.5303, 133.5670), GeoPoint(35.5216, 134.0777), GeoPoint(35.6042, 134.3690),
      ],
    ],
  ),

  // ━━━━ 島根県 ━━━━
  'shimane': PrefBoundary(
    const GeoPoint(35.0150, 132.5247),
    [
      [
        GeoPoint(35.5491, 133.2441), GeoPoint(35.5264, 133.1979), GeoPoint(35.4069, 133.3205), GeoPoint(35.2685, 133.3099),
        GeoPoint(35.2191, 133.1528), GeoPoint(35.1699, 133.1944), GeoPoint(35.0757, 133.1396), GeoPoint(35.1018, 132.8718),
        GeoPoint(34.9049, 132.6333), GeoPoint(34.8429, 132.6972), GeoPoint(34.7949, 132.5374), GeoPoint(34.8206, 132.4346),
        GeoPoint(34.7794, 132.3960), GeoPoint(34.8059, 132.2410), GeoPoint(34.7080, 132.1300), GeoPoint(34.6833, 132.1612),
        GeoPoint(34.5825, 132.1251), GeoPoint(34.5215, 132.0473), GeoPoint(34.4675, 132.0679), GeoPoint(34.4279, 131.9968),
        GeoPoint(34.3717, 132.0126), GeoPoint(34.3064, 131.9578), GeoPoint(34.3377, 131.9190), GeoPoint(34.3026, 131.8192),
        GeoPoint(34.3649, 131.7654), GeoPoint(34.4362, 131.7931), GeoPoint(34.4351, 131.6976), GeoPoint(34.5041, 131.6672),
        GeoPoint(34.5783, 131.7260), GeoPoint(34.6810, 131.6899), GeoPoint(34.7087, 131.8441), GeoPoint(34.9530, 132.1119),
        GeoPoint(35.0566, 132.3085), GeoPoint(35.1903, 132.4168), GeoPoint(35.2873, 132.6260), GeoPoint(35.3749, 132.6738),
        GeoPoint(35.4352, 132.6287), GeoPoint(35.5148, 132.9655), GeoPoint(35.6037, 133.0889), GeoPoint(35.5595, 133.1512),
        GeoPoint(35.5757, 133.3063), GeoPoint(35.5505, 133.2448),
      ],
      [
        GeoPoint(36.1610, 133.2480), GeoPoint(36.2881, 133.1800), GeoPoint(36.3484, 133.2755), GeoPoint(36.2687, 133.3853),
        GeoPoint(36.1615, 133.2503),
      ],
      [
        GeoPoint(36.0389, 132.9979), GeoPoint(36.0800, 132.9456), GeoPoint(36.1391, 133.0912), GeoPoint(36.0605, 133.0431),
        GeoPoint(36.0891, 132.9792), GeoPoint(36.0439, 132.9996),
      ],
      [
        GeoPoint(36.0351, 133.0677), GeoPoint(36.1143, 133.0814), GeoPoint(36.0962, 133.0875), GeoPoint(36.1174, 133.0931),
        GeoPoint(36.1114, 133.1318), GeoPoint(36.0844, 133.1170), GeoPoint(36.0753, 133.1519), GeoPoint(36.0723, 133.0963),
        GeoPoint(36.0509, 133.1027), GeoPoint(36.0365, 133.0724),
      ],
    ],
  ),

  // ━━━━ 岡山県 ━━━━
  'okayama': PrefBoundary(
    const GeoPoint(34.9061, 133.8119),
    [
      [
        GeoPoint(35.3504, 134.0142), GeoPoint(35.3076, 134.0101), GeoPoint(35.2790, 134.1387), GeoPoint(35.1719, 134.1669),
        GeoPoint(35.2526, 134.3930), GeoPoint(35.1567, 134.4120), GeoPoint(35.0157, 134.2641), GeoPoint(34.9075, 134.2944),
        GeoPoint(34.8513, 134.2531), GeoPoint(34.8016, 134.3165), GeoPoint(34.7218, 134.3213), GeoPoint(34.7423, 134.1853),
        GeoPoint(34.7015, 134.2446), GeoPoint(34.5891, 134.1200), GeoPoint(34.5989, 133.9455), GeoPoint(34.5767, 134.0464),
        GeoPoint(34.5123, 134.0030), GeoPoint(34.5243, 133.9594), GeoPoint(34.4559, 133.9428), GeoPoint(34.4744, 133.8342),
        GeoPoint(34.4356, 133.7873), GeoPoint(34.5250, 133.7383), GeoPoint(34.4705, 133.7428), GeoPoint(34.4779, 133.7034),
        GeoPoint(34.5403, 133.6908), GeoPoint(34.4615, 133.5404), GeoPoint(34.5139, 133.4854), GeoPoint(34.4547, 133.5269),
        GeoPoint(34.4414, 133.4738), GeoPoint(34.6215, 133.3829), GeoPoint(34.8051, 133.3778), GeoPoint(34.8895, 133.2972),
        GeoPoint(35.0061, 133.3212), GeoPoint(35.0519, 133.2667), GeoPoint(35.0995, 133.2902), GeoPoint(35.1225, 133.4113),
        GeoPoint(35.1809, 133.3965), GeoPoint(35.1829, 133.5256), GeoPoint(35.2286, 133.5053), GeoPoint(35.2464, 133.5592),
        GeoPoint(35.3451, 133.5957), GeoPoint(35.3193, 133.7451), GeoPoint(35.2489, 133.8308), GeoPoint(35.3500, 134.0136),
      ],
    ],
  ),

  // ━━━━ 広島県 ━━━━
  'hiroshima': PrefBoundary(
    const GeoPoint(34.6269, 132.7873),
    [
      [
        GeoPoint(35.0926, 132.8590), GeoPoint(35.0781, 133.2506), GeoPoint(35.0061, 133.3212), GeoPoint(34.8895, 133.2972),
        GeoPoint(34.8051, 133.3778), GeoPoint(34.6215, 133.3829), GeoPoint(34.5032, 133.4550), GeoPoint(34.3691, 133.3669),
        GeoPoint(34.3894, 133.2468), GeoPoint(34.4415, 133.2513), GeoPoint(34.3955, 133.0843), GeoPoint(34.3312, 133.0395),
        GeoPoint(34.3165, 132.8139), GeoPoint(34.2409, 132.7598), GeoPoint(34.1937, 132.5377), GeoPoint(34.2420, 132.5566),
        GeoPoint(34.3365, 132.4911), GeoPoint(34.3559, 132.5286), GeoPoint(34.3635, 132.3761), GeoPoint(34.2025, 132.2088),
        GeoPoint(34.3563, 132.0692), GeoPoint(34.5022, 132.0359), GeoPoint(34.5825, 132.1251), GeoPoint(34.6833, 132.1612),
        GeoPoint(34.7080, 132.1300), GeoPoint(34.8059, 132.2410), GeoPoint(34.7794, 132.3960), GeoPoint(34.8206, 132.4346),
        GeoPoint(34.7949, 132.5374), GeoPoint(34.8429, 132.6972), GeoPoint(34.9049, 132.6333), GeoPoint(35.0915, 132.8592),
      ],
      [
        GeoPoint(34.1284, 132.4284), GeoPoint(34.1758, 132.4566), GeoPoint(34.2645, 132.3764), GeoPoint(34.2081, 132.4725),
        GeoPoint(34.2853, 132.4341), GeoPoint(34.2689, 132.4973), GeoPoint(34.1420, 132.4891), GeoPoint(34.1323, 132.4361),
      ],
      [
        GeoPoint(34.0790, 132.5504), GeoPoint(34.0935, 132.4478), GeoPoint(34.1997, 132.5259), GeoPoint(34.1071, 132.5394),
        GeoPoint(34.1149, 132.5913), GeoPoint(34.0807, 132.5558),
      ],
      [
        GeoPoint(34.2058, 132.8791), GeoPoint(34.2418, 132.8374), GeoPoint(34.2486, 132.9027), GeoPoint(34.2845, 132.9298),
        GeoPoint(34.2150, 132.9205), GeoPoint(34.2070, 132.8823),
      ],
      [
        GeoPoint(34.2751, 133.1921), GeoPoint(34.3288, 133.1339), GeoPoint(34.3584, 133.1490), GeoPoint(34.3193, 133.2089),
        GeoPoint(34.2762, 133.1966),
      ],
    ],
  ),

  // ━━━━ 山口県 ━━━━
  'yamaguchi': PrefBoundary(
    const GeoPoint(34.2109, 131.5516),
    [
      [
        GeoPoint(34.6810, 131.6899), GeoPoint(34.5041, 131.6672), GeoPoint(34.4362, 131.7931), GeoPoint(34.3335, 131.7762),
        GeoPoint(34.3064, 131.9578), GeoPoint(34.4683, 132.0660), GeoPoint(34.2364, 132.1447), GeoPoint(34.2107, 132.2449),
        GeoPoint(33.8335, 132.1439), GeoPoint(34.0066, 131.8633), GeoPoint(33.9751, 131.7612), GeoPoint(34.0294, 131.8267),
        GeoPoint(34.0706, 131.7525), GeoPoint(33.9826, 131.4365), GeoPoint(34.0493, 131.3842), GeoPoint(33.9228, 131.2658),
        GeoPoint(34.0570, 131.0369), GeoPoint(33.9464, 130.8734), GeoPoint(34.1875, 130.9316), GeoPoint(34.2873, 130.8664),
        GeoPoint(34.3721, 131.0351), GeoPoint(34.3927, 130.9314), GeoPoint(34.4419, 130.9715), GeoPoint(34.3829, 131.3052),
        GeoPoint(34.6775, 131.6858),
      ],
      [
        GeoPoint(33.8569, 132.2068), GeoPoint(33.9225, 132.1728), GeoPoint(33.9651, 132.2135), GeoPoint(33.9017, 132.3289),
        GeoPoint(33.9466, 132.4711), GeoPoint(33.9111, 132.3718), GeoPoint(33.8624, 132.3716), GeoPoint(33.9016, 132.2851),
        GeoPoint(33.8654, 132.2147),
      ],
    ],
  ),

  // ━━━━ 徳島県 ━━━━
  'tokushima': PrefBoundary(
    const GeoPoint(33.9205, 134.2382),
    [
      [
        GeoPoint(34.2079, 134.4397), GeoPoint(34.2393, 134.5835), GeoPoint(34.2039, 134.5829), GeoPoint(34.1802, 134.6418),
        GeoPoint(34.1197, 134.6037), GeoPoint(34.0117, 134.5884), GeoPoint(33.9827, 134.6058), GeoPoint(34.0097, 134.6340),
        GeoPoint(33.9257, 134.7058), GeoPoint(33.8573, 134.6285), GeoPoint(33.8486, 134.7156), GeoPoint(33.8301, 134.6805),
        GeoPoint(33.8345, 134.7495), GeoPoint(33.7699, 134.5797), GeoPoint(33.7015, 134.5166), GeoPoint(33.6561, 134.3955),
        GeoPoint(33.6270, 134.3618), GeoPoint(33.6233, 134.3888), GeoPoint(33.5889, 134.3633), GeoPoint(33.5844, 134.3320),
        GeoPoint(33.5805, 134.3622), GeoPoint(33.5763, 134.3108), GeoPoint(33.5457, 134.3140), GeoPoint(33.5615, 134.1927),
        GeoPoint(33.6291, 134.1492), GeoPoint(33.6489, 134.1835), GeoPoint(33.6836, 134.1743), GeoPoint(33.6908, 134.0575),
        GeoPoint(33.7262, 134.0673), GeoPoint(33.8283, 134.0324), GeoPoint(33.8347, 133.9604), GeoPoint(33.7915, 133.9131),
        GeoPoint(33.8446, 133.8386), GeoPoint(33.8368, 133.7468), GeoPoint(33.8835, 133.6603), GeoPoint(33.9161, 133.6891),
        GeoPoint(34.0124, 133.6790), GeoPoint(34.0781, 133.7774), GeoPoint(34.1153, 133.9385), GeoPoint(34.0738, 133.9968),
        GeoPoint(34.1179, 134.0503), GeoPoint(34.1187, 134.1218), GeoPoint(34.1767, 134.1734), GeoPoint(34.1853, 134.3493),
        GeoPoint(34.1568, 134.4124), GeoPoint(34.1982, 134.4388),
      ],
    ],
  ),

  // ━━━━ 香川県 ━━━━
  'kagawa': PrefBoundary(
    const GeoPoint(34.2154, 133.9734),
    [
      [
        GeoPoint(34.1513, 134.1348), GeoPoint(34.1187, 134.1218), GeoPoint(34.1179, 134.0503), GeoPoint(34.0738, 133.9968),
        GeoPoint(34.1153, 133.9385), GeoPoint(34.0975, 133.8329), GeoPoint(34.0124, 133.6790), GeoPoint(34.0436, 133.5979),
        GeoPoint(34.0716, 133.6336), GeoPoint(34.1935, 133.6479), GeoPoint(34.2613, 133.5571), GeoPoint(34.2355, 133.6218),
        GeoPoint(34.2465, 133.6716), GeoPoint(34.2218, 133.6735), GeoPoint(34.2999, 133.7615), GeoPoint(34.3229, 133.8286),
        GeoPoint(34.3529, 133.8186), GeoPoint(34.3577, 133.8559), GeoPoint(34.3248, 133.8340), GeoPoint(34.3403, 133.8850),
        GeoPoint(34.3831, 133.8954), GeoPoint(34.3476, 134.0790), GeoPoint(34.3848, 134.0911), GeoPoint(34.3606, 134.1222),
        GeoPoint(34.3997, 134.1348), GeoPoint(34.3842, 134.1621), GeoPoint(34.3259, 134.1650), GeoPoint(34.3320, 134.1900),
        GeoPoint(34.3526, 134.1817), GeoPoint(34.3502, 134.2129), GeoPoint(34.3694, 134.2101), GeoPoint(34.3360, 134.2658),
        GeoPoint(34.3077, 134.2468), GeoPoint(34.2829, 134.2620), GeoPoint(34.2616, 134.3774), GeoPoint(34.2079, 134.4397),
        GeoPoint(34.1575, 134.4184), GeoPoint(34.1853, 134.3493), GeoPoint(34.1767, 134.1734), GeoPoint(34.1545, 134.1366),
      ],
      [
        GeoPoint(34.5631, 134.3320), GeoPoint(34.5611, 134.3648), GeoPoint(34.4342, 134.3378), GeoPoint(34.4468, 134.2777),
        GeoPoint(34.4798, 134.2967), GeoPoint(34.4145, 134.2320), GeoPoint(34.4805, 134.2277), GeoPoint(34.4698, 134.1413),
        GeoPoint(34.5241, 134.1672), GeoPoint(34.5639, 134.3286),
      ],
      [
        GeoPoint(34.4598, 134.0795), GeoPoint(34.4826, 134.0359), GeoPoint(34.4999, 134.0819), GeoPoint(34.4884, 134.1028),
        GeoPoint(34.4603, 134.0827),
      ],
      [
        GeoPoint(34.3517, 133.6994), GeoPoint(34.3647, 133.6852), GeoPoint(34.3999, 133.7080), GeoPoint(34.3712, 133.7300),
        GeoPoint(34.3525, 133.7028),
      ],
      [
        GeoPoint(34.4431, 133.9913), GeoPoint(34.4749, 133.9647), GeoPoint(34.4769, 133.9808), GeoPoint(34.4534, 134.0120),
        GeoPoint(34.4464, 133.9932),
      ],
      [
        GeoPoint(34.3691, 133.7639), GeoPoint(34.3700, 133.7549), GeoPoint(34.3983, 133.7522), GeoPoint(34.3890, 133.7946),
        GeoPoint(34.3736, 133.7699),
      ],
    ],
  ),

  // ━━━━ 愛媛県 ━━━━
  'ehime': PrefBoundary(
    const GeoPoint(33.6058, 132.8510),
    [
      [
        GeoPoint(33.6375, 132.5306), GeoPoint(34.1420, 132.9408), GeoPoint(33.9245, 133.1183), GeoPoint(34.0072, 133.6841),
        GeoPoint(33.8816, 133.6602), GeoPoint(33.7937, 133.1932), GeoPoint(33.4808, 133.0148), GeoPoint(33.4605, 132.8063),
        GeoPoint(33.3207, 132.8998), GeoPoint(33.1383, 132.6955), GeoPoint(33.1809, 132.6189), GeoPoint(32.9249, 132.6546),
        GeoPoint(32.8981, 132.4912), GeoPoint(32.9698, 132.4701), GeoPoint(32.9602, 132.5534), GeoPoint(33.0491, 132.4813),
        GeoPoint(33.0227, 132.3777), GeoPoint(33.1304, 132.5013), GeoPoint(33.2051, 132.4055), GeoPoint(33.2221, 132.5595),
        GeoPoint(33.2552, 132.4683), GeoPoint(33.3149, 132.5226), GeoPoint(33.3181, 132.3711), GeoPoint(33.4624, 132.4193),
        GeoPoint(33.3442, 132.0119), GeoPoint(33.6269, 132.5100),
      ],
      [
        GeoPoint(34.1911, 132.9591), GeoPoint(34.2906, 132.9835), GeoPoint(34.2874, 133.0334), GeoPoint(34.2201, 133.0580),
        GeoPoint(34.1922, 132.9622),
      ],
      [
        GeoPoint(34.1077, 133.0343), GeoPoint(34.1105, 133.0120), GeoPoint(34.1533, 133.0406), GeoPoint(34.1820, 133.0213),
        GeoPoint(34.1785, 133.1105), GeoPoint(34.1133, 133.0384),
      ],
    ],
  ),

  // ━━━━ 高知県 ━━━━
  'kochi': PrefBoundary(
    const GeoPoint(33.4257, 133.3671),
    [
      [
        GeoPoint(33.8676, 133.5826), GeoPoint(33.8446, 133.8386), GeoPoint(33.7915, 133.9131), GeoPoint(33.8283, 134.0324),
        GeoPoint(33.6908, 134.0575), GeoPoint(33.6836, 134.1743), GeoPoint(33.6291, 134.1492), GeoPoint(33.5615, 134.1927),
        GeoPoint(33.5527, 134.3060), GeoPoint(33.2435, 134.1766), GeoPoint(33.4866, 133.9343), GeoPoint(33.5381, 133.7290),
        GeoPoint(33.5008, 133.5644), GeoPoint(33.5525, 133.5604), GeoPoint(33.4957, 133.5739), GeoPoint(33.4176, 133.3504),
        GeoPoint(33.4199, 133.4572), GeoPoint(33.3550, 133.3181), GeoPoint(33.4053, 133.2886), GeoPoint(33.3235, 133.2309),
        GeoPoint(33.2576, 133.2628), GeoPoint(33.1531, 133.2224), GeoPoint(33.1502, 133.1700), GeoPoint(33.0233, 133.0937),
        GeoPoint(33.0151, 133.0111), GeoPoint(32.8819, 133.0087), GeoPoint(32.8565, 132.9486), GeoPoint(32.7238, 133.0198),
        GeoPoint(32.7865, 132.9357), GeoPoint(32.7617, 132.6307), GeoPoint(32.8528, 132.6560), GeoPoint(32.8805, 132.7208),
        GeoPoint(32.9249, 132.6546), GeoPoint(32.9739, 132.6908), GeoPoint(33.1809, 132.6189), GeoPoint(33.1383, 132.6955),
        GeoPoint(33.2745, 132.7933), GeoPoint(33.3207, 132.8998), GeoPoint(33.4605, 132.8063), GeoPoint(33.4808, 133.0148),
        GeoPoint(33.6534, 133.0768), GeoPoint(33.7937, 133.1932), GeoPoint(33.8694, 133.5713),
      ],
    ],
  ),

  // ━━━━ 福岡県 ━━━━
  'fukuoka': PrefBoundary(
    const GeoPoint(33.5248, 130.6656),
    [
      [
        GeoPoint(33.9187, 130.6724), GeoPoint(33.9472, 130.7690), GeoPoint(33.9033, 130.8144), GeoPoint(33.8749, 130.7404),
        GeoPoint(33.8739, 130.7988), GeoPoint(33.9199, 130.8233), GeoPoint(33.8877, 130.8910), GeoPoint(33.9629, 131.0191),
        GeoPoint(33.8301, 130.9567), GeoPoint(33.6235, 131.0930), GeoPoint(33.6162, 131.1845), GeoPoint(33.5462, 131.1872),
        GeoPoint(33.5049, 131.1690), GeoPoint(33.5184, 131.0294), GeoPoint(33.4462, 130.8945), GeoPoint(33.3435, 130.8345),
        GeoPoint(33.2675, 130.8670), GeoPoint(33.2374, 130.8253), GeoPoint(33.1867, 130.8865), GeoPoint(33.1093, 130.8525),
        GeoPoint(33.1712, 130.6792), GeoPoint(33.1101, 130.6588), GeoPoint(33.1157, 130.5797), GeoPoint(33.0522, 130.4968),
        GeoPoint(33.0032, 130.5053), GeoPoint(33.0005, 130.3957), GeoPoint(33.0527, 130.4242), GeoPoint(33.2033, 130.3386),
        GeoPoint(33.3428, 130.5352), GeoPoint(33.4382, 130.5362), GeoPoint(33.3950, 130.4102), GeoPoint(33.4783, 130.2766),
        GeoPoint(33.4697, 130.0387), GeoPoint(33.5369, 130.1521), GeoPoint(33.5836, 130.0885), GeoPoint(33.6671, 130.2086),
        GeoPoint(33.5824, 130.2727), GeoPoint(33.6005, 130.3987), GeoPoint(33.6873, 130.4286), GeoPoint(33.6434, 130.3559),
        GeoPoint(33.6864, 130.2892), GeoPoint(33.6850, 130.3954), GeoPoint(33.7532, 130.4663), GeoPoint(33.8578, 130.4765),
        GeoPoint(33.9185, 130.6689),
      ],
    ],
  ),

  // ━━━━ 佐賀県 ━━━━
  'saga': PrefBoundary(
    const GeoPoint(33.2870, 130.1153),
    [
      [
        GeoPoint(33.4697, 130.0387), GeoPoint(33.4783, 130.2766), GeoPoint(33.3950, 130.4102), GeoPoint(33.4493, 130.5116),
        GeoPoint(33.3428, 130.5352), GeoPoint(33.2430, 130.3713), GeoPoint(33.1404, 130.3549), GeoPoint(33.2029, 130.2454),
        GeoPoint(33.1247, 130.1219), GeoPoint(32.9595, 130.2198), GeoPoint(32.9748, 130.0857), GeoPoint(33.0904, 129.9215),
        GeoPoint(33.1643, 129.9425), GeoPoint(33.1835, 129.8180), GeoPoint(33.2903, 129.7588), GeoPoint(33.3403, 129.7899),
        GeoPoint(33.2921, 129.8528), GeoPoint(33.4075, 129.8680), GeoPoint(33.4541, 129.7828), GeoPoint(33.4538, 129.8579),
        GeoPoint(33.5553, 129.8451), GeoPoint(33.5161, 129.8744), GeoPoint(33.5295, 129.9560), GeoPoint(33.4552, 129.9671),
        GeoPoint(33.4647, 130.0355),
      ],
    ],
  ),

  // ━━━━ 長崎県 ━━━━
  'nagasaki': PrefBoundary(
    const GeoPoint(32.9472, 129.9242),
    [
      [
        GeoPoint(33.3623, 129.6322), GeoPoint(33.3995, 129.6715), GeoPoint(33.3530, 129.6776), GeoPoint(33.3693, 129.7900),
        GeoPoint(33.2903, 129.7588), GeoPoint(33.1835, 129.8180), GeoPoint(33.1643, 129.9425), GeoPoint(33.0904, 129.9215),
        GeoPoint(32.9860, 130.0610), GeoPoint(32.9582, 130.2020), GeoPoint(32.8604, 130.0915), GeoPoint(32.8775, 130.3064),
        GeoPoint(32.7885, 130.3763), GeoPoint(32.6771, 130.3492), GeoPoint(32.6057, 130.2194), GeoPoint(32.5908, 130.1678),
        GeoPoint(32.6461, 130.1284), GeoPoint(32.7290, 130.2058), GeoPoint(32.7817, 130.1928), GeoPoint(32.7945, 130.0835),
        GeoPoint(32.7604, 129.9486), GeoPoint(32.6603, 129.8925), GeoPoint(32.5692, 129.7388), GeoPoint(32.7505, 129.8699),
        GeoPoint(32.7199, 129.8186), GeoPoint(32.8183, 129.7740), GeoPoint(32.8309, 129.7019), GeoPoint(32.9254, 129.6338),
        GeoPoint(33.0982, 129.6758), GeoPoint(33.0493, 129.7609), GeoPoint(32.9889, 129.7375), GeoPoint(33.0211, 129.7629),
        GeoPoint(32.9841, 129.8203), GeoPoint(32.8668, 129.7877), GeoPoint(32.8463, 130.0077), GeoPoint(32.9233, 129.9301),
        GeoPoint(33.0338, 129.9210), GeoPoint(33.0378, 129.8197), GeoPoint(33.1011, 129.7684), GeoPoint(33.0504, 129.7639),
        GeoPoint(33.0991, 129.7288), GeoPoint(33.1427, 129.7847), GeoPoint(33.1631, 129.7007), GeoPoint(33.1154, 129.7095),
        GeoPoint(33.1015, 129.6648), GeoPoint(33.1423, 129.6974), GeoPoint(33.1671, 129.6358), GeoPoint(33.2251, 129.6363),
        GeoPoint(33.1885, 129.6258), GeoPoint(33.2158, 129.5544), GeoPoint(33.3102, 129.6215), GeoPoint(33.3244, 129.5613),
        GeoPoint(33.3771, 129.5679), GeoPoint(33.3628, 129.6264),
      ],
      [
        GeoPoint(34.4243, 129.3831), GeoPoint(34.3867, 129.3510), GeoPoint(34.4118, 129.3968), GeoPoint(34.3351, 129.3940),
        GeoPoint(34.2958, 129.3517), GeoPoint(34.3743, 129.3542), GeoPoint(34.3369, 129.3077), GeoPoint(34.3886, 129.3101),
        GeoPoint(34.3393, 129.2871), GeoPoint(34.3617, 129.2268), GeoPoint(34.3728, 129.2754), GeoPoint(34.4655, 129.3127),
        GeoPoint(34.4677, 129.2734), GeoPoint(34.5333, 129.3436), GeoPoint(34.5600, 129.2857), GeoPoint(34.6487, 129.3203),
        GeoPoint(34.6391, 129.3957), GeoPoint(34.6979, 129.4217), GeoPoint(34.6673, 129.4963), GeoPoint(34.6177, 129.4324),
        GeoPoint(34.5562, 129.4725), GeoPoint(34.4298, 129.3841),
      ],
      [
        GeoPoint(32.5745, 128.7720), GeoPoint(32.6120, 128.5989), GeoPoint(32.6288, 128.6660), GeoPoint(32.7608, 128.6403),
        GeoPoint(32.7348, 128.7766), GeoPoint(32.7978, 128.8073), GeoPoint(32.7525, 128.8035), GeoPoint(32.7448, 128.8544),
        GeoPoint(32.6414, 128.8917), GeoPoint(32.6430, 128.7676), GeoPoint(32.5777, 128.7733),
      ],
      [
        GeoPoint(34.0839, 129.2134), GeoPoint(34.1132, 129.2120), GeoPoint(34.1032, 129.1663), GeoPoint(34.3310, 129.2035),
        GeoPoint(34.3224, 129.2267), GeoPoint(34.2935, 129.2216), GeoPoint(34.3059, 129.2792), GeoPoint(34.2769, 129.2897),
        GeoPoint(34.3279, 129.2660), GeoPoint(34.3077, 129.3087), GeoPoint(34.2772, 129.3046), GeoPoint(34.2995, 129.3387),
        GeoPoint(34.2775, 129.3520), GeoPoint(34.2623, 129.3160), GeoPoint(34.2260, 129.3248), GeoPoint(34.1999, 129.2873),
        GeoPoint(34.1303, 129.2810), GeoPoint(34.0865, 129.2158),
      ],
      [
        GeoPoint(32.8169, 129.0585), GeoPoint(32.9045, 129.0667), GeoPoint(32.9457, 128.9922), GeoPoint(32.9809, 129.0653),
        GeoPoint(33.0289, 129.0427), GeoPoint(33.0255, 129.0875), GeoPoint(33.1639, 129.1104), GeoPoint(32.9863, 129.0820),
        GeoPoint(33.0085, 129.1640), GeoPoint(32.9741, 129.1816), GeoPoint(32.9613, 129.1008), GeoPoint(32.8173, 129.0631),
      ],
      [
        GeoPoint(33.1690, 129.3748), GeoPoint(33.2070, 129.3548), GeoPoint(33.1799, 129.3990), GeoPoint(33.2264, 129.3815),
        GeoPoint(33.2372, 129.4347), GeoPoint(33.2653, 129.4026), GeoPoint(33.3471, 129.4363), GeoPoint(33.3549, 129.5239),
        GeoPoint(33.4061, 129.5223), GeoPoint(33.3590, 129.5689), GeoPoint(33.1699, 129.3771),
      ],
      [
        GeoPoint(33.7044, 129.7159), GeoPoint(33.7675, 129.6427), GeoPoint(33.7596, 129.6850), GeoPoint(33.8065, 129.6494),
        GeoPoint(33.8049, 129.6890), GeoPoint(33.8573, 129.6880), GeoPoint(33.8428, 129.7717), GeoPoint(33.8083, 129.7438),
        GeoPoint(33.7548, 129.7966), GeoPoint(33.7115, 129.7170),
      ],
      [
        GeoPoint(32.7635, 128.8655), GeoPoint(32.7973, 128.8317), GeoPoint(32.8380, 128.8365), GeoPoint(32.8005, 128.8764),
        GeoPoint(32.8440, 128.8626), GeoPoint(32.7973, 128.9095), GeoPoint(32.7645, 128.8705),
      ],
    ],
  ),

  // ━━━━ 熊本県 ━━━━
  'kumamoto': PrefBoundary(
    const GeoPoint(32.6467, 130.8306),
    [
      [
        GeoPoint(33.1831, 131.1104), GeoPoint(32.9762, 131.2628), GeoPoint(32.8919, 131.2549), GeoPoint(32.8329, 131.3286),
        GeoPoint(32.8262, 131.2649), GeoPoint(32.5831, 131.1073), GeoPoint(32.5455, 131.0171), GeoPoint(32.4395, 131.0190),
        GeoPoint(32.3285, 131.1105), GeoPoint(32.2502, 131.0415), GeoPoint(32.1599, 131.1081), GeoPoint(32.0967, 130.7581),
        GeoPoint(32.1869, 130.6040), GeoPoint(32.1197, 130.4035), GeoPoint(32.1803, 130.3594), GeoPoint(32.4341, 130.5732),
        GeoPoint(32.5332, 130.5388), GeoPoint(32.6313, 130.6595), GeoPoint(32.6067, 130.4590), GeoPoint(32.7129, 130.6075),
        GeoPoint(32.7925, 130.6135), GeoPoint(32.9145, 130.4433), GeoPoint(33.0029, 130.4132), GeoPoint(33.0032, 130.5053),
        GeoPoint(33.0522, 130.4968), GeoPoint(33.1157, 130.5797), GeoPoint(33.1101, 130.6588), GeoPoint(33.1712, 130.6792),
        GeoPoint(33.0236, 130.9880), GeoPoint(33.0874, 131.0231), GeoPoint(33.1833, 130.9916), GeoPoint(33.1878, 131.0989),
      ],
      [
        GeoPoint(32.4048, 130.3533), GeoPoint(32.4308, 130.2108), GeoPoint(32.3255, 130.2035), GeoPoint(32.1901, 129.9999),
        GeoPoint(32.2995, 130.0699), GeoPoint(32.3297, 129.9765), GeoPoint(32.5289, 130.0119), GeoPoint(32.5476, 130.1850),
        GeoPoint(32.4477, 130.1995), GeoPoint(32.5301, 130.4599), GeoPoint(32.4023, 130.3502),
      ],
      [
        GeoPoint(32.5461, 130.4223), GeoPoint(32.5913, 130.3949), GeoPoint(32.6145, 130.4101), GeoPoint(32.6141, 130.4571),
        GeoPoint(32.5540, 130.4524), GeoPoint(32.5482, 130.4236),
      ],
    ],
  ),

  // ━━━━ 大分県 ━━━━
  'oita': PrefBoundary(
    const GeoPoint(33.2025, 131.4294),
    [
      [
        GeoPoint(33.6767, 131.5439), GeoPoint(33.6408, 131.6913), GeoPoint(33.4649, 131.7380), GeoPoint(33.4071, 131.7024),
        GeoPoint(33.4199, 131.6276), GeoPoint(33.3845, 131.6487), GeoPoint(33.3473, 131.5921), GeoPoint(33.3605, 131.4988),
        GeoPoint(33.2688, 131.5111), GeoPoint(33.2680, 131.9015), GeoPoint(33.1270, 131.7978), GeoPoint(33.1343, 131.8996),
        GeoPoint(33.0888, 131.8524), GeoPoint(33.0664, 131.9116), GeoPoint(33.0963, 132.0012), GeoPoint(33.0582, 132.0150),
        GeoPoint(33.0523, 131.9289), GeoPoint(32.9917, 131.8890), GeoPoint(32.9327, 132.0846), GeoPoint(32.9227, 131.9769),
        GeoPoint(32.8903, 132.0148), GeoPoint(32.8356, 131.9421), GeoPoint(32.8285, 132.0077), GeoPoint(32.8047, 131.8895),
        GeoPoint(32.7361, 131.8471), GeoPoint(32.8213, 131.8579), GeoPoint(32.8385, 131.7674), GeoPoint(32.7716, 131.7078),
        GeoPoint(32.7543, 131.5664), GeoPoint(32.8371, 131.4744), GeoPoint(32.8039, 131.3590), GeoPoint(32.8791, 131.2632),
        GeoPoint(32.9762, 131.2628), GeoPoint(33.1878, 131.0989), GeoPoint(33.1833, 130.9916), GeoPoint(33.0874, 131.0231),
        GeoPoint(33.0236, 130.9880), GeoPoint(33.1011, 130.8393), GeoPoint(33.1867, 130.8865), GeoPoint(33.2374, 130.8253),
        GeoPoint(33.2675, 130.8670), GeoPoint(33.3435, 130.8345), GeoPoint(33.4779, 130.9254), GeoPoint(33.5080, 131.1765),
        GeoPoint(33.6162, 131.1845), GeoPoint(33.5738, 131.4301), GeoPoint(33.6767, 131.5423),
      ],
    ],
  ),

  // ━━━━ 宮崎県 ━━━━
  'miyazaki': PrefBoundary(
    const GeoPoint(32.1953, 131.2979),
    [
      [
        GeoPoint(32.7740, 131.5077), GeoPoint(32.7716, 131.7078), GeoPoint(32.8385, 131.7674), GeoPoint(32.8213, 131.8579),
        GeoPoint(32.7361, 131.8471), GeoPoint(32.7457, 131.8851), GeoPoint(32.5677, 131.6932), GeoPoint(32.5085, 131.6848),
        GeoPoint(32.4926, 131.7277), GeoPoint(32.4826, 131.6583), GeoPoint(32.4388, 131.6414), GeoPoint(32.4226, 131.6879),
        GeoPoint(32.2532, 131.5711), GeoPoint(31.8695, 131.4539), GeoPoint(31.6451, 131.4685), GeoPoint(31.5552, 131.3811),
        GeoPoint(31.3625, 131.3438), GeoPoint(31.4597, 131.1603), GeoPoint(31.6235, 131.1877), GeoPoint(31.6337, 131.0531),
        GeoPoint(31.7792, 130.9866), GeoPoint(31.8154, 130.8761), GeoPoint(31.8857, 130.9130), GeoPoint(32.0784, 130.7036),
        GeoPoint(32.1211, 130.9724), GeoPoint(32.1738, 131.0127), GeoPoint(32.1599, 131.1081), GeoPoint(32.2502, 131.0415),
        GeoPoint(32.3285, 131.1105), GeoPoint(32.4395, 131.0190), GeoPoint(32.5491, 131.0186), GeoPoint(32.5831, 131.1073),
        GeoPoint(32.8262, 131.2649), GeoPoint(32.8371, 131.4744), GeoPoint(32.7759, 131.5083),
      ],
    ],
  ),

  // ━━━━ 鹿児島県 ━━━━
  'kagoshima': PrefBoundary(
    const GeoPoint(31.6371, 130.6304),
    [
      [
        GeoPoint(32.1859, 130.5908), GeoPoint(31.8857, 130.9130), GeoPoint(31.8154, 130.8761), GeoPoint(31.7792, 130.9866),
        GeoPoint(31.6337, 131.0531), GeoPoint(31.6235, 131.1877), GeoPoint(31.5143, 131.1986), GeoPoint(31.4415, 131.0557),
        GeoPoint(31.3649, 131.0140), GeoPoint(31.3308, 131.1075), GeoPoint(31.2723, 131.0784), GeoPoint(31.2814, 131.1310),
        GeoPoint(31.2278, 131.0162), GeoPoint(31.1372, 130.9598), GeoPoint(30.9957, 130.6581), GeoPoint(31.0694, 130.6529),
        GeoPoint(31.1398, 130.7470), GeoPoint(31.3365, 130.8018), GeoPoint(31.4629, 130.6976), GeoPoint(31.5553, 130.6974),
        GeoPoint(31.5899, 130.5912), GeoPoint(31.6291, 130.6771), GeoPoint(31.5569, 130.7057), GeoPoint(31.5623, 130.7642),
        GeoPoint(31.6560, 130.8219), GeoPoint(31.7350, 130.6867), GeoPoint(31.6995, 130.6151), GeoPoint(31.4905, 130.5127),
        GeoPoint(31.3138, 130.5704), GeoPoint(31.2667, 130.6667), GeoPoint(31.1864, 130.6354), GeoPoint(31.1651, 130.5197),
        GeoPoint(31.2499, 130.4623), GeoPoint(31.2491, 130.2142), GeoPoint(31.3104, 130.2232), GeoPoint(31.3235, 130.1730),
        GeoPoint(31.3469, 130.2089), GeoPoint(31.4203, 130.1085), GeoPoint(31.4259, 130.2716), GeoPoint(31.5865, 130.3338),
        GeoPoint(31.7938, 130.1660), GeoPoint(31.9115, 130.2231), GeoPoint(32.1045, 130.1746), GeoPoint(32.1080, 130.3081),
        GeoPoint(32.1678, 130.3600), GeoPoint(32.1134, 130.4533), GeoPoint(32.1843, 130.5927),
      ],
      [
        GeoPoint(28.4334, 129.6453), GeoPoint(28.5256, 129.6748), GeoPoint(28.4207, 129.7080), GeoPoint(28.2491, 129.4063),
        GeoPoint(28.2091, 129.4746), GeoPoint(28.1535, 129.4003), GeoPoint(28.1681, 129.3361), GeoPoint(28.1094, 129.3766),
        GeoPoint(28.1825, 129.2623), GeoPoint(28.2227, 129.2916), GeoPoint(28.2541, 129.1340), GeoPoint(28.2608, 129.2725),
        GeoPoint(28.3062, 129.2098), GeoPoint(28.4126, 129.4615), GeoPoint(28.3799, 129.4968), GeoPoint(28.4619, 129.5431),
        GeoPoint(28.4770, 129.6211), GeoPoint(28.4135, 129.5890), GeoPoint(28.4305, 129.6422),
      ],
      [
        GeoPoint(30.2263, 130.5216), GeoPoint(30.2392, 130.4367), GeoPoint(30.3500, 130.3809), GeoPoint(30.3914, 130.3778),
        GeoPoint(30.4052, 130.4296), GeoPoint(30.4607, 130.4691), GeoPoint(30.4691, 130.4968), GeoPoint(30.3767, 130.6692),
        GeoPoint(30.2955, 130.6497), GeoPoint(30.2387, 130.5817), GeoPoint(30.2297, 130.5265),
      ],
      [
        GeoPoint(30.6352, 130.9483), GeoPoint(30.6699, 130.9397), GeoPoint(30.7251, 130.9922), GeoPoint(30.8229, 131.0314),
        GeoPoint(30.8391, 131.0552), GeoPoint(30.7837, 131.0815), GeoPoint(30.6057, 131.0541), GeoPoint(30.4797, 130.9619),
        GeoPoint(30.3725, 130.9669), GeoPoint(30.3444, 130.8713), GeoPoint(30.4633, 130.8490), GeoPoint(30.5439, 130.9289),
        GeoPoint(30.6256, 130.9488),
      ],
      [
        GeoPoint(27.7525, 128.9020), GeoPoint(27.8811, 128.8887), GeoPoint(27.8915, 128.9707), GeoPoint(27.6696, 128.9860),
        GeoPoint(27.7497, 128.9000),
      ],
      [
        GeoPoint(32.0898, 130.1578), GeoPoint(32.1258, 130.1107), GeoPoint(32.1800, 130.0901), GeoPoint(32.2001, 130.1218),
        GeoPoint(32.2146, 130.1062), GeoPoint(32.1953, 130.1562), GeoPoint(32.2167, 130.1446), GeoPoint(32.2291, 130.1742),
        GeoPoint(32.1975, 130.1996), GeoPoint(32.1764, 130.1813), GeoPoint(32.1556, 130.2086), GeoPoint(32.1341, 130.1710),
        GeoPoint(32.0909, 130.1595),
      ],
      [
        GeoPoint(27.4005, 128.5763), GeoPoint(27.4344, 128.7123), GeoPoint(27.3316, 128.5792), GeoPoint(27.3715, 128.5193),
        GeoPoint(27.3980, 128.5685),
      ],
      [
        GeoPoint(28.0615, 129.3174), GeoPoint(28.1104, 129.2518), GeoPoint(28.0758, 129.2158), GeoPoint(28.1868, 129.1745),
        GeoPoint(28.1671, 129.2684), GeoPoint(28.1216, 129.2443), GeoPoint(28.1151, 129.3439), GeoPoint(28.0721, 129.3278),
      ],
    ],
  ),

  // ━━━━ 沖縄県 ━━━━
  'okinawa': PrefBoundary(
    const GeoPoint(26.4950, 127.9588),
    [
      [
        GeoPoint(26.7166, 128.1534), GeoPoint(26.8748, 128.2561), GeoPoint(26.7829, 128.3237), GeoPoint(26.6772, 128.2781),
        GeoPoint(26.6291, 128.1487), GeoPoint(26.5529, 128.1373), GeoPoint(26.5527, 128.0321), GeoPoint(26.5201, 128.0519),
        GeoPoint(26.4375, 127.9479), GeoPoint(26.4311, 127.8302), GeoPoint(26.2954, 127.9202), GeoPoint(26.3292, 127.8357),
        GeoPoint(26.2050, 127.7564), GeoPoint(26.1683, 127.8303), GeoPoint(26.0911, 127.7245), GeoPoint(26.0817, 127.6570),
        GeoPoint(26.1977, 127.6354), GeoPoint(26.2944, 127.7557), GeoPoint(26.4404, 127.7107), GeoPoint(26.4361, 127.7968),
        GeoPoint(26.5724, 127.9807), GeoPoint(26.6056, 127.8940), GeoPoint(26.7085, 127.8784), GeoPoint(26.6879, 128.0021),
        GeoPoint(26.6488, 127.9816), GeoPoint(26.6265, 128.0234), GeoPoint(26.6575, 128.1259), GeoPoint(26.7115, 128.1449),
      ],
      [
        GeoPoint(24.2544, 123.8718), GeoPoint(24.2986, 123.7204), GeoPoint(24.2775, 123.7172), GeoPoint(24.2819, 123.6797),
        GeoPoint(24.3071, 123.6602), GeoPoint(24.3095, 123.6851), GeoPoint(24.3313, 123.6832), GeoPoint(24.3127, 123.7070),
        GeoPoint(24.3484, 123.7017), GeoPoint(24.3117, 123.7499), GeoPoint(24.3929, 123.7416), GeoPoint(24.4361, 123.7687),
        GeoPoint(24.3909, 123.8148), GeoPoint(24.4029, 123.8718), GeoPoint(24.3643, 123.9378), GeoPoint(24.2555, 123.8789),
      ],
      [
        GeoPoint(24.3279, 124.1730), GeoPoint(24.3632, 124.1082), GeoPoint(24.4111, 124.1399), GeoPoint(24.4323, 124.1130),
        GeoPoint(24.4139, 124.0818), GeoPoint(24.4512, 124.0738), GeoPoint(24.4446, 124.1161), GeoPoint(24.4800, 124.1126),
        GeoPoint(24.4401, 124.1365), GeoPoint(24.4527, 124.2181), GeoPoint(24.4971, 124.2252), GeoPoint(24.5175, 124.2530),
        GeoPoint(24.5045, 124.2754), GeoPoint(24.6097, 124.3118), GeoPoint(24.5857, 124.3371), GeoPoint(24.4651, 124.2489),
        GeoPoint(24.3570, 124.2465), GeoPoint(24.3299, 124.1817),
      ],
      [
        GeoPoint(24.7115, 125.3060), GeoPoint(24.7554, 125.2507), GeoPoint(24.7509, 125.2813), GeoPoint(24.7949, 125.2552),
        GeoPoint(24.8454, 125.2943), GeoPoint(24.9098, 125.2529), GeoPoint(24.8777, 125.2963), GeoPoint(24.7991, 125.3324),
        GeoPoint(24.7608, 125.4296), GeoPoint(24.7189, 125.4673), GeoPoint(24.7128, 125.3156),
      ],
      [
        GeoPoint(26.3461, 126.7255), GeoPoint(26.3695, 126.7095), GeoPoint(26.3904, 126.7780), GeoPoint(26.3447, 126.8232),
        GeoPoint(26.2908, 126.8102), GeoPoint(26.3463, 126.7253),
      ],
      [
        GeoPoint(25.8128, 131.2306), GeoPoint(25.8221, 131.2145), GeoPoint(25.8723, 131.2353), GeoPoint(25.8552, 131.2731),
        GeoPoint(25.8133, 131.2445),
      ],
      [
        GeoPoint(24.4372, 123.0116), GeoPoint(24.4507, 122.9345), GeoPoint(24.4738, 123.0109), GeoPoint(24.4615, 123.0437),
        GeoPoint(24.4467, 123.0229),
      ],
      [
        GeoPoint(24.8113, 125.1812), GeoPoint(24.8635, 125.1598), GeoPoint(24.8459, 125.2078), GeoPoint(24.8141, 125.2191),
        GeoPoint(24.8077, 125.1881),
      ],
    ],
  ),

};
