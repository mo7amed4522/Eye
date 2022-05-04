// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Font/Font_Controller.dart';
import '../Thems/color.dart';

FontController _controllera = Get.put(FontController());

Widget animatedOptacity(String text) {
  return AnimatedOpacity(
    duration: const Duration(
      milliseconds: 500,
    ),
    opacity: 0.99,
    child: Padding(
      padding: const EdgeInsets.only(
        left: 30,
        bottom: 16,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: DesignCourseAppTheme.nearlyBlue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: DesignCourseAppTheme.nearlyBlue.withOpacity(
                      0.5,
                    ),
                    offset: const Offset(
                      1.1,
                      1.1,
                    ),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: _controllera.defaultLArgeSize,
                    letterSpacing: 0.0,
                    color: DesignCourseAppTheme.nearlyWhite,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
