import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CallerVoice extends StatefulWidget {
  const CallerVoice({super.key});

  @override
  State<CallerVoice> createState() => _CallerVoiceState();
}

class _CallerVoiceState extends State<CallerVoice> {
  AudioPlayer audioPlayer = AudioPlayer();
  // PlayerState audioPlayerState = PlayerState.paused;
  // late AudioCache audioCache;
  // final path = 'assets/songs/1.mp3';

  // @override
  // void initState() {
  //   super.initState();
  //   audioCache = AudioCache();
  //   audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
  //     setState(() {
  //       audioPlayerState = s;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   audioPlayer.release();
  //   audioPlayer.dispose();
  //   // audioCache.load(path);
  // }

  // playMusic() async {
  //   await audioPlayer.play(AssetSource('$Path()'));
  // }

  // pauseMusic() async {
  //   await audioPlayer.pause();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: const BoxDecoration(
		             color: Colors.blue,
	            	borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text(title),
                  // subtitle: Text(
                  //   "path: $path",
                  //   style: const TextStyle(color: Colors.white, fontSize: 12),
                  // ),
                  leading: const Icon(
                    Icons.play_arrow,
                    // audioPlayerState == PlayerState.playing
                    //     ? Icons.pause_circle_rounded
                    //     : Icons.play_arrow_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    toast(context, ' $title');
                    // audioPlayerState == PlayerState.playing
                    //     ? pauseMusic()
                    //     : playMusic();
                   await audioPlayer.setAsset(path);
                        await audioPlayer.play();
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
