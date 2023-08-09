import 'package:flutter/material.dart';

class PickUpUi extends StatefulWidget {
  const PickUpUi({super.key});

  @override
  State<PickUpUi> createState() => _PickUpUiState();
}

class _PickUpUiState extends State<PickUpUi> {
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
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '00:00',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mic),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}

