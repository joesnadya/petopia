import 'package:flutter/material.dart';
import 'package:petopia/theme.dart';

Widget buttonWidget(
  context, {
  required void Function() onTap,
  required String textButton,
  double? circularButton,
  Color? colorButton,
  Color? colorText,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton ?? kPurpleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularButton ?? 10),
        ),
      ),
      child: Text(
        textButton,
        style: bodytitle.copyWith(
          color: colorText ?? kDarkWhiteColor,
        ),
      ),
    ),
  );
}
