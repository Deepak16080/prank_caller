import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank_caller/services/ads_services.dart';
import 'package:prank_caller/widget/box.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  late BannerAd? bannerAd;
  bool isAdLoaded = false;
  // InterstitialAd? _interstitialAd;
  @override
  void initState() {
    super.initState();
    initBannerAd();
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

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.blue,
        title: Text('Contact Us', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          HBox(20),
          ListTile(
            leading: Image.asset('assets/logo/fb.png', width: 50, height: 50),
            title: Text('Facebook', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchURL('https://www.facebook.com/jonny.saxsena.7');
            },
          ),
          HBox(10),
          ListTile(
            leading: Image.asset('assets/logo/youtube.png', width: 60, height: 50),
            title: Text('YouTube', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchURL('https://youtube.com/@DJCreation-li8hk?si=G6MiJXDuyCiYv6i-');
            },
          ),
          HBox(10),
          ListTile(
            leading: Image.asset('assets/logo/insta.png', width: 50, height: 50),
            title: Text('Instagram', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchURL('https://www.instagram.com/royal_king_.__._/');
            },
          ),
          HBox(10),
          ListTile(
            leading: Image.asset('assets/logo/whatsapp.png', width: 50, height: 50),
            title: Text('Whatsapp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchWhatsApp("+917665070041");
            },
          ),
          HBox(10),
          ListTile(
            leading: Image.asset('assets/logo/telegram.png', width: 50, height: 50),
            title: Text('Telegram', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchURL('https://t.me/DJ_creation06');
            },
          ),
          HBox(10),
          ListTile(
            leading: Image.asset('assets/logo/twitter.png', width: 50, height: 50),
            title: Text('Twitter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              _launchURL('https://x.com/Deepak16080?t=bO_HjgCpioAwj4WJyrBaIA&s=08');
            },
          ),
        ],
      ),
    );
  }

  _launchWhatsApp(String phoneNumber) async {
    String url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}
