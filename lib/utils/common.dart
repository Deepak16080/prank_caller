import 'package:flutter/material.dart';

void toast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text, textAlign: TextAlign.center),
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ));
}

void boxToast(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text, textAlign: TextAlign.center),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        );
      });
}
