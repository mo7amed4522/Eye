// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../AuthController/auth_controller.dart';
import 'FirstLayer.dart';
import 'HomePage.dart';
import 'SecondLAyer.dart';
import 'ThirdLayer.dart';

class CustomDraw extends StatelessWidget {
  CustomDraw({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).iconTheme.color,
        body: Stack(
          children: [
            FirstLayer(),
            SecondLayer(),
            ThierdPage(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
