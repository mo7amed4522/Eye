// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, unused_import

import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/accessibility_event.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:get/get.dart';
import 'package:my_eye/First_time/choice_controller.dart';
import 'package:my_eye/Sign_Package/login_page.dart';
import 'package:my_eye/constant/default_button.dart';
import 'package:my_eye/main.dart';
import '../Font/Font_Controller.dart';
import '../Lacal/local_controller.dart';
import '../Thems/color.dart';
import '../cashHelper/cahHelper.dart';
import '../constant/custom_icon_btn.dart';

class ChoicePage extends StatelessWidget {
  ChoicePage({Key? key}) : super(key: key);
  FontController _controllera = Get.put(FontController());
  MyLocalController controllerLang = Get.put(MyLocalController());
  String lang1 = 'en';
  String lang2 = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ChoiceController>(
          init: ChoiceController(),
          builder: (_controller) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconBtn(
                            color: Theme.of(context).backgroundColor,
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          Text(
                            "Choice".tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultLArgeSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Theme.of(context).drawerTheme.backgroundColor,
                          border: Border.all(
                            width: 10,
                            color: Theme.of(context).backgroundColor,
                          ),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(50),
                            left: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'For mobile, screen readers (TalkBack, VoiceOver) enable visually impaired users to get spoken feedback about the contents of the screen and interact with the UI via gestures on mobile and keyboard shortcuts on desktop. Turn on VoiceOver or TalkBack on your mobile device and navigate around your app.'
                                    .tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FlutterAccessibilityService
                            .requestAccessibilityPermission();
                        _controller.changePermision(false);
                      },
                      child: getTimeBoxUI(
                        'Request Permission !'.tr,
                        'assets/talkBack.png',
                        false,
                        _controllera.defaultmiduemSize,
                        false,
                        context,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.changePermision(true);
                        print(_controller.permision);
                      },
                      child: getTimeBoxUI(
                        'No TalkBack'.tr,
                        'assets/NO.jpg',
                        false,
                        _controllera.defaultmiduemSize,
                        false,
                        context,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          Text(
                            'You have choice'.tr,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            _controller.permision.tr,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Choose the language of the application'.tr,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        controllerLang.changeLang(lang2);
                      },
                      child: getTimeBoxUI(
                        'Arabic'.tr,
                        'assets/egypt.png',
                        false,
                        _controllera.defaultmiduemSize,
                        false,
                        context,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        controllerLang.changeLang(lang1);
                      },
                      child: getTimeBoxUI(
                        'English'.tr,
                        'assets/english.png',
                        false,
                        _controllera.defaultmiduemSize,
                        false,
                        context,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(_controller.permision);
                        if (_controller.permision == "With permision".tr &&
                                lang1 == 'en' ||
                            _controller.permision == "With permision".tr &&
                                lang2 == 'ar') {
                          CasheHelper.saveData(
                            key: 'key',
                            value: false,
                          ).then((value) => {
                                if (value)
                                  navigateAndKill(
                                    context,
                                    SignInPage(),
                                  ),
                              });
                          // Get.to(SignInPage());
                        } else if (_controller.permision ==
                                    "Without permision".tr &&
                                lang1 == 'en' ||
                            _controller.permision == "Without permision".tr &&
                                lang2 == 'ar') {
                          CasheHelper.saveData(
                            key: 'key',
                            value: false,
                          ).then((value) => {
                                if (value)
                                  navigateAndKill(
                                    context,
                                    SignInPage(),
                                  ),
                              });
                        } else {
                          Get.snackbar(
                            'Error choice you have to choice'.tr,
                            'Error!!'.tr,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: animatedOptacity(
                        'Go'.tr,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTimeBoxUI(
    String name,
    String imgPath,
    bool added,
    double x,
    bool isFavorite,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: DesignCourseAppTheme.grey.withOpacity(
                0.7,
              ),
              offset: const Offset(
                1.1,
                1.1,
              ),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 15.0,
            bottom: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: x,
                    letterSpacing: 0.27,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 55.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
