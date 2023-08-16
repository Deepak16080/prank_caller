import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:prank_caller/home_page.dart';

void main() {
  const method = int.fromEnvironment('method', defaultValue: 1);
  runApp(DevicePreview(
      enabled: kDebugMode && kIsWeb,
      builder: (context) {
        if (method == 1) {
          return MyApp();
        } else {
          return MyApp();
        }
      }));
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
        colorScheme: const ColorScheme.light(background: Colors.black).copyWith(
          primary: Colors.black,
          secondary: Colors.green[700],
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.black,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
