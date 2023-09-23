// import 'dart:async';
// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:prank_caller/components/homepage_ui.dart';

// class CircularImageWidget extends StatelessWidget {
//   final String imageUrl;

//   const CircularImageWidget({super.key, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(100, 100), // Set the size of the circular image
//       painter: CircularImagePainter(imageProvider: NetworkImage(imageUrl)),
//     );
//   }
// }

// class CircularImagePainter extends CustomPainter {
//   final ImageProvider imageProvider;

//   CircularImagePainter({required this.imageProvider});

//   @override
//   void paint(Canvas canvas, Size size) async {
//     final paint = Paint();
//     paint.isAntiAlias = true;

//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width / 2, size.height / 2);

//     final rect = Rect.fromCircle(center: center, radius: radius);
//     final image = await loadImage(imageProvider);
//     final shader = ImageShader(
//       image as ui.Image,
//       TileMode.clamp,
//       TileMode.clamp,
//       rect as Float64List,
//     );

//     paint.shader = shader;

//     canvas.drawCircle(center, radius, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false; // Since the image won't change, return false here.
//   }
// }

// class ImageLoader {
//   static Future<ByteData> loadImage(ImageProvider provider) async {
//     final completer = Completer<ByteData>();
//     final listener = ImageStreamListener((image, synchronousCall) async {
//       final byteData = await image.image.toByteData(format: ImageByteFormat.png);
//       completer.complete(byteData);
//     });

//     final stream = provider.resolve(ImageConfiguration.empty);
//     stream.addListener(listener);

//     return completer.future;
//   }
// }
