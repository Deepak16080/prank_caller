import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
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
              onPressed: () {
                if (selectedItem == null) {
                  toast(context, "Please select a ringtone");
                  return;
                }
                Navigator.pop(context, selectedItem);
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

                String title =
                    path.replaceAll("assets/songs/", "").replaceAll(".mp3", "");

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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.small(
              heroTag: 'list 1',
              onPressed: () {
                setState(() {
                  // file.delete();
                });
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // restoreSettings();
              });
            },
            child: const Icon(Icons.add_to_drive),
          ),
        ],
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
  // Future<void> restoreSettings() async {
  //   FilePickerResult? pickerResult =
  //       await FilePicker.platform.pickFiles(type: FileType.audio);
  //   if (pickerResult?.files.first != null) {
  //     String fileName = pickerResult!.files.first.name;
  //     print('picker fileName $fileName');
  //     Uint8List? fileBytes = pickerResult.files.first.bytes;
  //     print('picker fileBytes $fileBytes');
  //   } else {
     
  //   }
  // }

  
  // void savefile(path) async {
  //   SharedPreferences savefile = await SharedPreferences.getInstance();
  //   savefile.setString('filepath', path);
  // }

  // void loadfile() async {
  //   SharedPreferences savefile = await SharedPreferences.getInstance();
  //   savefile.getString('');
  // }

