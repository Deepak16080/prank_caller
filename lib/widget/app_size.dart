import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SizeConfig {
  /// create singleton instance
  SizeConfig._internal();
  static final SizeConfig _instance = SizeConfig._internal();
  factory SizeConfig() => _instance;

  double screenWidth =
      Get.context?.orientation == Orientation.portrait ? Get.mediaQuery.size.width : Get.mediaQuery.size.height;

  double screenHeight =
      Get.context?.orientation == Orientation.portrait ? Get.mediaQuery.size.height : Get.mediaQuery.size.width;

  double infinityHeight() => double.infinity;

  double infinityWidth() => double.infinity;

  double blockSizeHorizontal() => screenWidth / 100;

  double blockSizeVertical() => screenHeight / 100;

  double _safeAreaHorizontal() => Get.mediaQuery.padding.left + Get.mediaQuery.padding.right;

  double _safeAreaVertical() => Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom;

  double safeBlockHorizontal() =>
      (screenWidth - (Get.context?.orientation == Orientation.portrait ? _safeAreaHorizontal() : _safeAreaVertical())) /
      100;

  double safeBlockVertical() =>
      (screenHeight -
          (Get.context?.orientation == Orientation.portrait ? _safeAreaVertical() : _safeAreaHorizontal())) /
      100;

  double fontSize50() => safeBlockHorizontal() * 5.0;
  double fontSize51() => safeBlockHorizontal() * 5.1;
  double fontSize52() => safeBlockHorizontal() * 5.2;
  double fontSize53() => safeBlockHorizontal() * 5.3;
  double fontSize54() => safeBlockHorizontal() * 5.4;
  double fontSize55() => safeBlockHorizontal() * 5.5;
  double fontSize56() => safeBlockHorizontal() * 5.6;
  double fontSize57() => safeBlockHorizontal() * 5.7;
  double fontSize58() => safeBlockHorizontal() * 5.8;
  double fontSize59() => safeBlockHorizontal() * 5.9;
}
