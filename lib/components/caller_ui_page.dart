import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:prank_caller/widget/app_text.dart';

class CallerProfilePage extends StatefulWidget {
  final Contact contact;
  const CallerProfilePage({required this.contact, super.key});

  @override
  State<CallerProfilePage> createState() => _CallerProfilePageState();
}

class _CallerProfilePageState extends State<CallerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 35,
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
                  backgroundImage: AssetImage('assets/Profile/Profile2.png'),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.message),
              label: Text('Reply'),
            )
          ],
        ),
      ),
    );
  }
}
