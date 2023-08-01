import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.hasAnimation = false,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.isRich = false,
    this.padding = EdgeInsets.zero,
  });

  final String? text;
  final TextStyle? style;
  final bool isRich;

  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final EdgeInsets padding;

  final bool hasAnimation;

  Widget _wText() {
    if (isRich) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text ?? '',
              style: style,
              locale: locale,
            ),
          ],
        ),
        softWrap: softWrap ?? true,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines,
        textDirection: textDirection,
      );
    }
    return Text(
      text ?? '',
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
    );
  }

  Widget _wPadding() {
    return Padding(
      padding: padding,
      child: _wText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hasAnimation) return Hero(tag: text ?? '', child: _wPadding());
    return _wPadding();
  }
}
