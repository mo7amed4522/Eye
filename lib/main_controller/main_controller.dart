// ignore_for_file: unnecessary_overrides, unused_local_variable, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/cashHelper/cahHelper.dart';
import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../Lacal/local_controller.dart';
import '../Sign_Package/login_page.dart';
import '../splashScreen/splashScreen.dart';

class MainController extends GetxController {
  Widget? currientPage = SignInPage();
  final AuthController authController = Get.put(AuthController());
  final MyLocalController _controller = Get.put(MyLocalController());
  final FontController _controllera = Get.put(FontController());
  bool isDark = false;
  ThemeMode appMode = ThemeMode.system;

  @override
  void onInit() async {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    String? token = await authController.getToken();
    if (token != null) {
      currientPage = _controller.check();
      splachScreen(currientPage!);
      update();
    } else {
      currientPage = SignInPage();
    }
  }

  changeMyFont() async {
    if (CasheHelper.getData('dynamic') == 0) {
      _controllera.changeBold();
    } else if (CasheHelper.getData('dynamic') == 1) {
      _controllera.restoreFont();
    } else if (CasheHelper.getData('dynamic') == 2) {
      _controllera.changSmaill();
    } else {
      _controllera.restoreFont();
    }
  }

  Widget splachScreen(Widget screen) {
    return AnimatedSplashScreen(
      splash: SplashScreen(),
      nextScreen: checkLogin(),
      splashIconSize: 700,
      backgroundColor: Colors.white,
      animationDuration: const Duration(
        milliseconds: 7000,
      ),
      splashTransition: SplashTransition.fadeTransition,
    );
  }

  void changeMode({fromCache}) {
    if (fromCache == null) {
      isDark = !isDark;
    } else {
      isDark = fromCache;
    }
    update();
  }
}
