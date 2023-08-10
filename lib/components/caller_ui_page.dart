import 'package:flutter/material.dart';
import 'package:prank_caller/components/pickup_ui.dart';

class CallerProfilePage extends StatefulWidget {
  const CallerProfilePage({super.key});

  @override
  State<CallerProfilePage> createState() => _CallerProfilePageState();
}

class _CallerProfilePageState extends State<CallerProfilePage> {
  String? name = 'Gaurav';
  String? no = '+917665070041';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Stack(children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey.shade400,
                    child: const Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    '$name',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '$no',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: 160,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: Colors.blueGrey.shade400),
                    child: const Text(
                      'Reply with message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const PickUpUi(),
                        ));
                  },
                  child: const Text('Ui call'),
                )
              ],
            ),
          ),
        ]));
  }
}


