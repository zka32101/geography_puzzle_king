import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// 広告ユニットID
///
/// 現在はGoogle公式のテストIDを使用している。本番リリース前に、
/// AdMobコンソールで作成した実際の広告ユニットIDに置き換えること。
class AdUnitIds {
  static String get banner {
    if (Platform.isAndroid) return 'ca-app-pub-3940256099942544/6300978111';
    if (Platform.isIOS) return 'ca-app-pub-3940256099942544/2934735716';
    throw UnsupportedError('この端末では広告に対応していません');
  }

  static String get interstitial {
    if (Platform.isAndroid) return 'ca-app-pub-3940256099942544/1033173712';
    if (Platform.isIOS) return 'ca-app-pub-3940256099942544/4411468910';
    throw UnsupportedError('この端末では広告に対応していません');
  }
}

/// AdMob広告の読み込み・表示を管理するサービス。
///
/// 「広告除去」を購入済みの場合は、呼び出し元（Provider層）が
/// このサービス自体を呼ばないようにガードする想定。
class AdService {
  InterstitialAd? _interstitialAd;
  bool _interstitialLoading = false;

  static Future<void> initialize() => MobileAds.instance.initialize();

  BannerAd createBannerAd({
    required void Function() onLoadFailed,
    required void Function() onLoaded,
  }) {
    return BannerAd(
      adUnitId: AdUnitIds.banner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => onLoaded(),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          onLoadFailed();
        },
      ),
    );
  }

  /// インタースティシャル広告を事前読み込みしておく。
  /// ウェーブ終了・ゲーム終了などのタイミングで [showInterstitial] を呼べば
  /// 読み込み待ちなしで即表示できる。
  void preloadInterstitial() {
    if (_interstitialAd != null || _interstitialLoading) return;
    _interstitialLoading = true;
    InterstitialAd.load(
      adUnitId: AdUnitIds.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialLoading = false;
        },
        onAdFailedToLoad: (error) {
          _interstitialLoading = false;
        },
      ),
    );
  }

  /// 読み込み済みのインタースティシャル広告を表示する。
  /// 未読み込みの場合は何もせず終了し、次回のために読み込みを開始する。
  Future<void> showInterstitial() async {
    final ad = _interstitialAd;
    if (ad == null) {
      preloadInterstitial();
      return;
    }
    _interstitialAd = null;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        preloadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        preloadInterstitial();
      },
    );
    await ad.show();
  }

  void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }
}
