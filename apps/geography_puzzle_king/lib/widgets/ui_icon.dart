import 'package:flutter/material.dart';

/// 画面で使うアイコン画像（絵文字の置き換え用）。assets/images/icons/ の画像。
enum UiIconKind {
  coin('coin', '🪙'),
  shield('shield', '🛡'),
  wind('wind', '💨'),
  star('star', '⭐'),
  trophy('trophy', '🏆'),
  castle('castle', '🏯'),
  book('book', '📖'),
  mapScroll('mapscroll', '🗺');

  const UiIconKind(this.fileName, this.emoji);

  final String fileName;

  /// 置き換え前の絵文字（画像が読めない場合の代わりに出す）。
  final String emoji;

  String get assetPath => 'assets/images/icons/$fileName.png';
}

class UiIcon extends StatelessWidget {
  const UiIcon(this.kind, {super.key, this.size = 20});

  final UiIconKind kind;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kind.assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
      errorBuilder: (_, _, _) => Text(kind.emoji, style: TextStyle(fontSize: size * 0.85)),
    );
  }
}

// 文字列中の絵文字（異体字セレクタ U+FE0F つきも）を探す正規表現。
final RegExp _kIconEmojiPattern = RegExp('(🪙|🛡|💨|⭐|🏆|🏯|📖|🗺)\uFE0F?');

UiIconKind? _kindOfEmoji(String emoji) {
  final base = emoji.replaceAll('\uFE0F', '');
  for (final k in UiIconKind.values) {
    if (k.emoji == base) return k;
  }
  return null;
}

/// 文字列に、置き換え対象の絵文字が含まれるか。
bool containsIconEmoji(String text) => _kIconEmojiPattern.hasMatch(text);

/// [Text] の代わりに使う。文字列中の絵文字（🪙🛡💨⭐🏆🏯📖🗺）を画像のアイコンに
/// 置き換えて表示する。絵文字が含まれない文字列は、そのまま [Text] と同じ表示。
class IconText extends StatelessWidget {
  const IconText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    if (!containsIconEmoji(data)) {
      return Text(
        data,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        semanticsLabel: semanticsLabel,
      );
    }
    final effective = DefaultTextStyle.of(context).style.merge(style);
    final fontSize = effective.fontSize ?? 14;
    final spans = <InlineSpan>[];
    var last = 0;
    for (final m in _kIconEmojiPattern.allMatches(data)) {
      if (m.start > last) spans.add(TextSpan(text: data.substring(last, m.start)));
      final kind = _kindOfEmoji(m.group(0)!);
      if (kind == null) {
        spans.add(TextSpan(text: m.group(0)));
      } else {
        spans.add(WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: UiIcon(kind, size: fontSize * 1.25),
          ),
        ));
      }
      last = m.end;
    }
    if (last < data.length) spans.add(TextSpan(text: data.substring(last)));
    return Text.rich(
      TextSpan(children: spans),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel ?? data,
    );
  }
}
