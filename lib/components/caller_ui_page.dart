import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:prank_caller/components/pickup_ui.dart';
import 'package:prank_caller/utils/enums.dart';
import 'package:prank_caller/widget/app_text.dart';

import '../main.dart';
import '../widget/waBottomButton.dart';

class CallerProfilePage extends StatefulWidget {
  final Contact contact;
  final AppAudio audio;

  const CallerProfilePage({required this.contact, required this.audio, super.key});

  @override
  State<CallerProfilePage> createState() => _CallerProfilePageState();
}

class _CallerProfilePageState extends State<CallerProfilePage> {
  AppAudio get selectedAudio => widget.audio;

  @override
  void initState() {
    super.initState();
    selectedAudio.play();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '${selectedAudio.name?.replaceAll("", "").replaceAll(".mp3", "")}',
              style: TextStyle(color: Colors.transparent, fontSize: 2),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text.rich(
                  TextSpan(
                      text: 'Call via',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      children: const [
                        TextSpan(text: ' airtel', style: TextStyle(fontSize: 20, color: Colors.green)),
                        TextSpan(
                          text: ' from',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                )),
            Column(
              children: [
                AppText(
                  widget.contact.displayName,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            AppText(
              'Mobile ${widget.contact.phones.first.normalizedNumber}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 120,
                  ),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.message),
              label: Text('Reply'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: BottomButton(
                  pickUpPage: PickUpUi(
                      calleraudio: selectedAudio,
                      ontap: (
                        snack,
                      ) {},
                      contact: widget.contact),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
