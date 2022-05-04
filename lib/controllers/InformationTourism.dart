// ignore_for_file: file_names, non_constant_identifier_names, invalid_use_of_protected_member
import 'package:get/get.dart';

import '../Database/database.dart';
import '../models/Information.dart';

class InformationToursit extends GetxController {
  RxList<Information> informationList = RxList<Information>();
  List<Information> get info => informationList.value;

  @override
  void onInit() {
    informationList.bindStream(
      Database().InformationStream(),
    );
    super.onInit();
  }
}
