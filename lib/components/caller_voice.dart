import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prank_caller/main.dart';
import 'package:prank_caller/utils/enums.dart';

import '../utils/common.dart';

class CallerVoice extends StatefulWidget {
  const CallerVoice({super.key});

  @override
  State<CallerVoice> createState() => _CallerVoiceState();
}

class _CallerVoiceState extends State<CallerVoice> {
  AppAudio? selectedringtone;
  @override
  void dispose() {
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Caller Voice'),
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
                if (selectedringtone == null) {
                  toast(context, "Please select a caller voice");
                  return;
                }
                Navigator.pop(context, selectedringtone);
              },
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
            List songs = jsonMap?.keys.toList() ?? [];

            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                String path = songs[index].toString();
                bool isMp3 = path.contains(".mp3");

                String title = path.replaceAll("assets/callervoice/", "").replaceAll(".mp3", "");

                bool isSelected = selectedringtone?.path == path;

                if (!isMp3) return const SizedBox.shrink();

                return InkWell(
                  onTap: () {
                    selectedringtone = AppAudio(path: path, name: title);
                    if (isSelected && player.playing) {
                      player.pause();
                    } else {
                      selectedringtone!.play();
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
                    margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: ListTile(
                        textColor: Colors.blue,
                        title: Text(title),
                        leading: player.playing && isSelected
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
}
