// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  num counterAdult = 0;
  num counterChild = 0;
  num countAd = 0;
  num countCH = 0;
  num x1 = 10;

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String dropdownvalue = 'English'.tr;

  var items = [
    'English'.tr,
    'Arbic'.tr,
    'Hindi'.tr,
    'Spanish'.tr,
    'French'.tr,
    'Russian'.tr,
  ];

  increaseAdult(num muilty) {
    counterAdult++;
    countAd = counterAdult * muilty;
    print(countAd);
    update();
    return countAd;
  }

  decruceAdult(num muilty) {
    if (counterAdult < 1) {
      print('False');
    } else {
      counterAdult--;
      countAd = counterAdult * muilty;
      print(countAd);
    }
    update();
    return countAd;
  }

  increaseChild(num muilty) {
    counterChild++;
    countCH = counterChild * muilty;
    print(countCH);
    update();
    return countCH;
  }

  decruceChild(num muilty) {
    if (counterChild < 1) {
      print('False');
    } else {
      counterChild--;
      countCH = counterChild * muilty;
      print(countCH);
    }
    update();
    return countCH;
  }
}
