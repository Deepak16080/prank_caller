import 'package:flutter/material.dart';
import 'package:prank_caller/widget/app_text.dart';
import 'package:prank_caller/widget/box.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Contact Us'),
      ),
      body: Column(
        children: <Widget>[
          HBox(20),
          InkWell(
            onTap: () {
              _launchURL('https://www.facebook.com/jonny.saxsena.7');
            },
            child: Row(
              children: [
                WBox(20),
                Image.asset('assets/logo/fb.png', width: 50, height: 50),
                WBox(10),
                Center(child: AppText('Facebook', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          HBox(20),
          InkWell(
            onTap: () {
              _launchURL('https://youtube.com/@DJCreation-li8hk?si=G6MiJXDuyCiYv6i-');
            },
            child: Row(
              children: [
                Image.asset('assets/logo/youtube.png', width: 80, height: 80),
                AppText('YouTube', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              _launchURL('https://www.instagram.com/royal_king_.__._/');
            },
            child: Row(
              children: [
                WBox(20),
                Image.asset('assets/logo/insta.png', width: 50, height: 50),
                WBox(10),
                AppText('Instagram', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              _launchWhatsApp("+917665070041");
            },
            child: Row(
              children: [
                WBox(20),
                Image.asset('assets/logo/whatsapp.png', width: 50, height: 50),
                WBox(10),
                AppText('Whatsapp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
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
