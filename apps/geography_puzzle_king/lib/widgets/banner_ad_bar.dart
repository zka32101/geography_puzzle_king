import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:geography_puzzle_king/providers/monetization_provider.dart';

/// 画面下部に表示するバナー広告。「広告除去」購入済みの場合は何も表示しない。
class BannerAdBar extends ConsumerStatefulWidget {
  const BannerAdBar({super.key});

  @override
  ConsumerState<BannerAdBar> createState() => _BannerAdBarState();
}

class _BannerAdBarState extends ConsumerState<BannerAdBar> {
  BannerAd? _bannerAd;
  bool _loaded = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 既に購入済みなら広告リクエスト自体を行わない（無駄な通信を避ける）。
      if (mounted && !ref.read(premiumUnlockedProvider)) {
        _loadAd();
      }
    });
  }

  void _loadAd() {
    final adService = ref.read(adServiceProvider);
    final ad = adService.createBannerAd(
      onLoaded: () {
        if (mounted) setState(() => _loaded = true);
      },
      onLoadFailed: () {
        if (mounted) setState(() => _failed = true);
      },
    );
    _bannerAd = ad;
    ad.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final premiumUnlocked = ref.watch(premiumUnlockedProvider);
    // load()呼び出し後に購入された場合に備え、build時にも非表示条件を再確認する。
    if (premiumUnlocked || _failed || !_loaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }
    return SafeArea(
      top: false,
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}
