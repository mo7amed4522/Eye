// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../Thems/color.dart';

Widget textData(String text, double size) {
  return Padding(
    padding: EdgeInsets.only(
      left: 25.0,
      right: 25.0,
      top: 25.0,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: size,
                color: DesignCourseAppTheme.nearlyBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
