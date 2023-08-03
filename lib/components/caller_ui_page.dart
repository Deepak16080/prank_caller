import 'package:flutter/material.dart';

class CallerProfilePage extends StatefulWidget {
  const CallerProfilePage({super.key});

  @override
  State<CallerProfilePage> createState() => _CallerProfilePageState();
}

class _CallerProfilePageState extends State<CallerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Center(child: Text('caller ui page')),
    );
  }
}
