import 'package:google_mobile_ads/google_mobile_ads.dart';

bool isAdLoaded = false;
BannerAd? bannerAd;

class AdMobService {
  static String get bannerAdUnitId => 'ca-app-pub-6322672470771994/2949120988';
  static String get interstitialAdUnitId => 'ca-app-pub-6322672470771994/5812099801';
  static String get rewardedAdUnitId => 'ca-app-pub-6322672470771994/3929447584';
}

class AdsHelper {
  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-6322672470771994/2949120988',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  _isAdLoaded() {
    return isAdLoaded;
  }
}
