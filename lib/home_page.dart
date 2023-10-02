import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_picker/picker.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/contact_page.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/widget/app_text.dart';

import 'components/caller_ui_page.dart';
import 'utils/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppAudio? selectedAudio;
  Contact? selectedContact;
  Duration? selectedDuration;

  String name = networkFiles.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: const [
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
          ), //print a  time in text box
          child: Text(
            "Selected time: ${selectedDuration?.inMinutes ?? 0} minutes ${selectedDuration?.inSeconds ?? 0} seconds",
            style: const TextStyle(color: Colors.green),
          ),
        ),

        Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: MaterialButton(
              onPressed: () async {
                final audio =
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const CallerVoice()));
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
                final audio = await Navigator.push(context, MaterialPageRoute(builder: (context) => const Ringtone()));
                if (audio is AppAudio) {
                  selectedAudio = audio;
                }
                setState(() {});
              },
              child: const Text("Ringtone"),
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
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: MaterialButton(
              onPressed: () async {
                final contact =
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                if (contact is Contact) {
                  selectedContact = contact;
                }
              },
              child: const Text('Select a number'),
            )),

        if (selectedContact != null)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Selected contact: ${selectedContact?.displayName}",
              style: const TextStyle(color: Colors.green),
            ),
          ),

        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: MaterialButton(
              onPressed: () async {
                if (selectedContact == null) {
                  toast(context, "Please select a contact first");
                  return;
                }
                if (selectedAudio == null) {
                  toast(context, "Please select a ringtone first");
                  return;
                }
                if (selectedDuration == null) {
                  toast(context, "Please select a duration first");
                  return;
                }

                log("Calling ${selectedContact?.displayName} with ${selectedAudio?.name} for ${selectedDuration?.inMinutes} minutes");
                Timer(selectedDuration!, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CallerProfilePage(contact: selectedContact!, audio: selectedAudio!)));
                });
              },
              child: const Text('call me'),
            ))
      ])
    ]));
  }

  onTap() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(begin: 0, end: 60, suffix: Text(' minutes'), jump: 0),
        const NumberPickerColumn(begin: 0, end: 60, suffix: Text('seconds'), jump: 5)
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            //          decoration: const BoxDecoration(
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
            child: const Icon(Icons.more_vert),
          ),
        )
      ],
      confirmText: 'OK',
      onSelect: (picker, index, selected) {
        if (index == 0) {
          toast(context, 'Please select a time');
          return;
        }
        print(selected.toString());
        // print a time in text box when selected
      },
      onCancel: () {
        debugPrint('cancel');
      },
      confirmTextStyle: const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select Time'),
      hideHeader: true,
      height: 200.0,
      backgroundColor: Colors.white,
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here

        Duration resultingDuration = Duration(minutes: value[1], seconds: value[1]);
        // Duration(minutes: 0, seconds: 0) is the default value
        selectedDuration = resultingDuration;

        setState(() {});
      },
    ).showDialog(context);
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));

//   void time() async {
//     var resultingDuration = await showDurationPicker(
//         decoration:  const BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey,
//         blurRadius: 20.0, // Soften the shadow
//         spreadRadius: 2.0,
//         offset: Offset(0.0, 0.0),
//       )
//     ],
//   ),
//         context: context,
//         initialTime: const Duration(minutes: 0),
//         baseUnit: BaseUnit.minute);
  }
}
