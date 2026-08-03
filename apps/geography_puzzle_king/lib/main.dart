import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/firebase_options.dart';
import 'package:geography_puzzle_king/providers/game_provider.dart' show sharedPreferencesProvider;
import 'package:geography_puzzle_king/providers/monetization_provider.dart';
import 'package:geography_puzzle_king/services/ad_service.dart';
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

  // TODO: cross_promo_kit連携（別セッションで進行中）はpubspec.yamlの依存が
  // 未整備のため一時的に無効化。パッケージ配置後にCrossPromoService.init()呼び出しを復元すること。

  await AdService.initialize();

  // 「広告除去」の購入状態をアプリ全体で共有するため、ProviderContainerを
  // 明示的に作成して起動前にSharedPreferencesの読み込みと購入監視を開始する。
  final container = ProviderContainer();
  await container.read(sharedPreferencesProvider.future);
  container.read(purchaseServiceProvider)?.startListening(
        onPurchased: () => container.read(premiumUnlockedProvider.notifier).markPurchased(),
      );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '日本領土ディフェンス',
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
