// ignore_for_file: file_names
import 'package:get/get.dart';

class FontController extends GetxController {
  double defaultLArgeSize = 18.0;
  double defaultmiduemSize = 15.0;
  double defaultsmailSize = 11.0;

  changeBold() {
    defaultLArgeSize = 18 + 5;
    defaultmiduemSize = 15 + 5;
    defaultsmailSize = 11 + 5;
    update();
  }

  restoreFont() {
    defaultLArgeSize = 18;
    defaultmiduemSize = 15;
    defaultsmailSize = 11;
    update();
  }

  changSmaill() {
    defaultLArgeSize = 18 - 5;
    defaultmiduemSize = 15 - 5;
    defaultsmailSize = 11 - 5;
    update();
  }
}
