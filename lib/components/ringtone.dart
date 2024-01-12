import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/utils/enums.dart';

import '../main.dart';
import '../utils/common.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  AppAudio? selectedringtone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ringtones'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        backgroundColor: Colors.blue,
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
                  toast(context, "Please select a voice");
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
            return ListView.builder(
              itemCount: networkFiles.length,
              itemBuilder: (context, index) {
                final audio = networkFiles[index];

                String name = networkFiles[index].name.toString();

                String title = name;

                bool isSelected = selectedringtone == audio;

                return InkWell(
                  onTap: () async {
                    selectedringtone = networkFiles[index];
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
                        title: Text('$title '),
                        leading: player.playing && isSelected
                            ? const Icon(Icons.pause, color: Colors.blue)
                            : const Icon(Icons.play_arrow, color: Colors.blue)),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickfile();
        },
        child: const Icon(Icons.add_to_drive),
      ),
    );
  }

  void pickfile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.audio, dialogTitle: 'Select an audio file', initialDirectory: '$Path');

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      // ignore: use_build_context_synchronously
      Navigator.pop(context, AppAudio(path: file.path!, name: path.basename(file.path!)));
    } else {
      toast(context, 'please select an audio');
    }
  }
}
