import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:just_audio/just_audio.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/utils/enums.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  AudioPlayer audioPlayer = AudioPlayer();

  AppAudio? selectedvoice;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ringtones'),
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
          itemCount: networkFiles.length,
          itemBuilder: (context, index) {
            final audio = networkFiles[index];
            String audioUrl = networkFiles[index].path;
            String name = networkFiles[index].name.toString();

            String title = name;

            bool isSelected = selectedvoice == audio;

            return InkWell(
              onTap: () async {
                selectedvoice = networkFiles[index];
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
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickfile();
        },
        child: const Icon(Icons.add_to_drive),
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

  void pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        dialogTitle: 'Select an audio file',
        initialDirectory: '$Path');

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      // ignore: use_build_context_synchronously
      Navigator.pop(
          context, AppAudio(path: file.path!, name: path.basename(file.path!)));
    } else {
      toast(context, 'please select an audio');
    }
  }
}
