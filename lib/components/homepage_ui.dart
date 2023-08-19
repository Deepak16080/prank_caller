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
            child: ClipRect(
              child: Container(
                height: 100,
                width: 400 * 2,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        )
      ],
    ));
  }
}

// class MyClipper extends CustomClipper<Rect> {
//   @override
//   Future<Path> getClip(Size size) async {
//     Path path = Path();
//     path.moveTo(size.height, 0);
//     return Rect.fromLTWH(0, 0, size.width, size.height).Path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
// }
