// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../AuthController/auth_controller.dart';
import 'FirstLayerAR.dart';
import 'HomePageAR.dart';
import 'SecondLAyerAR.dart';
import 'ThirdLayer.dart';

class CustomDrawAR extends StatelessWidget {
  CustomDrawAR({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            FirstLayerAR(),
            SecondLayerAR(),
            ThiredPage(),
            HomePageARCustom(),
          ],
        ),
      ),
    );
  }
}
