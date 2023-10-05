import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prank_caller/home.dart';
import 'package:prank_caller/widget/box.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.purple[10],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HBox(250),
            Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
            HBox(
              10,
            ),
            Text(
              'Prank Caller',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            HBox(120),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
