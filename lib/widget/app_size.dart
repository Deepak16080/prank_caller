import 'package:flutter/material.dart';

class SizeConfig extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget verysmallScreen;

  const SizeConfig(
      {super.key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen,
      required this.verysmallScreen});
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 300;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isVerySmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 300;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen;
      } else if (constraints.maxWidth > 600) {
        return mediumScreen;
      } else if (constraints.maxWidth < 300) {
        return smallScreen;
      } else {
        return verysmallScreen;
      }
    });
  }
}
