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
              clipper: MyClipper(),
              child: Container(
                height: 100,
                width: 200 * 6,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class MyClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    return RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(20));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}
