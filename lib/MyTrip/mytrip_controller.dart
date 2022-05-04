// ignore_for_file: unused_local_variable, avoid_print
import 'package:get/get.dart';

import '../AuthController/auth_controller.dart';
import '../Database/database.dart';
import '../models/progam_model_EN.dart';

class MyTripController extends GetxController {
  RxList<ProgammingModelEn> noteList = RxList<ProgammingModelEn>();

  // ignore: invalid_use_of_protected_member
  List<ProgammingModelEn> get notes => noteList.value;

  @override
  void onInit() {
    String? uid = Get.find<AuthController>().user.uid;
    print("NoteController onit :: $uid");
    noteList.bindStream(
      Database().myTrip(uid),
    );
    super.onInit();
  }
}
