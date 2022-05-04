// ignore_for_file: prefer_typing_uninitialized_variables, avoid_web_libraries_in_flutter, non_constant_identifier_names, avoid_print, await_only_futures, library_prefixes, invalid_use_of_visible_for_testing_member, deprecated_member_use
import 'dart:io' as i;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddNewProgrmmingController extends GetxController {
  num tourPrice = 1;
  num dur = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  // final TextEditingController tourPricecontroller = TextEditingController();
  final TextEditingController durationcontroller = TextEditingController();
  final TextEditingController includecontroller = TextEditingController();
  final TextEditingController excludecontroller = TextEditingController();
  // final TextEditingController durcontroller = TextEditingController();

  changeTourPrice(num number) {
    tourPrice = number;
    update();
  }

  changeDuration(num x) {
    dur = x;
    update();
  }

  XFile? image;
  var Url;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = pickedFile;
    }
    print('Image Path $image');
    var _nameImage = await Path.basename(image!.path);
    //start upload
    var _refStoge = FirebaseStorage.instance.ref('image/$_nameImage');
    await _refStoge.putFile(i.File(image!.path));
    Url = await _refStoge.getDownloadURL();
    print('==========================URL=============');
    print('url : $Url');
  }

  Future changeImage() async {
    image = null;
  }
}
