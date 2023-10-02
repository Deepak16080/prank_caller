import 'package:flutter/material.dart';

void toast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text, textAlign: TextAlign.center),
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ));
}
