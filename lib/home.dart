import 'dart:async';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/contact_page.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/utils/enums.dart';
import 'package:prank_caller/widget/app_text.dart';
import 'package:prank_caller/widget/box.dart';

import 'utils/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppAudio? selectedAudio;
  AppAudio? selectedRingtone;
  Contact? selectedContact;
  Duration? selectedDuration;
  Timer? callTimer;
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HBox(20),
                      Row(
                        children: const [
                          AppText('Prank call',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              )),
                          WBox(20),
                        ],
                      ),
                      AppText(
                        'You can have a imaginary friend to save your intimity ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                      HBox(20),
                      Expanded(
                        child: InkWell(
                          onTap: selectTimer,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.indigo[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage("assets/images/timer1.png"),
                                ),
                                WBox(20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      'Timer',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    HBox(8),
                                    Text(
                                      " ${selectedDuration?.inMinutes ?? 0} min ${selectedDuration?.inSeconds ?? 0} sec",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      HBox(10),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final voice = await Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const CallerVoice()));
                                  if (voice is AppAudio) {
                                    selectedRingtone = voice;
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.red[200],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage('assets/images/callervoice.png'),
                                      ),
                                      AppText('Caller Voice',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      if (selectedRingtone != null)
                                        GestureDetector(
                                          onTap: () {
                                            selectedRingtone?.play();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${selectedRingtone?.name?.replaceAll("assets/callervoice/", "").replaceAll(".mp3", "")}',
                                              style: TextStyle(color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            WBox(10),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final audio = await Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const Ringtone()));
                                  if (audio is AppAudio) {
                                    selectedAudio = audio;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage('assets/images/ringtone.png'),
                                      ),
                                      AppText('Ringtones',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      if (selectedAudio != null)
                                        GestureDetector(
                                          onTap: () {
                                            selectedAudio?.play();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              selectedAudio?.name ?? '',
                                              style: TextStyle(color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      HBox(10),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final contact = await Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                            if (contact is Contact) {
                              selectedContact = contact;
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Center(child: Text(' Request')),
                                          content: Text(
                                              'Do not select any empty contact , it may be crash your app and you will not able to call, it may fix as soon as possible, Donot close the app in the background'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Ok'))
                                          ],
                                        ));
                                // boxToast(context,
                                //     'Do not select any empty contact , it may be crash your app and you will not able to call, it may fix as soon as possible');
                              });
                            }
                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage('assets/images/contact.png'),
                                  ),
                                  WBox(10),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        selectedContact != null ? '${selectedContact?.displayName}' : 'Pick a contact',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      if (selectedContact != null)
                                        Text(
                                          selectedContact?.phones.first.normalizedNumber ?? "",
                                          style: TextStyle(color: Colors.white),
                                        )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                      HBox(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                onPressed: () async {
                  if (selectedContact == null) {
                    return toast(context, "Please select a contact first");
                  }
                  if (selectedAudio == null) {
                    return toast(context, "Please select a ringtone");
                  }

                  if (selectedDuration == null) {
                    return toast(context, "Please select a duration");
                  }
                  callTimer = Timer.periodic(Duration(seconds: 1), (timer) {
                    selectedDuration = selectedDuration! - Duration(seconds: 1);
                    setState(() {});
                    if (selectedDuration!.inSeconds == 0) {
                      callTimer?.cancel();
                      callTimer = null;
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CallerProfilePage(
                                    contact: selectedContact!,
                                    audio: selectedAudio!,
                                    // calleraudio: selectedRingtone!,
                                  )));
                    }
                  });
                  setState(() {});
                },
                color: Colors.white,
                textColor: Colors.green,
                child: Text(
                    callTimer == null
                        ? 'Call Me'
                        : 'Calling in ${selectedDuration?.inMinutes ?? 0} min ${selectedDuration?.inSeconds ?? 0} sec',
                    style: TextStyle(fontSize: 20))),
          ),
        ]));
  }

  selectTimer() async {
    selectedDuration =
        await showDurationPicker(context: context, initialTime: const Duration(minutes: 0), baseUnit: BaseUnit.second);
    setState(() {});
  }
}
