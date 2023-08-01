import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('AssetManiFest.json'),
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
                   await player.setSourceAsset(path);
                  await  player.play(AssetSource(path));
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
}
