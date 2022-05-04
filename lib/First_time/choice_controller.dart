// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_eye/main.dart';

class ChoiceController extends GetxController {
  String permision = '';

  changeLang() {
    if (sharedPref!.getString('lang') == null) {
      Locale("en");
    } else if (sharedPref!.getString('lang') == "en") {
      Locale("en");
    } else {
      Locale("ar");
    }
  }

  changePermision(bool strr) {
    if (strr == false) {
      permision = 'With permision'.tr;
    } else {
      permision = 'Without permision'.tr;
    }
    update();
  }
}
