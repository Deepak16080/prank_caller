import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CallerVoice extends StatefulWidget {
  const CallerVoice({super.key});

  @override
  State<CallerVoice> createState() => _CallerVoiceState();
}

class _CallerVoiceState extends State<CallerVoice> {
final AudioPlayer audioPlayer = AudioPlayer();

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
        builder: (context, item) {
          if (item.hasData) {
            Map? jsonMap = jsonDecode(item.data!);
            List callervoice = jsonMap?.keys.toList() ?? [];

            return ListView.builder(
              itemCount: callervoice.length,
              itemBuilder: (context, index) {
                String path = callervoice[index].toString();
                bool isMp3 = path.contains(".mp3");

                String title =
                    path.replaceAll("assets/voicecall/", "").replaceAll(".mp3", "");

                bool isSelected = selectedItem == path;

                if (!isMp3) return const SizedBox.shrink();

                return InkWell(
                  onTap: () {
                    selectedItem = path;
                    if (isSelected && audioPlayer.playing) {
                      audioPlayer.pause();
                    } else {
                      audioPlayer
                        ..setAsset(path)
                        ..play();
                    }
                    setState(() {});
                  },
                  child: Card(
                    shadowColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      side: isSelected
                          ? const BorderSide(color: Colors.green, width: 2)
                          : const BorderSide(
                              color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 15.0, right: 15.0),
                    child: ListTile(
                        textColor: Colors.blue,
                        title: Text(title),
                        leading: audioPlayer.playing && isSelected
                            ? const Icon(Icons.pause, color: Colors.blue)
                            : const Icon(Icons.play_arrow, color: Colors.blue)),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('empty directory'),
            );
          }
        },
      ),
      
    );
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }
}
