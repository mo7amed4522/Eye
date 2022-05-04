// ignore_for_file: unused_field, prefer_const_constructors, missing_return, unrelated_type_equality_checks, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../CustomDrower/CustomDrawer.dart';
import '../CustomerDrowerAR/CustomDrawerAR.dart';
import '../main.dart';

class MyLocalController extends GetxController {
  Locale? intialLang = sharedPref!.getString('lang') == null
      ? Get.deviceLocale
      : Locale(sharedPref!.getString('lang')!);
  changeLang(String codeLang) {
    Locale local = Locale(codeLang);
    sharedPref!.setString('lang', codeLang);
    Get.updateLocale(local);
  }

  check() {
    if (sharedPref!.getString('lang') == null) {
      Get.to(CustomDraw());
      print('Ahmed');
    } else if (sharedPref!.getString('lang') == 'ar') {
      Get.to(CustomDrawAR());
      print('Ali');
    } else if (sharedPref!.getString('lang') == 'en') {
      Get.to(CustomDraw());
      print('Khaled');
    }
  }
}
