// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Thems/color.dart';

Widget getTimeBoxUI(
  String text1,
  String txt2,
  BuildContext context,
  double x,
  double y,
) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 5,
      bottom: 2,
      right: 5,
      top: 2,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: DesignCourseAppTheme.grey.withOpacity(
              0.2,
            ),
            offset: const Offset(
              1.1,
              1.1,
            ),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 12.0,
          bottom: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: x,
                letterSpacing: 0.27,
                color: DesignCourseAppTheme.nearlyBlue,
              ),
            ),
            Text(
              txt2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: y,
                letterSpacing: 0.27,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getTimeBoxUIPhoto(
  String name,
  String price,
  String imgPath,
  bool added,
  double x,
  bool isFavorite,
  index,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: DesignCourseAppTheme.grey.withOpacity(
              0.7,
            ),
            offset: const Offset(
              1.1,
              1.1,
            ),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 12.0,
          bottom: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imgPath,
              child: Container(
                height: 150.0,
                width: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imgPath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: x,
                letterSpacing: 0.27,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            Center(
              child: Text(
                price + " \$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: x,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void showSignOutDialog({
  required BuildContext context,
  required String text1,
  required String text2,
  onTap,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(
          20,
        ),
        actionsPadding: EdgeInsets.only(
          right: 60,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        title: Text(
          text1,
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          text2,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
            child: Text(
              "Log Out".tr,
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).buttonColor,
            ),
          ),
          TextButton(
            child: Text(
              "Cancel".tr,
              style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
