import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank_caller/services/ads_services.dart';
import 'package:prank_caller/utils/common.dart';
import 'package:prank_caller/widget/box.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool isAdLoaded = false;
  InterstitialAd? interstitialAd;
  @override
  void initState() {
    super.initState();
    initBannerAd();
    initInterstitialAd();
  }

  void initInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdMobService.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            print('Interstitial Ad loaded');
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('Interstitial Ad failed to load: $error');
            interstitialAd = null;
          },
        ));
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          print('$ad onAdFailedToShowFullScreenContent: $error');
        },
        onAdShowedFullScreenContent: (ad) {
          print('$ad onAdShowedFullScreenContent');
          interstitialAd = null;
        },
      );
      interstitialAd!.show();
      interstitialAd = null;
    }
  }

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobService.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: isAdLoaded
          ? SizedBox(
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              child: AdWidget(
                ad: bannerAd!,
              ),
            )
          : const SizedBox(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Send Feedback',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                  alignLabelWithHint: true,
                )),
            HBox(20),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  labelText: 'Feedback',
                  labelStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                  alignLabelWithHint: true),
              maxLines: 4,
            ),
            HBox(20),
            MaterialButton(
                onPressed: () {
                  if (feedbackController.text.isEmpty) {
                    toast(context, 'Please enter feedback');
                    return;
                  }
                  submitFeedback();
                  showInterstitialAd();
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Submit Feedback', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  void submitFeedback() {
    toast(context, 'Feedback submitted');
  }

//   void _sendFeedback() async {
//     String feedback = _feedbackController.text;
//     String email = 'dy16080@gmail.com'; // Replace with your Gmail address

//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: email,
//       queryParameters: {'subject': 'Feedback for Your App', 'body': feedback},
//     );

//     if (await canLaunchUrl(Uri.parse(emailLaunchUri.toString()))) {
//       await launchUrl(Uri.parse(emailLaunchUri.toString()));
//     } else {
//       throw 'Could not launch email';
//     }
//   }
// }
}
