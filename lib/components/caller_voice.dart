
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
  Future<void> playAudioFromUrl(String url) async {
    await audioPlayer.setUrl('https://www.prokerala.com/downloads/ringtones/download.php?id=60526');
  }

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
                onPressed: () {
                  audioPlayer.stop();
                },
                child: const Text(
                  'Select',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: FutureBuilder<String>(builder: (context, item) {
          // if (item.hasData) {
          //   Map? jsonMap = jsonDecode(item.data!);
          //   List lists = jsonMap?.keys.toList() ?? [];

          return ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              String name = lists[index].toString();
              // bool isMp3 = name.contains(".mp3");

              String title =
                  name.replaceAll("$UriData", "").replaceAll(".mp3", "$name");

              bool isSelected = selectedItem == name;

              // if (!isMp3) return const SizedBox.shrink();

              return InkWell(
                onTap: () {
                  playAudioFromUrl(
                      'https://www.prokerala.com/downloads/ringtones/download.php?id=60526');
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
                      title: Text('$title'),
                      leading:
                          // audioPlayer.onPlayerComplete.isBroadcast && isSelected
                          //     ? const Icon(Icons.pause, color: Colors.blue):
                          const Icon(Icons.play_arrow, color: Colors.blue)),
                ),
              );
            },
          );
        }));
  }
}
