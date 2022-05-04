// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/SqLite/sqfliteController.dart';
import 'package:my_eye/constant/default_button.dart';
import 'package:my_eye/country_picker/provider/country_provider.dart';
import 'package:provider/provider.dart';
import '../Font/Font_Controller.dart';
import '../Lacal/local_controller.dart';
import '../Thems/color.dart';
import '../constant/custom_icon_btn.dart';
import '../constant/my_text_field.dart';
import '../constant/text_form.dart';

class SqflitePage extends StatelessWidget {
  SqflitePage({Key? key}) : super(key: key);
  FontController _controllera = Get.put(FontController());
  final MyLocalController _controller = Get.put(MyLocalController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => CountryProvider()),
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<SqfLiteController>(
            init: SqfLiteController(),
            builder: (_controller) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Expanded(
                  child: ListView(
                    children: [
                      Form(
                        key: formKey,
                        child: Container(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Text(
                                    'Credit Card Details'.tr,
                                    style: TextStyle(
                                      fontSize: _controllera.defaultLArgeSize,
                                    ),
                                  ),
                                ),
                                textData(
                                  'Name on Card'.tr,
                                  _controllera.defaultLArgeSize,
                                ),
                                MyTextFormField(
                                  controller: _controller.nameCardController,
                                  validation: (value) {
                                    if (value.isEmpty) {
                                      return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                      ).hasMatch(value)
                                          ? 'null'
                                          : "Name Card";
                                    }
                                    return value;
                                  },
                                  hintText: 'Name on Card'.tr,
                                  inputType: TextInputType.none,
                                  suffix: _controller.isListenin
                                      ? Icons.mic
                                      : Icons.mic_none_outlined,
                                  prefics: Icons.person_outline,
                                  onTap: () {
                                    _controller.nameCardController.text =
                                        _controller.nameCard;
                                  },
                                  suffixPreesed: () {
                                    _controller.toggleRecordingNameCard();
                                    _controller.nameCardController.clear();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: _controller.buildSingleCountry(
                                    context,
                                    // countr,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                textData(
                                  'Card Number'.tr,
                                  _controllera.defaultLArgeSize,
                                ),
                                MyTextFormField(
                                  controller: _controller.cardNumberController,
                                  validation: (value) {
                                    if (value.isEmpty) {
                                      return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                      ).hasMatch(value)
                                          ? 'null'
                                          : "Name Card";
                                    }
                                    return value;
                                  },
                                  hintText: 'Card Number'.tr,
                                  inputType: TextInputType.none,
                                  suffix: _controller.isListenin
                                      ? Icons.mic
                                      : Icons.mic_none_outlined,
                                  prefics: Icons.credit_card_outlined,
                                  onTap: () {
                                    _controller.cardNumberController.text =
                                        _controller.cardNumber;
                                  },
                                  suffixPreesed: () {
                                    _controller.toggleRecordingCardNumber();
                                    _controller.cardNumberController.clear();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                textData(
                                  'Card Expiration'.tr,
                                  _controllera.defaultLArgeSize,
                                ),
                                MyTextFormField(
                                  controller:
                                      _controller.cardExpirayionController,
                                  validation: (value) {
                                    if (value.isEmpty) {
                                      return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                      ).hasMatch(value)
                                          ? 'null'
                                          : "Name Exp";
                                    }
                                    return value;
                                  },
                                  hintText: 'Card Expiration'.tr,
                                  inputType: TextInputType.none,
                                  suffix: _controller.isListenin
                                      ? Icons.mic
                                      : Icons.mic_none_outlined,
                                  prefics: Icons.calendar_today_outlined,
                                  onTap: () {
                                    _controller.cardExpirayionController.text =
                                        _controller.cardExpirayion;
                                  },
                                  suffixPreesed: () {
                                    _controller.toggleRecordingCardExpirayion();
                                    _controller.cardExpirayionController
                                        .clear();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                textData(
                                  'CVV',
                                  _controllera.defaultLArgeSize,
                                ),
                                MyTextFormField(
                                  controller: _controller.cvvController,
                                  validation: (value) {
                                    if (value.isEmpty) {
                                      return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                      ).hasMatch(value)
                                          ? 'null'
                                          : "cvv";
                                    }
                                    return value;
                                  },
                                  hintText: 'CVV'.tr,
                                  inputType: TextInputType.none,
                                  suffix: _controller.isListenin
                                      ? Icons.mic
                                      : Icons.mic_none_outlined,
                                  prefics: Icons.lock_outline_rounded,
                                  onTap: () {
                                    _controller.cvvController.text =
                                        _controller.cvv;
                                  },
                                  suffixPreesed: () {
                                    _controller.toggleRecordingCVV();
                                    _controller.cvvController.clear();
                                  },
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      advanci2edDialog(
                                        context: context,
                                        text: 'Confirm'.tr,
                                        text2:
                                            'Your purchase has been completed successfully. Thank you for using the app Eye'
                                                .tr,
                                      );
                                      //print("valid");
                                    } else {
                                      //print('inValid');
                                      Get.snackbar(
                                        'Error!!'.tr,
                                        'Please complete all fields'.tr,
                                      );
                                    }
                                    // advanci2edDialog(
                                    //   context: context,
                                    //   text: 'Confirm'.tr,
                                    //   text2:
                                    //       'Your purchase has been completed successfully. Thank you for using the app Eye'
                                    //           .tr,
                                    // );
                                  },
                                  child: animatedOptacity(
                                    'Please Order'.tr,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void advanci2edDialog({
    BuildContext? context,
    String? text,
    String? text2,
  }) async {
    await showDialog(
      context: context!,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            actions: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                        top: 70,
                        right: 2,
                        bottom: 2,
                      ),
                      child: Column(
                        children: [
                          Text(
                            text!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            text2!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      _controller.check(),
                                    );
                                  },
                                  child: Text(
                                    'Okay',
                                    style: TextStyle(
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/LOGO.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
