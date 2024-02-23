import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:prank_caller/components/splash_screen.dart';
import 'package:prank_caller/widget/responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

final player = AudioPlayer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Prank Caller',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(background: Colors.white).copyWith(
            primary: Colors.black,
            secondary: Colors.green[700],
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.transparent,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Responsive(
          mobile: Splashscreen(),
          desktop: Splashscreen(),
          tablet: Splashscreen(),
        ));
  }
}
