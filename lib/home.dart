import 'dart:async';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/contact_page.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/utils/enums.dart';
import 'package:prank_caller/widget/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact>? contacts;
  AppAudio? selectedAudio;

  Contact? selectedContact;
  Duration? selectedDuration;
  final contact = Contact();

  String name = networkFiles.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width * 2.80,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 200, top: 40),
                    child: AppText('Prank call',
                        style: TextStyle(
                          fontSize: 35,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 120, top: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: AppText(
                        'You can have a imaginary friend to save your intimity ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 290, top: 0),
                    child: AppText(
                      'Settings',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 190),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.indigo[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage("assets/images/timer1.png"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: selectTimer,
                                  child: AppText(
                                    'Timer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  " ${selectedDuration?.inMinutes ?? 0} minutes ${selectedDuration?.inSeconds ?? 0} seconds",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/images/callervoice.png'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  final audio = await Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const CallerVoice()));
                                  if (audio is AppAudio) {
                                    selectedAudio = audio;
                                    setState(() {});
                                  }
                                },
                                child: AppText('CallerVoice',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              if (selectedAudio != null)
                                GestureDetector(
                                  onTap: () {
                                    selectedAudio?.play();
                                  },
                                  child: Text(
                                      '${selectedAudio!.name?.replaceAll("assets/callervoice/ ", "assets/callervoice/").replaceAll(".mp3", "assets/callervoice/")}',
                                      style: TextStyle(color: Colors.white)),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/images/ringtone.png'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  final audio = await Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const Ringtone()));
                                  if (audio is AppAudio) {
                                    selectedAudio = audio;
                                  }
                                  setState(() {});
                                },
                                child: AppText('Ringtones',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              if (selectedAudio != null)
                                GestureDetector(
                                  onTap: () {
                                    selectedAudio?.play();
                                  },
                                  child: Text(
                                    "${selectedAudio?.name?.replaceAll("", "").replaceAll(".mp3", "")}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      final contact =
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                      if (contact is Contact) {
                        selectedContact = contact;
                        setState(() {});
                      }
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 2,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/images/contact.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    ' select a Contact number  ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              if (selectedContact != null)
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    "${selectedContact?.displayName}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ])),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  MaterialButton(
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
                        Timer.periodic(Duration(seconds: 1), (timer) {
                          selectedDuration = selectedDuration! - Duration(seconds: 1);
                          setState(() {});
                          if (selectedDuration!.inSeconds == 0) {
                            timer.cancel();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CallerProfilePage(contact: selectedContact!, audio: selectedAudio!)));
                          }
                        });
                      },
                      color: Colors.white,
                      textColor: Colors.green,
                      child: Text('Call Me')),
                ],
              ),
            ),
          ]),
        ));
  }

  selectTimer() async {
    selectedDuration =
        await showDurationPicker(context: context, initialTime: const Duration(minutes: 0), baseUnit: BaseUnit.second);
    setState(() {});
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }
}
