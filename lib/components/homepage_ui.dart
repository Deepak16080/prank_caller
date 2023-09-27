import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_picker/picker.dart';
import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/contact_page.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/utils/enums.dart';
import 'package:prank_caller/widget/app_text.dart';

class HomepageUi extends StatefulWidget {
  const HomepageUi({super.key});

  @override
  State<HomepageUi> createState() => _HomepageUiState();
}

class _HomepageUiState extends State<HomepageUi> {
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
                                  onTap: () {
                                    setState(() {
                                      onTap();
                                    });
                                  },
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
                                Text(
                                    "${selectedAudio?.name?.replaceAll("assets/callervoice/ ", "").replaceAll(".mp3", "")}",
                                    style: TextStyle(color: Colors.white)),
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
                                width: 20,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/images/contact.png'),
                              ),
                              SizedBox(
                                width: 10,
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
                              if (selectedContact == null)
                                Text(
                                  " contact ${selectedContact?.displayName}",
                                  style: TextStyle(
                                    color: Colors.white,
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
                      onPressed: () {
                        if (selectedContact == null) {
                          return toast(context, "Please select a contact first");
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallerProfilePage(
                                      contact: selectedContact!,
                                    )));
                      },
                      color: Colors.white,
                      splashColor: Colors.blueAccent,
                      textColor: Colors.green,
                      child: Text('Call Me')),
                ],
              ),
            ),
          ]),
        ));
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
          return toast(context, 'Please select a time');
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
  }
}
