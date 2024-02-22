import 'package:flutter/material.dart';

bool showtoast = false;

void toast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text, textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    onVisible: () {
      Future.delayed(Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
    },
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ));
  showtoast = true;
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
