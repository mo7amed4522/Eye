// ignore_for_file: file_names
import 'package:get/get.dart';
import '../Notification.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      NotificationController(),
    );
  }
}
