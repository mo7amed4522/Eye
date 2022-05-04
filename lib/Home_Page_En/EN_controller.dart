// ignore_for_file: file_names
import 'package:get/get.dart';
import '../Database/database.dart';
import '../models/progam_model_EN.dart';

class ProgammingController extends GetxController {
  RxList<ProgammingModelEn> program = RxList<ProgammingModelEn>();

  // ignore: invalid_use_of_protected_member
  List<ProgammingModelEn> get programs => program.value;

  @override
  void onInit() {
    //String uid = Get.find<AuthController>().user?.uid;
    program.bindStream(
      Database().ProgamingStream(),
    );
    super.onInit();
  }
}
