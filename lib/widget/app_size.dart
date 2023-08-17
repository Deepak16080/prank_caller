import 'package:flutter/material.dart';

class AppSizeHeight extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget verysmallScreen;

  const AppSizeHeight(
      {super.key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen,
      required this.verysmallScreen});
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.height < 300;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.height > 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.height > 1200;
  }

  static bool isVerySmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.height < 300;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight > 1200) {
        return largeScreen;
      } else if (constraints.maxHeight > 600) {
        return mediumScreen;
      } else if (constraints.maxHeight < 300) {
        return smallScreen;
      } else {
        return verysmallScreen;
      }
    });
  }
}

















// class Appsize extends StatelessWidget {
//   final Widget largeScreen;
//   final Widget mediumScreen;
//   final Widget smallScreen;
//   const Appsize({super.key,required this.largeScreen,required this.mediumScreen,required this.smallScreen});

//   @override
//   Widget build(BuildContext context) {
//     final screenheight = MediaQuery.of(context).size.height;
//     return LayoutBuilder(builder: (context, constraints) {
//       if (screenheight > 1200) {
//         return ();
//       } else if (constraints.maxWidth > 600) {
//         return const HomePage();
//       } else if (constraints.maxWidth < 300) {
//         return const HomePage();
//       } else {
//         return const HomePage();
//       }
//     }
//   }
// }