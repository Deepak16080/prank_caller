import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/contact_page.dart';
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
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/Profile/Profile2.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
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
                                SizedBox(
                                  height: 8,
                                ),
                                Text('its a timer')
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
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 40,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/Profile/Profile2.png'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AppText('CallerVoice',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 40,
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/Profile/Profile2.png'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              AppText('Ringtones',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
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
                              if (selectedContact != null)
                                Text(
                                  " ${selectedContact?.displayName}",
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                            ],
                          ),
                        ])),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                      onPressed: () {
                        if (selectedContact == null) {
                          toast(context, "Please select a contact first");
                          return;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CallerProfilePage(
                                      contact: selectedContact!,
                                    )));
                      },
                      splashColor: Colors.blueAccent,
                      textColor: Colors.green,
                      child: Text('Call Me')),
                ],
              ),
            ),
          ]),
        ));
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }
}
