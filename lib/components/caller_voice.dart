import 'package:flutter/material.dart';

class CallerVoice extends StatefulWidget {
  const CallerVoice({super.key});

  @override
  State<CallerVoice> createState() => _CallerVoiceState();
}

class _CallerVoiceState extends State<CallerVoice> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Caller voice page'),);
  }
}