import 'package:flutter/material.dart';
import 'package:petopia/theme.dart';

Widget bubbleWidget(String content, {bool? isSelected}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: kPurpleColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  content,
                  style: bodyStyle,
                ),
                Visibility(
                  visible:
                      (isSelected != null && isSelected == true) ? true : false,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: kPurpleColor,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
