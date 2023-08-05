import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:prank_caller/home_page.dart';

void main() {
  runApp(const MyApp());
}

final player = AudioPlayer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
