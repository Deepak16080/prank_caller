import 'dart:io';

class AdsHelper {
  static String homepagebanner() {
    if (Platform.isAndroid) {
      return "ca-app-pub-6322672470771994/8168687563";
    } else {
      return "";
    }
  }

  static String contactpage() {
    if (Platform.isAndroid) {
      return "ca-app-pub-6322672470771994/4959822878";
    } else {
      return "";
    }
  }

  static String fullPagead() {
    if (Platform.isAndroid) {
      return "ca-app-pub-6322672470771994/5239024473";
    } else {
      return "";
    }
  }
}
