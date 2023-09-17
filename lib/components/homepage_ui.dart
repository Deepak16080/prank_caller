import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:prank_caller/components/caller_ui_page.dart';
import 'package:prank_caller/components/caller_voice.dart';
import 'package:prank_caller/components/contact.dart';
import 'package:prank_caller/components/ringtone.dart';
import 'package:prank_caller/models/ringtone_model_list.dart';
import 'package:prank_caller/utils/enums.dart';
import 'package:prank_caller/widget/app_text.dart';

class HomepageUi extends StatefulWidget {
  const HomepageUi({super.key});

  @override
  State<HomepageUi> createState() => _HomepageUiState();
}

class _HomepageUiState extends State<HomepageUi> {
  AppAudio? selectedAudio;
  Contact? selectedContact;
  Duration? selectedDuration;

  String name = networkFiles.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width * 2.80,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 200, top: 40),
                    child: AppText('Prank call',
                        style: TextStyle(
                          fontSize: 35,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 120, top: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: AppText(
                        'You can have a imaginary friend to save your intimity ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 290, top: 50),
                    child: AppText(
                      'Settings',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 190),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      //=============> Container 1st
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: CustomPaint(
                        size: Size(600, (500 * 0.625).toDouble()),
                        //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          final audio = await Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const CallerVoice()));
                          if (audio is AppAudio) {
                            selectedAudio = audio;
                          }
                        },
                        child: SizedBox(
                          //============> Container 2nd
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: CustomPaint(
                            size: Size(
                                500,
                                (600 * 0.625)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RSCustomPainter(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () async {
                          final audio =
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => const Ringtone()));
                          if (audio is AppAudio) {
                            selectedAudio = audio;
                          }
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            //============> Container 3rd
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: CustomPaint(
                              size: Size(
                                  400,
                                  (400 * 0.625)
                                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: RCustomPainter(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      final contact =
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                      if (contact is Contact) {
                        selectedContact = contact;
                      }
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    ' select a Contact number  ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              if (selectedContact != null)
                                Text(
                                  '"Selected contact: ${selectedContact?.displayName}",',
                                  style: const TextStyle(color: Colors.white),
                                ),
                            ],
                          ),
                        ])),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       InkWell(
                  //         onTap: () async {
                  //           final contact = await Navigator.push(
                  //               context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                  //           if (contact is Contact) {
                  //             selectedContact = contact;
                  //           }
                  //         },
                  //   child: SizedBox(
                  //     //============> Container 4th
                  //     height: MediaQuery.of(context).size.height * 0.20,
                  //     width: MediaQuery.of(context).size.width * 0.40,
                  //     child: CustomPaint(
                  //       size: Size(
                  //           400,
                  //           (400 * 0.625)
                  //               .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  //       painter: SCustomPainter(),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //               child: SizedBox(
                  //                 //=========> Container 5th
                  //                 height: MediaQuery.of(context).size.height * 0.20,
                  //                 width: MediaQuery.of(context).size.width * 0.40,
                  //                 child: CustomPaint(
                  //                   size: Size(
                  //                       400,
                  //                       (400 * 0.625)
                  //                           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  //                   painter: FCustomPainter(),
                  //                 ),
                  //               ),
                  //     ),
                  //   ],
                  // ),
                  // )
                  SizedBox(
                    height: 50,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.95,
                  //   height: MediaQuery.of(context).size.height * 0.80,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
                  //     boxShadow: const [
                  //       BoxShadow(blurRadius: 30.0, blurStyle: BlurStyle.outer, spreadRadius: 10),
                  //     ],
                  //   ),
                  //   child:

                  SizedBox(
                    height: 35,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid)),
                      onPressed: () {
                        if (selectedContact == null) {
                          toast(context, "Please select a contact first");
                          return;
                        }
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CallerProfilePage(contact: selectedContact!)));
                      },
                      splashColor: Colors.blueAccent,
                      textColor: Colors.green,
                      child: Text('Call Me')),
                ],
              ),
            ),
          ]),
        ));
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }
}
// Container 1

// 3rd  container color = Color(0xfff5b942)

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawImage(myBackground, const Offset(0, 0), Paint());
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3637500, size.height * 0.4780000);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Square

    Paint paintFill1 = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.035, size.height * 0.46);
    path_1.lineTo(size.width * 0.96, size.height * 0.46);
    path_1.lineTo(size.width * 0.95, size.height * 0.839);
    path_1.lineTo(size.width * 0.035, size.height * 0.99);
    path_1.lineTo(size.width * 0.035, size.height * 0.46);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = Colors.indigo
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
            color: Colors.white,
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
    final pivot_9886373671211 = Offset(size.width * 0.36, size.height * 0.71); //0.67
    canvas.translate(pivot_9886373671211.dx, pivot_9886373671211.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_9886373671211.dx, -pivot_9886373671211.dy);
    TextPainter tp_9886373671211 = TextPainter(
      text: TextSpan(
          text: """write a time""",
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
          text: """""", //  add an image here
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
    // Square

    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0268500, size.height * -0.2853200);
    path_1.lineTo(size.width * 1.1401375, size.height * -0.3954800);
    path_1.lineTo(size.width * 0.9609375, size.height * 1.1401200);
    path_1.lineTo(size.width * -0.0435375, size.height * 1.1575600);
    path_1.lineTo(size.width * -0.0268500, size.height * -0.2853200);
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
    final pivot_2595468895997 = Offset(size.width * 0.32, size.height * 0.40);
    canvas.translate(pivot_2595468895997.dx, pivot_2595468895997.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_2595468895997.dx, -pivot_2595468895997.dy);
    TextPainter tp_2595468895997 = TextPainter(
      text: TextSpan(
          text: """Caller Voice""",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_2595468895997.paint(canvas, pivot_2595468895997);
    canvas.restore();

    // Text Layer 1

    canvas.save();
    final pivot_4423658027330 = Offset(size.width * 0.30, size.height * 0.60);
    canvas.translate(pivot_4423658027330.dx, pivot_4423658027330.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_4423658027330.dx, -pivot_4423658027330.dy);
    TextPainter tp_4423658027330 = TextPainter(
      text: TextSpan(
          text: """ selected callervoice""",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_4423658027330.paint(canvas, pivot_4423658027330);
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
    AppAudio? selectedAudio;

    // Square

    Paint paintFill1 = Paint()
      ..color = Color(0xfff5b942)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0034750, size.height * -0.4610600);
    path_1.lineTo(size.width * 1.0987627, size.height * -0.6047200);
    path_1.lineTo(size.width * 1.0805524, size.height * 1.1830443);
    path_1.lineTo(size.width * -0.1887625, size.height * 1.1950200);
    path_1.lineTo(size.width * -0.0034750, size.height * -0.4610600);
    path_1.close();

    canvas.drawPath(path_1, paintFill1);

    // Square

    Paint paintStroke1 = Paint()
      ..color = Color(0xfff5b942)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paintStroke1);

    // Text Layer 1

    canvas.save();
    final pivot_1862841806438 = Offset(size.width * 0.32, size.height * 0.40);
    canvas.translate(pivot_1862841806438.dx, pivot_1862841806438.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_1862841806438.dx, -pivot_1862841806438.dy);
    TextPainter tp_1862841806438 = TextPainter(
      text: TextSpan(
          text: """Ringtone""",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_1862841806438.paint(canvas, pivot_1862841806438);
    canvas.restore();

    // Text Layer 1
    // ignore: unnecessary_null_comparison
    canvas.save();
    final pivot_3398802305277 = Offset(size.width * 0.31, size.height * 0.60);
    canvas.translate(pivot_3398802305277.dx, pivot_3398802305277.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3398802305277.dx, -pivot_3398802305277.dy);
    TextPainter tp_3398802305277 = TextPainter(
      text: TextSpan(
          // ignore: dead_code
          text: """ Selected ringtone: ${selectedAudio?.name?.replaceAll("", "").replaceAll(".mp3", "")}""",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
    tp_3398802305277.paint(canvas, pivot_3398802305277);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// container 4
// class RCustomPainter extends CustomPainter {
//   Contact? selectedContact;
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Layer 1

//     Paint paintFill0 = Paint()
//       ..color = Color(0xff4266f5)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.6312500, size.height * 0.5580000);

//     canvas.drawPath(path_0, paintFill0);

//     // Layer 1

//     Paint paintStroke0 = Paint()
//       ..color = Color(0xff4266f5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_0, paintStroke0);

//     // Square

//     Paint paintFill1 = Paint()
//       ..color = Color(0xff4266f5)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_1 = Path();
//     path_1.moveTo(size.width * 0.34, size.height * 0.03);
//     path_1.lineTo(size.width * 0.87, size.height * 0.03);
//     path_1.lineTo(size.width * 1.02, size.height * 0.94);
//     path_1.lineTo(size.width * 0.34, size.height * 0.96);
//     path_1.lineTo(size.width * 0.34, size.height * 0.03);
//     path_1.close();

//     canvas.drawPath(path_1, paintFill1);

//     // Square

//     Paint paintStroke1 = Paint()
//       ..color = Color(0xff4266f5)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.06
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     canvas.drawPath(path_1, paintStroke1);

//     // Text Layer 1

//     canvas.save();
//     final pivot_945982681551 = Offset(size.width * 0.51, size.height * 0.22);
//     canvas.translate(pivot_945982681551.dx, pivot_945982681551.dy);
//     canvas.rotate(0.0);
//     canvas.translate(-pivot_945982681551.dx, -pivot_945982681551.dy);
//     TextPainter tp_945982681551 = TextPainter(
//       text: TextSpan(
//           text: """ """, // add an image
//           style: TextStyle(
//             fontSize: size.width * 0.03,
//             fontWeight: FontWeight.normal,
//             color: Color(0xff000000),
//             fontStyle: FontStyle.normal,
//             decoration: TextDecoration.none,
//           )),
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.left,
//     )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
//     tp_945982681551.paint(canvas, pivot_945982681551);
//     canvas.restore();

//     // Text Layer 1
//     {
//       canvas.save();
//     }
//     final pivot_4389557702333 = Offset(size.width * 0.44, size.height * 0.46);
//     canvas.translate(pivot_4389557702333.dx, pivot_4389557702333.dy);
//     canvas.rotate(0.0);
//     canvas.translate(-pivot_4389557702333.dx, -pivot_4389557702333.dy);
//     TextPainter tp_4389557702333 = TextPainter(
//       text: TextSpan(
//           text: """ Select a Contact""",
//           style: TextStyle(
//             fontSize: size.width * 0.06,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontStyle: FontStyle.normal,
//             decoration: TextDecoration.none,
//           )),
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.left,
//     )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
//     tp_4389557702333.paint(canvas, pivot_4389557702333);
//     canvas.restore();

//     // Text Layer 1
//     if (selectedContact != null) {
//       canvas.save();
//     }
//     final pivot_84 = Offset(size.width * 0.58, size.height * 0.64);
//     canvas.translate(pivot_84.dx, pivot_84.dy);
//     canvas.rotate(0.0);
//     canvas.translate(-pivot_84.dx, -pivot_84.dy);
//     TextPainter tp_8490036281206 = TextPainter(
//       text: TextSpan(
//           text: """Selected contact: ${selectedContact?.displayName}""",
//           style: TextStyle(
//             fontSize: size.width * 0.03,
//             fontWeight: FontWeight.normal,
//             color: Colors.white,
//             fontStyle: FontStyle.normal,
//             decoration: TextDecoration.none,
//           )),
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.left,
//     )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
//     tp_8490036281206.paint(canvas, pivot_84);
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// // container 5
// class FCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Square

//     Paint paintFill1 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_1 = Path();
//     path_1.moveTo(size.width * -0.0016750, size.height * 0.0372800);
//     path_1.lineTo(size.width * 0.6255250, size.height * 0.0345800);
//     path_1.lineTo(size.width * 0.6255000, size.height * 0.9502000);
//     path_1.lineTo(size.width * 0.1464250, size.height * 0.9583200);
//     path_1.lineTo(size.width * -0.0016750, size.height * 0.0372800);
//     path_1.close();

//     canvas.drawPath(path_1, paintFill1);

//     // Square

//     Paint paintStroke1 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.06
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     canvas.drawPath(path_1, paintStroke1);

//     // Text Layer 1

//     canvas.save();
//     final pivot_9853522823899 = Offset(size.width * 0.22, size.height * 0.44);
//     canvas.translate(pivot_9853522823899.dx, pivot_9853522823899.dy);
//     canvas.rotate(0.0);
//     canvas.translate(-pivot_9853522823899.dx, -pivot_9853522823899.dy);
//     TextPainter tp_9853522823899 = TextPainter(
//       text: TextSpan(
//           text: """More""",
//           style: TextStyle(
//             fontSize: size.width * 0.06,
//             fontWeight: FontWeight.bold,
//             color: Color(0xfffffafa),
//             fontStyle: FontStyle.normal,
//             decoration: TextDecoration.none,
//           )),
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.left,
//     )..layout(maxWidth: size.width * 0.50, minWidth: size.width * 0.50);
//     tp_9853522823899.paint(canvas, pivot_9853522823899);
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
