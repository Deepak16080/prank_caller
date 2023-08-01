import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.paused;
  late AudioCache audioCache;
  // final path = 'assets/songs/1.mp3';
 

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache();
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    // audioCache.load(path);
  }

  playMusic() async {
    await audioPlayer.play(AssetSource('$Path()'));
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
        body: FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
      builder: (context, item) {
        if (item.hasData) {
          Map? jsonMap = jsonDecode(item.data!);
          List? songs = jsonMap?.keys.toList();

          return ListView.builder(
            itemCount: songs?.length,
            itemBuilder: (context, index) {
              var path = songs![index].toString();
              var title = path.split("/").last.toString();
              title = title.replaceAll("%20", '');
              title = title.split('.').first;

              return Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid)),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text(title),
                  subtitle: Text(
                    "path: $path",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  leading: Icon(
                    audioPlayerState == PlayerState.playing
                        ? Icons.pause_circle_rounded
                        : Icons.play_arrow_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    toast(context, ' $title');
                    audioPlayerState == PlayerState.playing
                        ? pauseMusic()
                        : playMusic();
                  },
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
    ));
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }
}
