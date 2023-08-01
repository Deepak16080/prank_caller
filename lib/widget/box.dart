import 'package:flutter/material.dart';

/// Creates a fixed size box with [h] height.
/// The [width] parameter can be null to indicate that the size of the box should not be constrained in the corresponding width.
class HBox extends StatelessWidget {
  const HBox(this.h, {this.width, super.key});
  final double h;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: width,
    );
  }
}

/// Creates a fixed size box with [w] width.
/// The [height] parameter can be null to indicate that the size of the box should not be constrained in the corresponding height.
class WBox extends StatelessWidget {
  const WBox(this.w, {this.height, super.key});
  final double w;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: height,
    );
  }
}
