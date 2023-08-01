import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  final AudioPlayer _player = AudioPlayer();
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
                  leading: const Icon(
                    Icons.audiotrack,
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    toast(context,'you selected : $title');
                    await _player.setAsset(path);
                    await _player.play();
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

  void toast(BuildContext context,String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }
}
