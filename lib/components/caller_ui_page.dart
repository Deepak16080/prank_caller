import 'package:flutter/material.dart';
import 'package:prank_caller/components/pickup_ui.dart';
import 'package:prank_caller/widget/app_text.dart';

class CallerProfilePage extends StatefulWidget {
  const CallerProfilePage({super.key});

  @override
  State<CallerProfilePage> createState() => _CallerProfilePageState();
}

class _CallerProfilePageState extends State<CallerProfilePage> {
  String? name = 'Gaurav';
  String? no = '+917665070041';
  var text = RichText(
      text: TextSpan(
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
          children: const [TextSpan(text: 'airtel')]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 120),
            child: RichText(
                text: TextSpan(
                    text: 'call via ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: const [
                  TextSpan(
                    text: 'airtel',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  TextSpan(
                    text: ' from',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ])),
          ),
          Column(
            children: const [
              AppText(
                'Deepak Yadav',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                padding: EdgeInsets.only(bottom: 40),
              ),
            ],
          ),
          AppText(
            'Mobile +917665070041',
            style: TextStyle(fontSize: 15),
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
          Container(
            height: 45,
            width: 90,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PickUpUi(),
                    ));
              },
              icon: Icon(Icons.message),
            ),
          )
        ],
      ),
    );
  }
}
