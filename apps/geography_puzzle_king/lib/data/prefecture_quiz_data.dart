import 'package:geography_puzzle_king/i18n/content_tr.dart';

// このファイルは自動生成の補助を経て作成されています。
// 各都道府県ごとに最低3問のクイズ（県庁所在地・特産品・地方/地理）を持たせ、
// ゲーム開始時にランダムで1問選ぶために利用します（GameScreen 側で使用）。

/// 都道府県クイズ1問分のデータ
class Quiz {
  final String _question;
  String get question => tr(_question);
  final List<String> _options;
  List<String> get options => _options.map(tr).toList();
  final int correctIndex;

  const Quiz({
    required String question,
    required List<String> options,
    required this.correctIndex,
  }) : _question = question, _options = options;
}

/// 都道府県コード（'01'〜'47'）ごとのクイズ一覧。各県最低3問。
const Map<String, List<Quiz>> prefectureQuizData = {
  '01': [
    Quiz(
      question: '北海道の県庁所在地は？',
      options: ['宮崎市', '高松市', '甲府市', '札幌市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '北海道の特産品は？',
      options: ['じゃがいも', '佐賀牛', '伊勢えび', 'みかん'],
      correctIndex: 0,
    ),
    Quiz(
      question: '北海道はどの地方にある？',
      options: ['四国', '中国', '東北', '北海道'],
      correctIndex: 3,
    ),
  ],
  '02': [
    Quiz(
      question: '青森県の県庁所在地は？',
      options: ['熊本市', '松山市', '宮崎市', '青森市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '青森県の特産品は？',
      options: ['りんご', '讃岐うどん', 'わんこそば', 'ぶどう'],
      correctIndex: 0,
    ),
    Quiz(
      question: '青森県はどの地方にある？',
      options: ['四国', '中部', '東北', '九州・沖縄'],
      correctIndex: 2,
    ),
  ],
  '03': [
    Quiz(
      question: '岩手県の県庁所在地は？',
      options: ['盛岡市', '千葉市', '水戸市', '金沢市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '岩手県の特産品は？',
      options: ['じゃがいも', 'とり天', '伊勢えび', 'わんこそば'],
      correctIndex: 3,
    ),
    Quiz(
      question: '岩手県はどの地方にある？',
      options: ['四国', '東北', '中国', '北海道'],
      correctIndex: 1,
    ),
  ],
  '04': [
    Quiz(
      question: '宮城県の県庁所在地は？',
      options: ['長崎市', '大津市', '仙台市', '福島市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '宮城県の特産品は？',
      options: ['馬刺し', '牛タン', 'あんぽ柿', 'さくらんぼ'],
      correctIndex: 1,
    ),
    Quiz(
      question: '宮城県はどの地方にある？',
      options: ['近畿', '東北', '四国', '中国'],
      correctIndex: 1,
    ),
  ],
  '05': [
    Quiz(
      question: '秋田県の県庁所在地は？',
      options: ['熊本市', '甲府市', '前橋市', '秋田市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '秋田県の特産品は？',
      options: ['わんこそば', 'きりたんぽ', 'なし', '讃岐うどん'],
      correctIndex: 1,
    ),
    Quiz(
      question: '秋田県はどの地方にある？',
      options: ['四国', '中部', '近畿', '東北'],
      correctIndex: 3,
    ),
  ],
  '06': [
    Quiz(
      question: '山形県の県庁所在地は？',
      options: ['山形市', '東京', '福島市', '鹿児島市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '山形県の特産品は？',
      options: ['コシヒカリ', '越前がに', 'ます寿司', 'さくらんぼ'],
      correctIndex: 3,
    ),
    Quiz(
      question: '山形県はどの地方にある？',
      options: ['関東', '九州・沖縄', '東北', '中国'],
      correctIndex: 2,
    ),
  ],
  '07': [
    Quiz(
      question: '福島県の県庁所在地は？',
      options: ['福岡市', '大阪市', '新潟市', '福島市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '福島県の特産品は？',
      options: ['鮒寿司', 'あんぽ柿', '飛騨牛', 'きりたんぽ'],
      correctIndex: 1,
    ),
    Quiz(
      question: '福島県はどの地方にある？',
      options: ['東北', '北海道', '中部', '近畿'],
      correctIndex: 0,
    ),
  ],
  '08': [
    Quiz(
      question: '茨城県の県庁所在地は？',
      options: ['京都市', '宇都宮市', '水戸市', '札幌市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '茨城県の特産品は？',
      options: ['メロン', '飛騨牛', 'きりたんぽ', 'ぶどう'],
      correctIndex: 0,
    ),
    Quiz(
      question: '茨城県はどの地方にある？',
      options: ['関東', '中部', '東北', '中国'],
      correctIndex: 0,
    ),
  ],
  '09': [
    Quiz(
      question: '栃木県の県庁所在地は？',
      options: ['宇都宮市', '札幌市', '鳥取市', '青森市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '栃木県の特産品は？',
      options: ['黒豚', '鮒寿司', 'ぎょうざ', 'ちゃんぽん'],
      correctIndex: 2,
    ),
    Quiz(
      question: '栃木県はどの地方にある？',
      options: ['近畿', '四国', '東北', '関東'],
      correctIndex: 3,
    ),
  ],
  '10': [
    Quiz(
      question: '群馬県の県庁所在地は？',
      options: ['鹿児島市', '佐賀市', '高松市', '前橋市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '群馬県の特産品は？',
      options: ['黒豚', 'こんにゃく', 'ます寿司', '神戸牛'],
      correctIndex: 1,
    ),
    Quiz(
      question: '群馬県はどの地方にある？',
      options: ['北海道', '四国', '中部', '関東'],
      correctIndex: 3,
    ),
  ],
  '11': [
    Quiz(
      question: '埼玉県の県庁所在地は？',
      options: ['宮崎市', '京都市', 'さいたま市', '横浜市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '埼玉県の特産品は？',
      options: ['お茶', 'みかん', '枝豆', '馬刺し'],
      correctIndex: 2,
    ),
    Quiz(
      question: '埼玉県はどの地方にある？',
      options: ['関東', '九州・沖縄', '北海道', '東北'],
      correctIndex: 0,
    ),
  ],
  '12': [
    Quiz(
      question: '千葉県の県庁所在地は？',
      options: ['千葉市', '前橋市', '富山市', '大分市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '千葉県の特産品は？',
      options: ['阿波おどり', 'なし', 'あんぽ柿', '湯豆腐'],
      correctIndex: 1,
    ),
    Quiz(
      question: '千葉県はどの地方にある？',
      options: ['東北', '関東', '四国', '近畿'],
      correctIndex: 1,
    ),
  ],
  '13': [
    Quiz(
      question: '東京都の県庁所在地は？',
      options: ['宮崎市', '千葉市', '静岡市', '東京'],
      correctIndex: 3,
    ),
    Quiz(
      question: '東京都の特産品は？',
      options: ['もんじゃ焼き', 'ぎょうざ', '阿波おどり', 'お好み焼き'],
      correctIndex: 0,
    ),
    Quiz(
      question: '東京都はどの地方にある？',
      options: ['中国', '東北', '北海道', '関東'],
      correctIndex: 3,
    ),
  ],
  '14': [
    Quiz(
      question: '神奈川県の県庁所在地は？',
      options: ['長野市', '奈良市', '名古屋市', '横浜市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '神奈川県の特産品は？',
      options: ['あんぽ柿', 'シウマイ', 'のどぐろ', '馬刺し'],
      correctIndex: 1,
    ),
    Quiz(
      question: '神奈川県はどの地方にある？',
      options: ['中部', '四国', '近畿', '関東'],
      correctIndex: 3,
    ),
  ],
  '15': [
    Quiz(
      question: '新潟県の県庁所在地は？',
      options: ['山口市', '新潟市', '大分市', '名古屋市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '新潟県の特産品は？',
      options: ['飛騨牛', 'みかん', '湯豆腐', 'コシヒカリ'],
      correctIndex: 3,
    ),
    Quiz(
      question: '新潟県はどの地方にある？',
      options: ['九州・沖縄', '中国', '東北', '中部'],
      correctIndex: 3,
    ),
  ],
  '16': [
    Quiz(
      question: '富山県の県庁所在地は？',
      options: ['富山市', '福井市', '高松市', '那覇市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '富山県の特産品は？',
      options: ['かつおのたたき', 'とり天', 'りんご', 'ます寿司'],
      correctIndex: 3,
    ),
    Quiz(
      question: '富山県はどの地方にある？',
      options: ['中部', '近畿', '九州・沖縄', '中国'],
      correctIndex: 0,
    ),
  ],
  '17': [
    Quiz(
      question: '石川県の県庁所在地は？',
      options: ['千葉市', '高松市', '宮崎市', '金沢市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '石川県の特産品は？',
      options: ['加賀料理', 'のどぐろ', 'メロン', 'シウマイ'],
      correctIndex: 0,
    ),
    Quiz(
      question: '石川県はどの地方にある？',
      options: ['北海道', '中部', '四国', '東北'],
      correctIndex: 1,
    ),
  ],
  '18': [
    Quiz(
      question: '福井県の県庁所在地は？',
      options: ['名古屋市', '福井市', '高松市', '東京'],
      correctIndex: 1,
    ),
    Quiz(
      question: '福井県の特産品は？',
      options: ['越前がに', '神戸牛', '松葉ガニ', 'こんにゃく'],
      correctIndex: 0,
    ),
    Quiz(
      question: '福井県はどの地方にある？',
      options: ['東北', '関東', '四国', '中部'],
      correctIndex: 3,
    ),
  ],
  '19': [
    Quiz(
      question: '山梨県の県庁所在地は？',
      options: ['甲府市', '鹿児島市', '岡山市', '広島市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '山梨県の特産品は？',
      options: ['飛騨牛', 'ぶどう', '桃', '黒豚'],
      correctIndex: 1,
    ),
    Quiz(
      question: '山梨県はどの地方にある？',
      options: ['四国', '関東', '東北', '中部'],
      correctIndex: 3,
    ),
  ],
  '20': [
    Quiz(
      question: '長野県の県庁所在地は？',
      options: ['盛岡市', '長野市', '名古屋市', '山口市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '長野県の特産品は？',
      options: ['飛騨牛', '神戸牛', '佐賀牛', '信州そば'],
      correctIndex: 3,
    ),
    Quiz(
      question: '長野県はどの地方にある？',
      options: ['中部', '近畿', '関東', '北海道'],
      correctIndex: 0,
    ),
  ],
  '21': [
    Quiz(
      question: '岐阜県の県庁所在地は？',
      options: ['岐阜市', '新潟市', '静岡市', '松山市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '岐阜県の特産品は？',
      options: ['飛騨牛', 'りんご', '佐賀牛', 'ぎょうざ'],
      correctIndex: 0,
    ),
    Quiz(
      question: '岐阜県はどの地方にある？',
      options: ['北海道', '中部', '中国', '近畿'],
      correctIndex: 1,
    ),
  ],
  '22': [
    Quiz(
      question: '静岡県の県庁所在地は？',
      options: ['水戸市', '静岡市', '千葉市', '熊本市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '静岡県の特産品は？',
      options: ['お茶', 'とり天', 'ぶどう', 'ふぐ'],
      correctIndex: 0,
    ),
    Quiz(
      question: '静岡県はどの地方にある？',
      options: ['中部', '中国', '九州・沖縄', '四国'],
      correctIndex: 0,
    ),
  ],
  '23': [
    Quiz(
      question: '愛知県の県庁所在地は？',
      options: ['徳島市', '高知市', '名古屋市', '岡山市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '愛知県の特産品は？',
      options: ['シウマイ', 'さくらんぼ', 'ひつまぶし', 'かつおのたたき'],
      correctIndex: 2,
    ),
    Quiz(
      question: '愛知県はどの地方にある？',
      options: ['九州・沖縄', '東北', '中部', '関東'],
      correctIndex: 2,
    ),
  ],
  '24': [
    Quiz(
      question: '三重県の県庁所在地は？',
      options: ['高松市', '広島市', '東京', '津市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '三重県の特産品は？',
      options: ['桃', 'かつおのたたき', '越前がに', '伊勢えび'],
      correctIndex: 3,
    ),
    Quiz(
      question: '三重県はどの地方にある？',
      options: ['中国', '北海道', '関東', '近畿'],
      correctIndex: 3,
    ),
  ],
  '25': [
    Quiz(
      question: '滋賀県の県庁所在地は？',
      options: ['大津市', '福島市', '広島市', '長崎市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '滋賀県の特産品は？',
      options: ['こんにゃく', '鮒寿司', 'あんぽ柿', 'お好み焼き'],
      correctIndex: 1,
    ),
    Quiz(
      question: '滋賀県はどの地方にある？',
      options: ['東北', '北海道', '四国', '近畿'],
      correctIndex: 3,
    ),
  ],
  '26': [
    Quiz(
      question: '京都府の県庁所在地は？',
      options: ['宮崎市', '千葉市', '熊本市', '京都市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '京都府の特産品は？',
      options: ['地鶏の炭火焼き', 'とり天', '神戸牛', '湯豆腐'],
      correctIndex: 3,
    ),
    Quiz(
      question: '京都府はどの地方にある？',
      options: ['関東', '中部', '九州・沖縄', '近畿'],
      correctIndex: 3,
    ),
  ],
  '27': [
    Quiz(
      question: '大阪府の県庁所在地は？',
      options: ['大阪市', '水戸市', '新潟市', '鹿児島市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '大阪府の特産品は？',
      options: ['たこ焼き', 'じゃがいも', 'お好み焼き', 'ひつまぶし'],
      correctIndex: 0,
    ),
    Quiz(
      question: '大阪府はどの地方にある？',
      options: ['九州・沖縄', '東北', '近畿', '中国'],
      correctIndex: 2,
    ),
  ],
  '28': [
    Quiz(
      question: '兵庫県の県庁所在地は？',
      options: ['前橋市', '広島市', '神戸市', '大阪市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '兵庫県の特産品は？',
      options: ['ふぐ', '博多ラーメン', 'みかん', '神戸牛'],
      correctIndex: 3,
    ),
    Quiz(
      question: '兵庫県はどの地方にある？',
      options: ['四国', '関東', '近畿', '北海道'],
      correctIndex: 2,
    ),
  ],
  '29': [
    Quiz(
      question: '奈良県の県庁所在地は？',
      options: ['和歌山市', '東京', '奈良市', '鹿児島市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '奈良県の特産品は？',
      options: ['ふぐ', 'わんこそば', 'もんじゃ焼き', '柿の葉寿司'],
      correctIndex: 3,
    ),
    Quiz(
      question: '奈良県はどの地方にある？',
      options: ['北海道', '中部', '近畿', '九州・沖縄'],
      correctIndex: 2,
    ),
  ],
  '30': [
    Quiz(
      question: '和歌山県の県庁所在地は？',
      options: ['盛岡市', '山口市', '和歌山市', '大分市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '和歌山県の特産品は？',
      options: ['博多ラーメン', 'みかん', '黒豚', 'わんこそば'],
      correctIndex: 1,
    ),
    Quiz(
      question: '和歌山県はどの地方にある？',
      options: ['北海道', '近畿', '九州・沖縄', '東北'],
      correctIndex: 1,
    ),
  ],
  '31': [
    Quiz(
      question: '鳥取県の県庁所在地は？',
      options: ['松江市', '札幌市', '鳥取市', '前橋市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '鳥取県の特産品は？',
      options: ['りんご', 'シウマイ', 'こんにゃく', '松葉ガニ'],
      correctIndex: 3,
    ),
    Quiz(
      question: '鳥取県はどの地方にある？',
      options: ['北海道', '九州・沖縄', '中国', '中部'],
      correctIndex: 2,
    ),
  ],
  '32': [
    Quiz(
      question: '島根県の県庁所在地は？',
      options: ['松江市', '鳥取市', '津市', '宇都宮市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '島根県の特産品は？',
      options: ['飛騨牛', 'みかん', 'なし', 'のどぐろ'],
      correctIndex: 3,
    ),
    Quiz(
      question: '島根県はどの地方にある？',
      options: ['九州・沖縄', '関東', '中国', '北海道'],
      correctIndex: 2,
    ),
  ],
  '33': [
    Quiz(
      question: '岡山県の県庁所在地は？',
      options: ['和歌山市', '岡山市', '松江市', '山形市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '岡山県の特産品は？',
      options: ['桃', '神戸牛', '伊勢えび', 'みかん'],
      correctIndex: 0,
    ),
    Quiz(
      question: '岡山県はどの地方にある？',
      options: ['関東', '中国', '近畿', '四国'],
      correctIndex: 1,
    ),
  ],
  '34': [
    Quiz(
      question: '広島県の県庁所在地は？',
      options: ['広島市', '大津市', '札幌市', '仙台市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '広島県の特産品は？',
      options: ['桃', 'お好み焼き', '馬刺し', '地鶏の炭火焼き'],
      correctIndex: 1,
    ),
    Quiz(
      question: '広島県はどの地方にある？',
      options: ['中国', '北海道', '中部', '東北'],
      correctIndex: 0,
    ),
  ],
  '35': [
    Quiz(
      question: '山口県の県庁所在地は？',
      options: ['神戸市', '前橋市', '山口市', '津市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '山口県の特産品は？',
      options: ['牛タン', 'ふぐ', '博多ラーメン', '越前がに'],
      correctIndex: 1,
    ),
    Quiz(
      question: '山口県はどの地方にある？',
      options: ['四国', '東北', '関東', '中国'],
      correctIndex: 3,
    ),
  ],
  '36': [
    Quiz(
      question: '徳島県の県庁所在地は？',
      options: ['那覇市', '和歌山市', '静岡市', '徳島市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '徳島県の特産品は？',
      options: ['鮒寿司', 'メロン', '阿波おどり', '地鶏の炭火焼き'],
      correctIndex: 2,
    ),
    Quiz(
      question: '徳島県はどの地方にある？',
      options: ['近畿', '中部', '関東', '四国'],
      correctIndex: 3,
    ),
  ],
  '37': [
    Quiz(
      question: '香川県の県庁所在地は？',
      options: ['富山市', '高松市', '那覇市', '福島市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '香川県の特産品は？',
      options: ['じゃがいも', 'ひつまぶし', '讃岐うどん', 'メロン'],
      correctIndex: 2,
    ),
    Quiz(
      question: '香川県はどの地方にある？',
      options: ['東北', '四国', '近畿', '関東'],
      correctIndex: 1,
    ),
  ],
  '38': [
    Quiz(
      question: '愛媛県の県庁所在地は？',
      options: ['金沢市', '福井市', '長野市', '松山市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '愛媛県の特産品は？',
      options: ['かつおのたたき', 'あんぽ柿', 'みかん', 'お茶'],
      correctIndex: 2,
    ),
    Quiz(
      question: '愛媛県はどの地方にある？',
      options: ['四国', '九州・沖縄', '中部', '東北'],
      correctIndex: 0,
    ),
  ],
  '39': [
    Quiz(
      question: '高知県の県庁所在地は？',
      options: ['前橋市', '大津市', '大阪市', '高知市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '高知県の特産品は？',
      options: ['かつおのたたき', 'とり天', '越前がに', '讃岐うどん'],
      correctIndex: 0,
    ),
    Quiz(
      question: '高知県はどの地方にある？',
      options: ['四国', '中部', '九州・沖縄', '中国'],
      correctIndex: 0,
    ),
  ],
  '40': [
    Quiz(
      question: '福岡県の県庁所在地は？',
      options: ['福岡市', '富山市', '松江市', '福島市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '福岡県の特産品は？',
      options: ['とり天', '博多ラーメン', '柿の葉寿司', 'みかん'],
      correctIndex: 1,
    ),
    Quiz(
      question: '福岡県はどの地方にある？',
      options: ['近畿', '九州・沖縄', '関東', '東北'],
      correctIndex: 1,
    ),
  ],
  '41': [
    Quiz(
      question: '佐賀県の県庁所在地は？',
      options: ['前橋市', '山口市', '宮崎市', '佐賀市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '佐賀県の特産品は？',
      options: ['柿の葉寿司', '伊勢えび', '飛騨牛', '佐賀牛'],
      correctIndex: 3,
    ),
    Quiz(
      question: '佐賀県はどの地方にある？',
      options: ['九州・沖縄', '関東', '北海道', '中国'],
      correctIndex: 0,
    ),
  ],
  '42': [
    Quiz(
      question: '長崎県の県庁所在地は？',
      options: ['和歌山市', '京都市', '福井市', '長崎市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '長崎県の特産品は？',
      options: ['馬刺し', 'ちゃんぽん', '鮒寿司', 'とり天'],
      correctIndex: 1,
    ),
    Quiz(
      question: '長崎県はどの地方にある？',
      options: ['九州・沖縄', '中国', '近畿', '関東'],
      correctIndex: 0,
    ),
  ],
  '43': [
    Quiz(
      question: '熊本県の県庁所在地は？',
      options: ['熊本市', '宇都宮市', '宮崎市', '京都市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '熊本県の特産品は？',
      options: ['ます寿司', 'かつおのたたき', 'ぶどう', '馬刺し'],
      correctIndex: 3,
    ),
    Quiz(
      question: '熊本県はどの地方にある？',
      options: ['北海道', '九州・沖縄', '東北', '関東'],
      correctIndex: 1,
    ),
  ],
  '44': [
    Quiz(
      question: '大分県の県庁所在地は？',
      options: ['大分市', '千葉市', '広島市', '高松市'],
      correctIndex: 0,
    ),
    Quiz(
      question: '大分県の特産品は？',
      options: ['わんこそば', 'とり天', '阿波おどり', 'コシヒカリ'],
      correctIndex: 1,
    ),
    Quiz(
      question: '大分県はどの地方にある？',
      options: ['九州・沖縄', '関東', '東北', '中部'],
      correctIndex: 0,
    ),
  ],
  '45': [
    Quiz(
      question: '宮崎県の県庁所在地は？',
      options: ['金沢市', '前橋市', '大阪市', '宮崎市'],
      correctIndex: 3,
    ),
    Quiz(
      question: '宮崎県の特産品は？',
      options: ['鮒寿司', '馬刺し', '地鶏の炭火焼き', '桃'],
      correctIndex: 2,
    ),
    Quiz(
      question: '宮崎県はどの地方にある？',
      options: ['四国', '東北', '九州・沖縄', '北海道'],
      correctIndex: 2,
    ),
  ],
  '46': [
    Quiz(
      question: '鹿児島県の県庁所在地は？',
      options: ['名古屋市', '鹿児島市', '福井市', '徳島市'],
      correctIndex: 1,
    ),
    Quiz(
      question: '鹿児島県の特産品は？',
      options: ['コシヒカリ', 'みかん', 'ひつまぶし', '黒豚'],
      correctIndex: 3,
    ),
    Quiz(
      question: '鹿児島県はどの地方にある？',
      options: ['中国', '九州・沖縄', '四国', '関東'],
      correctIndex: 1,
    ),
  ],
  '47': [
    Quiz(
      question: '沖縄県の県庁所在地は？',
      options: ['松江市', '静岡市', '那覇市', '山口市'],
      correctIndex: 2,
    ),
    Quiz(
      question: '沖縄県の特産品は？',
      options: ['ゴーヤーチャンプルー', 'コシヒカリ', 'お好み焼き', 'ふぐ'],
      correctIndex: 0,
    ),
    Quiz(
      question: '沖縄県はどの地方にある？',
      options: ['東北', '九州・沖縄', '中部', '中国'],
      correctIndex: 1,
    ),
  ],
};

