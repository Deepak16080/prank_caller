import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  final player = AudioPlayer();
                  player.play(AssetSource('song.mp3'));
                },
                child: const Text('Play'))));
  }
}
