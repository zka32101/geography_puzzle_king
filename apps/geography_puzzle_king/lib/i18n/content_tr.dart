import 'package:flutter/widgets.dart';
import 'package:geography_puzzle_king/i18n/content_en.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/i18n/content_ko.dart';
import 'package:geography_puzzle_king/i18n/content_zh.dart';

/// ゲーム内コンテンツ（都道府県・ボス・クイズ等、日本語で書かれたデータ）の
/// 表示用翻訳。日本語の原文をキーに、現在のアプリ言語の訳を返す。
/// 訳がない文字列は原文（日本語）をそのまま返す。
///
/// 言語は [ContentLocale.code] で保持し、`main.dart` が言語変更時に更新する
/// （MaterialApp が再構築されるため、表示も追従する）。
class ContentLocale {
  ContentLocale._();
  static String code = 'ja';
}

String tr(String ja) {
  switch (ContentLocale.code) {
    case 'en':
      return kContentEn[ja] ?? ja;
    case 'ko':
      return kContentKo[ja] ?? ja;
    case 'zh':
      return kContentZh[ja] ?? ja;
    default:
      return ja;
  }
}

/// 文脈（BuildContext）なしで現在言語の [AppLocalizations] を取得する。
/// initState 等 `AppLocalizations.of(context)` が使えない場所向け。
AppLocalizations get tl => lookupAppLocalizations(Locale(ContentLocale.code));
