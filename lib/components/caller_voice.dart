import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:prank_caller/models/indexlist.dart';

class CallerVoice extends StatefulWidget {
  const CallerVoice({super.key});

  @override
  State<CallerVoice> createState() => _CallerVoiceState();
}

class _CallerVoiceState extends State<CallerVoice> {
  AudioPlayer audioPlayer = AudioPlayer();

  String? selectedvoice;

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  if (selectedvoice == null) {
                    toast(context, "Please select a voice");
                    return;
                  }
                  Navigator.pop(context, selectedvoice);
                },
                child: const Text(
                  'Select',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: FutureBuilder<String>(builder: (context, item) {
          return ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              String audioUrl = lists[index].url;
              String name = lists[index].name.toString();

              String title = name;

              bool isSelected = selectedvoice == name;

              return InkWell(
                onTap: () async {
                  selectedvoice = name;
                  if (isSelected && audioPlayer.playing) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer
                      ..setUrl(audioUrl)
                      ..play();
                  }
                  setState(() {});
                },
                child: Card(
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: isSelected
                        ? const BorderSide(color: Colors.green, width: 2)
                        : const BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: ListTile(
                      textColor: Colors.blue,
                      title: Text('$title '),
                      leading: audioPlayer.playing && isSelected
                          ? const Icon(Icons.pause, color: Colors.blue)
                          : const Icon(Icons.play_arrow, color: Colors.blue)),
                ),
              );
            },
          );
        }));
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
  }
}
