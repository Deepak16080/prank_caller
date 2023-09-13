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
        body: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Center(
              child: SizedBox(
                height: 200,
                width: 400,
                child: CustomPaint(
                  size: Size(600, (500 * 0.625).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 250,
                  child: CustomPaint(
                    size: Size(
                        400,
                        (400 * 0.625)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RSCustomPainter(),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 250,
                  child: CustomPaint(
                    size: Size(
                        400,
                        (400 * 0.625)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RCustomPainter(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: CustomPaint(
                      size: Size(
                          400,
                          (400 * 0.625)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: SCustomPainter(),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 250,
                    child: CustomPaint(
                      size: Size(
                          400,
                          (400 * 0.625)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: FCustomPainter(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0237500, size.height * 0.1689400);
    path_1.lineTo(size.width * 0.9652000, size.height * 0.1689400);
    path_1.lineTo(size.width * 0.9664500, size.height * 0.5798400);
    path_1.lineTo(size.width * 0.0237500, size.height * 0.7758400);
    path_1.lineTo(size.width * 0.0237500, size.height * 0.1689400);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_8065428112827 = Offset(size.width * 0.36, size.height * 0.23);
    canvas.translate(pivot_8065428112827.dx, pivot_8065428112827.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_8065428112827.dx, -pivot_8065428112827.dy);
    TextPainter tp_8065428112827 = TextPainter(
      text: TextSpan(
          text: """Timer""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_8065428112827.paint(canvas, pivot_8065428112827);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_4309602916295 = Offset(size.width * 0.36, size.height * 0.36);
    canvas.translate(pivot_4309602916295.dx, pivot_4309602916295.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_4309602916295.dx, -pivot_4309602916295.dy);
    TextPainter tp_4309602916295 = TextPainter(
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
    tp_4309602916295.paint(canvas, pivot_4309602916295);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_1090205872968 = Offset(size.width * 0.07, size.height * 0.33);
    canvas.translate(pivot_1090205872968.dx, pivot_1090205872968.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_1090205872968.dx, -pivot_1090205872968.dy);
    TextPainter tp_1090205872968 = TextPainter(
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
    tp_1090205872968.paint(canvas, pivot_1090205872968);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Container 2

class RSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1387500, size.height * 0.0500000);
    path_1.lineTo(size.width * 0.8817000, size.height * 0.0500000);
    path_1.lineTo(size.width * 0.7542000, size.height * 0.9570000);
    path_1.lineTo(size.width * 0.1387500, size.height * 0.9590000);
    path_1.lineTo(size.width * 0.1387500, size.height * 0.0500000);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_7340779318369 = Offset(size.width * 0.34, size.height * 0.47);
    canvas.translate(pivot_7340779318369.dx, pivot_7340779318369.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7340779318369.dx, -pivot_7340779318369.dy);
    TextPainter tp_7340779318369 = TextPainter(
      text: TextSpan(
          text: """Timer""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_7340779318369.paint(canvas, pivot_7340779318369);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_5703397829801 = Offset(size.width * 0.34, size.height * 0.63);
    canvas.translate(pivot_5703397829801.dx, pivot_5703397829801.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_5703397829801.dx, -pivot_5703397829801.dy);
    TextPainter tp_5703397829801 = TextPainter(
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
    tp_5703397829801.paint(canvas, pivot_5703397829801);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_7204745642114 = Offset(size.width * 0.38, size.height * 0.23);
    canvas.translate(pivot_7204745642114.dx, pivot_7204745642114.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7204745642114.dx, -pivot_7204745642114.dy);
    TextPainter tp_7204745642114 = TextPainter(
      text: TextSpan(
          text: """Image""",
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
    tp_7204745642114.paint(canvas, pivot_7204745642114);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// container 3
class RCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1837500, size.height * 0.0440000);
    path_1.lineTo(size.width * 0.6363875, size.height * 0.0520000);
    path_1.lineTo(size.width * 0.6288875, size.height * 0.9578000);
    path_1.lineTo(size.width * 0.0425000, size.height * 0.9538000);
    path_1.lineTo(size.width * 0.1837500, size.height * 0.0440000);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_3954311561327 = Offset(size.width * 0.29, size.height * 0.40);
    canvas.translate(pivot_3954311561327.dx, pivot_3954311561327.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3954311561327.dx, -pivot_3954311561327.dy);
    TextPainter tp_3954311561327 = TextPainter(
      text: TextSpan(
          text: """Timer 2""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_3954311561327.paint(canvas, pivot_3954311561327);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_8031489718466 = Offset(size.width * 0.30, size.height * 0.57);
    canvas.translate(pivot_8031489718466.dx, pivot_8031489718466.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_8031489718466.dx, -pivot_8031489718466.dy);
    TextPainter tp_8031489718466 = TextPainter(
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
    tp_8031489718466.paint(canvas, pivot_8031489718466);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_2460821878240 = Offset(size.width * 0.32, size.height * 0.22);
    canvas.translate(pivot_2460821878240.dx, pivot_2460821878240.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_2460821878240.dx, -pivot_2460821878240.dy);
    TextPainter tp_2460821878240 = TextPainter(
      text: TextSpan(
          text: """image""",
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
    tp_2460821878240.paint(canvas, pivot_2460821878240);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// container 4
class SCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1387500, size.height * 0.0500000);
    path_1.lineTo(size.width * 0.8817000, size.height * 0.0500000);
    path_1.lineTo(size.width * 0.7542000, size.height * 0.9570000);
    path_1.lineTo(size.width * 0.1387500, size.height * 0.9590000);
    path_1.lineTo(size.width * 0.1387500, size.height * 0.0500000);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_7340779318369 = Offset(size.width * 0.34, size.height * 0.47);
    canvas.translate(pivot_7340779318369.dx, pivot_7340779318369.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7340779318369.dx, -pivot_7340779318369.dy);
    TextPainter tp_7340779318369 = TextPainter(
      text: TextSpan(
          text: """Timer""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_7340779318369.paint(canvas, pivot_7340779318369);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_5703397829801 = Offset(size.width * 0.34, size.height * 0.63);
    canvas.translate(pivot_5703397829801.dx, pivot_5703397829801.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_5703397829801.dx, -pivot_5703397829801.dy);
    TextPainter tp_5703397829801 = TextPainter(
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
    tp_5703397829801.paint(canvas, pivot_5703397829801);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_7204745642114 = Offset(size.width * 0.38, size.height * 0.23);
    canvas.translate(pivot_7204745642114.dx, pivot_7204745642114.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7204745642114.dx, -pivot_7204745642114.dy);
    TextPainter tp_7204745642114 = TextPainter(
      text: TextSpan(
          text: """Image""",
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
    tp_7204745642114.paint(canvas, pivot_7204745642114);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// container 5
class FCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1837500, size.height * 0.0440000);
    path_1.lineTo(size.width * 0.6363875, size.height * 0.0520000);
    path_1.lineTo(size.width * 0.6288875, size.height * 0.9578000);
    path_1.lineTo(size.width * 0.0425000, size.height * 0.9538000);
    path_1.lineTo(size.width * 0.1837500, size.height * 0.0440000);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_3954311561327 = Offset(size.width * 0.29, size.height * 0.40);
    canvas.translate(pivot_3954311561327.dx, pivot_3954311561327.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3954311561327.dx, -pivot_3954311561327.dy);
    TextPainter tp_3954311561327 = TextPainter(
      text: TextSpan(
          text: """Timer 2""",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_3954311561327.paint(canvas, pivot_3954311561327);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_8031489718466 = Offset(size.width * 0.30, size.height * 0.57);
    canvas.translate(pivot_8031489718466.dx, pivot_8031489718466.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_8031489718466.dx, -pivot_8031489718466.dy);
    TextPainter tp_8031489718466 = TextPainter(
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
    tp_8031489718466.paint(canvas, pivot_8031489718466);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_2460821878240 = Offset(size.width * 0.32, size.height * 0.22);
    canvas.translate(pivot_2460821878240.dx, pivot_2460821878240.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_2460821878240.dx, -pivot_2460821878240.dy);
    TextPainter tp_2460821878240 = TextPainter(
      text: TextSpan(
          text: """image""",
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
    tp_2460821878240.paint(canvas, pivot_2460821878240);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
