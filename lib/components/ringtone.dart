import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Ringtone extends StatefulWidget {
  const Ringtone({super.key});

  @override
  State<Ringtone> createState() => _RingtoneState();
}

class _RingtoneState extends State<Ringtone> {
  final AudioPlayer audioPlayer = AudioPlayer();
  List<String> selecteditem = [];
  int selectindex = -1;
 


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
                  print(selectindex);
                },
                child: const Text(
                  'Select',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: FutureBuilder<String>(
          future:
              DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
          builder: (context, item) {
            if (item.hasData) {
              Map? jsonMap = jsonDecode(item.data!);
              List? songs = jsonMap?.keys.toList();

              return ListView.builder(
                itemCount: songs?.length,
                itemBuilder: (context, index) {
                  // var selectindex = songs.toString();
                  var path = songs![index].toString();
                  var title = path.split("/").last.toString();
                  title = title.replaceAll("%20", '');
                  title = title.split('.').first;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectindex = index;
                      });
                      toast(context, ' selected');
                    },
                    child: Card(
                      shadowColor: Colors.green,
                      color: selectindex == index ? Colors.red : Colors.white,
                      margin: const EdgeInsets.only(
                          top: 10.0, left: 15.0, right: 15.0),
                      child: ListTile(
                        textColor: Colors.blue,
                        title: Text(title),
                        // subtitle: Text(
                        //   "path: $path",
                        //   style:
                        //       const TextStyle(color: Colors.white, fontSize: 12),
                        // ),
                        leading: IconButton(onPressed: () async{
                          
                          await audioPlayer.setAsset(path);
                          await audioPlayer.play();
                        }, icon: const Icon(Icons.play_arrow),color: Colors.blue,),
                        // onTap: () async {
                        //   setState(() {
                        //     selectindex = index;
                        //   });
                          // toast(context, ' $title');
                          
                          // await audioPlayer.setSourceAsset(path);
                          // await audioPlayer.play(AssetSource(path));
                          // audioPlayerState == PlayerState.playing
                          //     ? pauseMusic()
                          //     : playMusic();
                        // },
                      ),
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
        floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: const Text('Select from files'),
        icon: const Icon(Icons.drive_file_move),),
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
