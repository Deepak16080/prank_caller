import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank_caller/models/ads_helper.dart';

class AdsProvider with ChangeNotifier {
  bool ishomepagebannerLoaded = false;
  late BannerAd homepagebanner;
  bool iscontactpagebannerloaded = false;

  late BannerAd contactpagebanner;
  bool isfullpageadloaded = false;
  late InterstitialAd fullPagead;

  void initializehomepagebanner() async {
    homepagebanner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelper.homepagebanner(),
        listener: BannerAdListener(
          onAdClosed: (ad) {
            ad.dispose();
            ishomepagebannerLoaded = false;
          },
          onAdLoaded: (ad) {
            log('Homepage banner is loaded');
            ishomepagebannerLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            log(error.toString());
            ishomepagebannerLoaded = false;
          },
        ),
        request: AdRequest());
    await homepagebanner.load();
    notifyListeners();
  }

  void initializeContactpagebanner() async {
    contactpagebanner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsHelper.contactpage(),
        listener: BannerAdListener(
          onAdClosed: (ad) {
            ad.dispose();
            iscontactpagebannerloaded = false;
          },
          onAdLoaded: (ad) {
            log('contactpage banner is loaded');
            iscontactpagebannerloaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            log(error.toString());
            iscontactpagebannerloaded = false;
          },
        ),
        request: AdRequest());
    await contactpagebanner.load();
    notifyListeners();
  }

  void initializefullpageads() async {
    await InterstitialAd.load(
        adUnitId: AdsHelper.fullPagead(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            log('ads is loaded');
            fullPagead = ad;
            isfullpageadloaded = true;
          },
          onAdFailedToLoad: (error) {
            log(error.toString());
            isfullpageadloaded = false;
          },
        ));
    notifyListeners();
  }
}
