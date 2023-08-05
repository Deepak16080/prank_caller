import 'package:duration_picker/duration_picker.dart';

import 'package:flutter/material.dart';

import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';

import 'package:prank_caller/widget/app_text.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedRingtone;
  String? selectedVoicecall;
  String name = lists.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 100, top: 40),
            child: AppText('Prank call',
                style: TextStyle(
                  fontSize: 35,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              height: 90,
              width: 250,
              child: AppText(
                'You can have a imaginary friend to save your intimity ',
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 180, top: 50),
            child: AppText(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 280),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  time();
                });
              },
              child: const Text('Timer'),
            )),
        Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: MaterialButton(
              onPressed: () async {
                selectedVoicecall = await
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CallerVoice()));
              },
            
              child: const Text('voice '),
            )),
              if (selectedVoicecall != null)
               Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Selected callerVoice: ${selectedVoicecall?.replaceAll('assets/song/', '').replaceAll('.mp3', '')}",
              style: const TextStyle(color: Colors.green),
            ),
          ),

        Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: MaterialButton(
              onPressed: () async {
                selectedRingtone = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ringtone()));
                setState(() {});
              },
              child: Text("Ringtone"),
            )),
        if (selectedRingtone != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Selected ringtone: ${selectedRingtone?.replaceAll("assets/song/", "").replaceAll(".mp3", "")}",
              style: TextStyle(color: Colors.green),
            ),
          ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CallerProfilePage()));
              },
              child: const Text('call me'),
            )),
      ])
    ]));
  }

  void time() async {
    var resultingDuration = await showDurationPicker(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.transparent))),
        context: context,
        initialTime: const Duration(minutes: 0),
        baseUnit: BaseUnit.minute);
  }
}
