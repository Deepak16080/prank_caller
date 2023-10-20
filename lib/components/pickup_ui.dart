import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:prank_caller/main.dart';
import 'package:prank_caller/utils/enums.dart';

class PickUpUi extends StatefulWidget {
  final Contact contact;
  final OnTap ontap;
  final AppAudio calleraudio;
  const PickUpUi({required this.contact, required this.ontap, required this.calleraudio, super.key});

  @override
  State<PickUpUi> createState() => _PickUpUiState();
}

class _PickUpUiState extends State<PickUpUi> {
  AppAudio get selectedRingtone => widget.calleraudio;
  Icon? icon = Icon(
    Icons.call,
    size: 10,
  );

  Duration _duration = Duration(seconds: 0);
  bool isTimerActive = false;
  late Timer time;
  void _startTimer() {
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration + Duration(seconds: 1);
      });
    });
    setState(() {
      isTimerActive = true;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRingtone.play();
    _startTimer();
  }

  void _stopTimer() {
    time.cancel();

    setState(() {
      isTimerActive = false;
    });
  }

  @override
  void dispose() {
    _stopTimer();
    PickUpUi(contact: widget.contact, ontap: (snack) {}, calleraudio: widget.calleraudio);
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    widget.contact.displayName,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.contact.phones.first.normalizedNumber,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)), color: Color(0xffE2F0F3)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.dialpad,
                                ),
                                alignment: Alignment.center,
                                iconSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mic_off_outlined,
                                ),
                                alignment: Alignment.center,
                                iconSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.volume_up_outlined,
                                ),
                                alignment: Alignment.center,
                                iconSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert_outlined,
                                ),
                                alignment: Alignment.center,
                                iconSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Dialpad',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Mute',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'speaker',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'more',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 35,
                          child: IconButton(
                            onPressed: () {
                              _stopTimer();

                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.call_end_outlined),
                            iconSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
