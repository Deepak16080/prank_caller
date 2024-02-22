import "package:flutter/material.dart";
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank_caller/services/ads_services.dart';

import '../utils/common.dart';

class ContactScreen extends StatefulWidget {
  final AlertDialog? dialog;
  const ContactScreen({super.key, required this.dialog});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts;
  Contact? selectedContact;
  var selectedindex = -1;
  bool _permissionDenied = false;
  late BannerAd? bannerAd;
  bool isAdLoaded = false;
  int rewaredscore = 0;
  RewardedAd? rewardedAd;
  void initrewardedad() {
    RewardedAd.load(
      adUnitId: AdMobService.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          rewardedAd?.dispose();
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showrewardedad() {
    if (rewardedAd != null) {
      rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          initrewardedad();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          initrewardedad();
        },
      );

      rewardedAd?.show(onUserEarnedReward: (ad, reward) {
        setState(() {
          rewaredscore++;
        });
        print('User earned reward of: ${reward.amount}');
      });
      rewardedAd = null;
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
  void initState() {
    super.initState();
    initBannerAd();
    initrewardedad();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
    if (_contacts!.isEmpty) {
      setState(() {
        _contacts = [];
      });
    }
    if (_contacts!.isNotEmpty) {
      setState(() {
        _contacts = _contacts!.where((element) => element.phones.isNotEmpty).toList();
      });
    }
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
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
          builder: (context, item) {
            if (_permissionDenied) {
              return Center(child: Text('Please give a permission to access your contacts'));
            }
            if (_contacts == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
            if (_contacts!.isEmpty) return Center(child: Text('No contacts found'));
            return ListView.builder(
                itemCount: _contacts!.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () async {
                        selectedContact = _contacts![i];
                        setState(() {
                          selectedindex = i;
                        });
                      },
                      child: Card(
                        color: selectedindex == i ? Colors.green : Colors.white,
                        shadowColor: Colors.green,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2.0,
                        child: ListTile(
                            title: Text(_contacts![i].displayName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _contacts![i].phones.map((e) => Text(e.number)).toList(),
                            )),
                      ));
                });
          }),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            showrewardedad();
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (selectedContact == null) {
                  toast(context, "Please select a contact");
                } else {
                  Navigator.pop(context, selectedContact!);
                }
                setState(() {
                  showrewardedad();
                });
              },
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
