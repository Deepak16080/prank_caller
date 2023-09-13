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
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 200,
                  width: 400,
                  child: CustomPaint(
                    size: Size(400, (400 * 0.625).toDouble()),
                    //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 300,
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
                  width: 300,
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
              height: 15,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 300,
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
                    width: 300,
                    child: CustomPaint(
                      size: Size(
                          400,
                          (400 * 0.625)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: FCustomPainter(),
                      child: SizedBox(
                          child: CircleAvatar(
                              minRadius: 20,
                              maxRadius: 20,
                              backgroundImage: AssetImage(
                                'assets/Profile/profile2.png',
                              ))),
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
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3637500, size.height * 0.4780000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0350625, size.height * 0.4630200);
    path_1.lineTo(size.width * 0.9667750, size.height * 0.4630200);
    path_1.lineTo(size.width * 0.9534875, size.height * 0.8396800);
    path_1.lineTo(size.width * 0.0350625, size.height * 0.9939600);
    path_1.lineTo(size.width * 0.0350625, size.height * 0.4630200);
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
    final pivot_5527597125177 = Offset(size.width * 0.36, size.height * 0.53);
    canvas.translate(pivot_5527597125177.dx, pivot_5527597125177.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_5527597125177.dx, -pivot_5527597125177.dy);
    TextPainter tp_5527597125177 = TextPainter(
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
    tp_5527597125177.paint(canvas, pivot_5527597125177);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_9886373671211 = Offset(size.width * 0.36, size.height * 0.67);
    canvas.translate(pivot_9886373671211.dx, pivot_9886373671211.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_9886373671211.dx, -pivot_9886373671211.dy);
    TextPainter tp_9886373671211 = TextPainter(
      text: TextSpan(
          text: """Hello world""",
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
    tp_9886373671211.paint(canvas, pivot_9886373671211);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_7674689915787 = Offset(size.width * 0.10, size.height * 0.65);
    canvas.translate(pivot_7674689915787.dx, pivot_7674689915787.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7674689915787.dx, -pivot_7674689915787.dy);
    TextPainter tp_7674689915787 = TextPainter(
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
    tp_7674689915787.paint(canvas, pivot_7674689915787);
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
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3637500, size.height * 0.4780000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3249250, size.height * 0.0604400);
    path_1.lineTo(size.width * 0.9678250, size.height * 0.0018200);
    path_1.lineTo(size.width * 0.8695375, size.height * 0.9578800);
    path_1.lineTo(size.width * 0.3349000, size.height * 0.9711800);
    path_1.lineTo(size.width * 0.3249250, size.height * 0.0604400);
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
    final pivot_4922996302460 = Offset(size.width * 0.52, size.height * 0.50);
    canvas.translate(pivot_4922996302460.dx, pivot_4922996302460.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_4922996302460.dx, -pivot_4922996302460.dy);
    TextPainter tp_4922996302460 = TextPainter(
      text: TextSpan(
          text: """Caller Voice""",
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
    tp_4922996302460.paint(canvas, pivot_4922996302460);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_5254258018463 = Offset(size.width * 0.51, size.height * 0.67);
    canvas.translate(pivot_5254258018463.dx, pivot_5254258018463.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_5254258018463.dx, -pivot_5254258018463.dy);
    TextPainter tp_5254258018463 = TextPainter(
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
    tp_5254258018463.paint(canvas, pivot_5254258018463);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_7379452923972 = Offset(size.width * 0.49, size.height * 0.25);
    canvas.translate(pivot_7379452923972.dx, pivot_7379452923972.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_7379452923972.dx, -pivot_7379452923972.dy);
    TextPainter tp_7379452923972 = TextPainter(
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
    tp_7379452923972.paint(canvas, pivot_7379452923972);
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
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5787500, size.height * 0.5460000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0800000, size.height * -0.0241200);
    path_1.lineTo(size.width * 0.5931125, size.height * -0.0721200);
    path_1.lineTo(size.width * 0.5531125, size.height * 0.9748200);
    path_1.lineTo(size.width * -0.0250000, size.height * 0.9628200);
    path_1.lineTo(size.width * 0.0800000, size.height * -0.0241200);
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
    final pivot_2077906947162 = Offset(size.width * 0.21, size.height * 0.44);
    canvas.translate(pivot_2077906947162.dx, pivot_2077906947162.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_2077906947162.dx, -pivot_2077906947162.dy);
    TextPainter tp_2077906947162 = TextPainter(
      text: TextSpan(
          text: """Ringtone""",
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
    tp_2077906947162.paint(canvas, pivot_2077906947162);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_3360721686832 = Offset(size.width * 0.21, size.height * 0.61);
    canvas.translate(pivot_3360721686832.dx, pivot_3360721686832.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3360721686832.dx, -pivot_3360721686832.dy);
    TextPainter tp_3360721686832 = TextPainter(
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
    tp_3360721686832.paint(canvas, pivot_3360721686832);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_2516557029649 = Offset(size.width * 0.24, size.height * 0.22);
    canvas.translate(pivot_2516557029649.dx, pivot_2516557029649.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_2516557029649.dx, -pivot_2516557029649.dy);
    TextPainter tp_2516557029649 = TextPainter(
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
    tp_2516557029649.paint(canvas, pivot_2516557029649);
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
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6312500, size.height * 0.5580000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3450000, size.height * 0.0315400);
    path_1.lineTo(size.width * 0.8786375, size.height * 0.0315400);
    path_1.lineTo(size.width * 1.0286375, size.height * 0.9474400);
    path_1.lineTo(size.width * 0.3425000, size.height * 0.9634400);
    path_1.lineTo(size.width * 0.3450000, size.height * 0.0315400);
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
    final pivot_945982681551 = Offset(size.width * 0.51, size.height * 0.22);
    canvas.translate(pivot_945982681551.dx, pivot_945982681551.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_945982681551.dx, -pivot_945982681551.dy);
    TextPainter tp_945982681551 = TextPainter(
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
    tp_945982681551.paint(canvas, pivot_945982681551);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_4389557702333 = Offset(size.width * 0.53, size.height * 0.46);
    canvas.translate(pivot_4389557702333.dx, pivot_4389557702333.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_4389557702333.dx, -pivot_4389557702333.dy);
    TextPainter tp_4389557702333 = TextPainter(
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
    tp_4389557702333.paint(canvas, pivot_4389557702333);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_8490036281206 = Offset(size.width * 0.53, size.height * 0.64);
    canvas.translate(pivot_8490036281206.dx, pivot_8490036281206.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_8490036281206.dx, -pivot_8490036281206.dy);
    TextPainter tp_8490036281206 = TextPainter(
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
    tp_8490036281206.paint(canvas, pivot_8490036281206);
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
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6612500, size.height * 0.5580000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0183125, size.height * 0.0292800);
    path_1.lineTo(size.width * 0.5616500, size.height * 0.0280000);
    path_1.lineTo(size.width * 0.5525000, size.height * 0.9503000);
    path_1.lineTo(size.width * 0.1325000, size.height * 0.9543000);
    path_1.lineTo(size.width * -0.0183125, size.height * 0.0292800);
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
    final pivot_379650780352 = Offset(size.width * 0.23, size.height * 0.50);
    canvas.translate(pivot_379650780352.dx, pivot_379650780352.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_379650780352.dx, -pivot_379650780352.dy);
    TextPainter tp_379650780352 = TextPainter(
      text: TextSpan(
          text: """Text""",
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
    tp_379650780352.paint(canvas, pivot_379650780352);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_3539612076627 = Offset(size.width * 0.21, size.height * 0.19);
    canvas.translate(pivot_3539612076627.dx, pivot_3539612076627.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3539612076627.dx, -pivot_3539612076627.dy);
    TextPainter tp_3539612076627 = TextPainter(
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
    tp_3539612076627.paint(canvas, pivot_3539612076627);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_5744230864546 = Offset(size.width * 0.22, size.height * 0.70);
    canvas.translate(pivot_5744230864546.dx, pivot_5744230864546.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_5744230864546.dx, -pivot_5744230864546.dy);
    TextPainter tp_5744230864546 = TextPainter(
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
    tp_5744230864546.paint(canvas, pivot_5744230864546);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
