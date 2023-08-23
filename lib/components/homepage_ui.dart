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
        Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Image.asset('assets/images/Timer.png', fit: BoxFit.cover),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
              ),
              Container(
                height: 100,
                width: 100, // 200
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
