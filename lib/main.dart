// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return, unused_local_variable, non_constant_identifier_names, prefer_const_declarations, prefer_const_constructors_in_immutables, unrelated_type_equality_checks, avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_eye/country_picker/provider/country_provider.dart';
import 'package:my_eye/splashScreen/splashScreen.dart';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:my_eye/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthController/auth_controller.dart';
import 'AuthController/user_controller.dart';
import 'First_time/choice.dart';
import 'Intro/onBording.dart';
import 'Lacal/local.dart';
import 'Lacal/local_controller.dart';
import 'Sign_Package/login_page.dart';
import 'cashHelper/cahHelper.dart';
import 'main_controller/main_controller.dart';
import 'notification_Package/Notification.dart';
import 'notification_Package/bindings/allBindings.dart';

SharedPreferences? sharedPref;
ThemeMode? _them;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) {
      Get.put<AuthController>(
        AuthController(),
      );
      Get.put<UserController>(
        UserController(),
      );
    },
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await CasheHelper.init();
  Widget widget;
  bool? showOnBoard = CasheHelper.getData('ShowOnBoard');
  bool? isDark = CasheHelper.getData('Mode1');
  bool? choice = CasheHelper.getData('key');

  if (isDark == false) {
    _them = ThemeMode.dark;
  } else if (isDark == true) {
    _them = ThemeMode.light;
  } else {
    _them = ThemeMode.system;
  }
  if (showOnBoard == false) {
    if (choice == false) {
      widget = SignInPage();
      print('object0');
    } else {
      widget = ChoicePage();
      print('object1');
    }
  } else {
    widget = OnBoarding();
    print('object3');
  }
  NotificationController.initializeNotificationService();

  sharedPref = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ],
  ).then(
    (_) => runApp(
      MyApp(
        startWidget: widget,
        isDark: isDark,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    this.startWidget,
    this.isDark,
  }) : super(key: key);
  final Widget? startWidget;
  final bool? isDark;
  final MyLocalController _controllera = Get.put(MyLocalController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => CountryProvider(),
      child: GetBuilder<MainController>(
        init: MainController(),
        builder: (_controller) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your Eye'.tr,
          initialBinding: AllBindings(),
          theme: Themes().lightTheme,
          darkTheme: Themes().dartTheme,
          themeMode: _them!,
          locale: _controllera.intialLang,
          translations: MyLocale(),
          home: AnimatedSplashScreen(
            splash: SplashScreen(),
            nextScreen: startWidget!,
            splashIconSize: 700,
            backgroundColor: Colors.white,
            animationDuration: const Duration(
              milliseconds: 2000,
            ),
            splashTransition: SplashTransition.fadeTransition,
          ),
          //home: HomePageOverView(),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor)
      : super(
          _getColorFromHex(hexColor),
        );

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll(
          '#',
          '',
        );
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(
      hexColor,
      radix: 16,
    );
  }
}
