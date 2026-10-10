import 'dart:async';

import 'package:cross_promo_kit/cross_promo_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/i18n/content_tr.dart';
import 'package:geography_puzzle_king/l10n/app_localizations.dart';
import 'package:geography_puzzle_king/firebase_options.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart' show sharedPreferencesProvider;
import 'package:geography_puzzle_king/providers/localization_provider.dart';
import 'package:geography_puzzle_king/providers/monetization_provider.dart';
import 'package:geography_puzzle_king/services/ad_service.dart';
import 'package:geography_puzzle_king/services/purchase_service.dart' show kRemoveAdsProductId, kUnlockMapProductId, kPremiumPlanProductId;
import 'package:geography_puzzle_king/screens/auth/splash_screen.dart';
import 'package:geography_puzzle_king/screens/auth/login_screen.dart';
import 'package:geography_puzzle_king/screens/home/home_screen.dart';
import 'package:geography_puzzle_king/screens/home/prefecture_selection_screen.dart';
import 'package:geography_puzzle_king/screens/home/prefecture_map_screen.dart';
import 'package:geography_puzzle_king/screens/pokedex/pokedex_screen.dart';
import 'package:geography_puzzle_king/screens/ranking/ranking_screen.dart';
import 'package:geography_puzzle_king/screens/settings/settings_screen.dart';
import 'package:geography_puzzle_king/screens/territory/territory_screen.dart';
import 'package:geography_puzzle_king/screens/hq/hq_upgrade_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 縦画面固定（タワーディフェンスUIは縦画面前提のレイアウトのため）
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 初期化順序を明示的に設定
  await SharedPreferences.getInstance(); // 先に SharedPreferences を初期化

  // Android ネイティブ側（google-services.json の自動初期化）で既に
  // "[DEFAULT]" アプリが存在する場合がある。Firebase.apps は Dart 側の
  // キャッシュのみを見るため検知できず、try-catch で duplicate-app を吸収する。
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    if (e.code != 'duplicate-app') rethrow;
  }

  // 他アプリ紹介リスト（Remote Config）の取得。起動をブロックしないよう待たない。
  unawaited(CrossPromoService.init());

  await AdService.initialize();

  // 「広告除去」「マップ解放」の購入状態をアプリ全体で共有するため、
  // ProviderContainerを明示的に作成して起動前にSharedPreferencesの読み込みと
  // 購入監視を開始する。
  final container = ProviderContainer();
  await container.read(sharedPreferencesProvider.future);
  container.read(purchaseServiceProvider)?.startListening(
        onPurchased: (productId) {
          if (productId == kRemoveAdsProductId) {
            container.read(adsRemovedProvider.notifier).markPurchased();
          } else if (productId == kUnlockMapProductId) {
            container.read(mapUnlockedProvider.notifier).markPurchased();
          } else if (productId == kPremiumPlanProductId) {
            // プレミアム（買い切り）: 広告削除＋全解放を即時反映。
            container.read(premiumPlanProvider.notifier).markPurchased();
            container.read(adsRemovedProvider.notifier).markPurchased();
            container.read(mapUnlockedProvider.notifier).markPurchased();
          }
        },
      );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    // ゲーム内コンテンツ翻訳（tr()）が参照する言語を同期する。
    // 未設定の間は端末の言語に従い、未対応言語は日本語。
    final contentLang =
        locale?.languageCode ?? WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    ContentLocale.code = const ['ja', 'en', 'zh', 'ko'].contains(contentLang) ? contentLang : 'ja';

    return MaterialApp(
      title: '都道府県ゲーム',
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
        Locale('zh'),
        Locale('ko'),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
            borderSide: const BorderSide(
              color: AppColors.divider,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
            borderSide: const BorderSide(
              color: AppColors.divider,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/prefecture_selection': (context) => const PrefectureSelectionScreen(),
        '/map': (context) => const PrefectureMapScreen(),
        '/territory': (context) => const TerritoryScreen(),
        '/pokedex': (context) => const PokedexScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/hq': (context) => const HqUpgradeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
