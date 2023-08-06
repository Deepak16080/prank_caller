import 'package:duration_picker/duration_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';

import 'package:prank_caller/widget/app_text.dart';

import 'utils/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer? audioPlayer;
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   audioPlayer?.stop();
  //   super.dispose();
  // }

  AppAudio? selectedAudio;
  String name = networkFiles.toString();
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
                  onTap();
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
                final audio = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CallerVoice()));
                if (audio is AppAudio) {
                  selectedAudio = audio;
                }
              },
              child: const Text('voice '),
            )),
        // if (selectedVoicecall != null)
        //   Padding(
        //     padding: const EdgeInsets.only(
        //       left: 20,
        //     ),
        //     child: Text(
        //       "Selected callerVoice: ${selectedVoicecall?.replaceAll('assets/song/', '').replaceAll('.mp3', '')}",
        //       style: const TextStyle(color: Colors.green),
        //     ),
        //   ),
        Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: MaterialButton(
              onPressed: () async {
                final audio = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ringtone()));
                if (audio is AppAudio) {
                  selectedAudio = audio;
                }
                setState(() {});
              },
              child: Text("Ringtone"),
            )),
        if (selectedAudio != null)
          GestureDetector(
            onTap: () {
              selectedAudio?.play();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Selected ringtone: ${selectedAudio?.name?.replaceAll("", "").replaceAll(".mp3", "")}",
                style: TextStyle(color: Colors.green),
              ),
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

  void onTap() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' minutes'), jump: 0),
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text('seconds'), jump: 5)
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            //         decoration: const BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey,
            //       blurRadius: 20.0, // Soften the shaodw
            //       spreadRadius: 2.0,
            //       offset: Offset(0.0, 0.0),
            //     )
            //   ],
            // ),
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ),
        )
      ],
      hideHeader: true,
      confirmText: 'OK',
      onSelect: (picker, index, selected) {

        setState(() {
        print('value is printed but not showing');
        });
      },
      confirmTextStyle:
          TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select Time'),
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here
        Duration _duration = Duration(
            minutes: picker.getSelectedValues()[1],
            seconds: picker.getSelectedValues()[1]);
      },
    ).showDialog(context);
  }

//   void time() async {
//     var resultingDuration = await showDurationPicker(
//         decoration:  const BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey,
//         blurRadius: 20.0, // Soften the shaodw
//         spreadRadius: 2.0,
//         offset: Offset(0.0, 0.0),
//       )
//     ],
//   ),
//         context: context,
//         initialTime: const Duration(minutes: 0),
//         baseUnit: BaseUnit.minute);
//   }
}
