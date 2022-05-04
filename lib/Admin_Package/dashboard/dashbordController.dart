// ignore_for_file: file_names
import 'package:get/get.dart';

class DashbordController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
