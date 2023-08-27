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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPaint(
            size: Size(600, (500 * 0.625).toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
        Row(
          children: [
            CustomPaint(
              size: Size(
                  400,
                  (400 * 0.625)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RSSCustomPainter(),
            ),
          ],
        )
      ],
    ));
  }
}
// Container 1

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0725000, size.height * 0.1280000);
    path_1.lineTo(size.width * 0.8125341, size.height * 0.1160000);
    path_1.lineTo(size.width * 0.8077125, size.height * 0.3519400);
    path_1.lineTo(size.width * 0.0712500, size.height * 0.4183200);
    path_1.lineTo(size.width * 0.0725000, size.height * 0.1280000);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    canvas.save();
    final pivot_1739013739183 = Offset(size.width * 0.27, size.height * 0.12);
    canvas.translate(pivot_1739013739183.dx, pivot_1739013739183.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_1739013739183.dx, -pivot_1739013739183.dy);
    TextPainter tp_1739013739183 = TextPainter(
      text: TextSpan(
          text: """Its me""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_1739013739183.paint(canvas, pivot_1739013739183);
    canvas.restore();

    // Text Layer 1 Copy

    canvas.save();
    final pivot_9049445329906 = Offset(size.width * 0.27, size.height * 0.24);
    canvas.translate(pivot_9049445329906.dx, pivot_9049445329906.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_9049445329906.dx, -pivot_9049445329906.dy);
    TextPainter tp_9049445329906 = TextPainter(
      text: TextSpan(
          text: """You Text Here""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_9049445329906.paint(canvas, pivot_9049445329906);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_4268002071757 = Offset(size.width * 0.14, size.height * 0.25);
    canvas.translate(pivot_4268002071757.dx, pivot_4268002071757.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_4268002071757.dx, -pivot_4268002071757.dy);
    TextPainter tp_4268002071757 = TextPainter(
      text: TextSpan(
          text: """image""", // add an Clock Icon
          style: TextStyle(
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_4268002071757.paint(canvas, pivot_4268002071757);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Container 2

class RSSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0875000, size.height * 0.4489902);
    path_1.lineTo(size.width * 0.3812619, size.height * 0.4489902);
    path_1.lineTo(size.width * 0.3387625, size.height * 0.9056400);
    path_1.lineTo(size.width * 0.0875000, size.height * 0.9076389);
    path_1.lineTo(size.width * 0.0875000, size.height * 0.4489902);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_7769681601317 = Offset(size.width * 0.11, size.height * 0.78);
    canvas.translate(pivot_7769681601317.dx, pivot_7769681601317.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_7769681601317.dx, -pivot_7769681601317.dy);
    TextPainter tp_7769681601317 = TextPainter(
      text: TextSpan(
          text: """You Text Here""",
          style: TextStyle(
            fontSize: size.width * 0.03,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_7769681601317.paint(canvas, pivot_7769681601317);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_9063518125987 = Offset(size.width * 0.13, size.height * 0.84);
    canvas.translate(pivot_9063518125987.dx, pivot_9063518125987.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_9063518125987.dx, -pivot_9063518125987.dy);
    TextPainter tp_9063518125987 = TextPainter(
      text: TextSpan(
          text: """You Text Here""",
          style: TextStyle(
            fontSize: size.width * 0.02,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_9063518125987.paint(canvas, pivot_9063518125987);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
