import 'package:flutter/material.dart';

class HomepageUi extends StatefulWidget {
  const HomepageUi({super.key});

  @override
  State<HomepageUi> createState() => _HomepageUiState();
}

class _HomepageUiState extends State<HomepageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  height: 100,
                  width: 200 * 6,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    'Hello World',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            ),
          ),
        )
      ],
    ));
  }
}
