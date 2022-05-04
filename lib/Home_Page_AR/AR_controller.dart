// ignore_for_file: file_names
import 'package:get/get.dart';
import '../Database/database.dart';
import '../models/program_model_AR.dart';

class ProgammingControllerAr extends GetxController {
  RxList<ProgammingModelAR> program = RxList<ProgammingModelAR>();

  // ignore: invalid_use_of_protected_member
  List<ProgammingModelAR> get programs => program.value;

  @override
  void onInit() {
    //String uid = Get.find<AuthController>().user?.uid;
    program.bindStream(
      Database().ProgamingStreamAr(),
    );
    super.onInit();
  }
}
