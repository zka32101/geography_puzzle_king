import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geography_puzzle_king/config/constants.dart';
import 'package:geography_puzzle_king/firebase_options.dart';
import 'package:geography_puzzle_king/screens/auth/splash_screen.dart';
import 'package:geography_puzzle_king/screens/auth/login_screen.dart';
import 'package:geography_puzzle_king/screens/home/home_screen.dart';
import 'package:geography_puzzle_king/screens/home/prefecture_selection_screen.dart';
import 'package:geography_puzzle_king/screens/home/prefecture_map_screen.dart';
import 'package:geography_puzzle_king/screens/pokedex/pokedex_screen.dart';
import 'package:geography_puzzle_king/screens/ranking/ranking_screen.dart';
import 'package:geography_puzzle_king/screens/settings/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
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
        '/pokedex': (context) => const PokedexScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
