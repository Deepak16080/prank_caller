import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:prank_caller/components/homepage_ui.dart';

void main() {
  runApp(const MyApp());
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
        home: const HomepageUi());
  }
}
