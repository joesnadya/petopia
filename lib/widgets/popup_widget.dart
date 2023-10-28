import 'package:flutter/material.dart';
import 'package:petopia/theme.dart';

void showPopup(
  BuildContext context, {
  required String title,
  required String content,
  required Function() ontap,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: bodytitle,
        ),
        content: Text(
          content,
          style: bodyStyle,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: ontap,
            child: Text(
              'Tutup',
              style: kTextButton,
            ),
          ),
        ],
      );
    },
  );
}
