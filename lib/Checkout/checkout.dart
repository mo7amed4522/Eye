// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, missing_return, avoid_print, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthController/auth_controller.dart';
import '../Database/database.dart';
import '../Font/Font_Controller.dart';
import '../Sign_Package/Sign_controller/sign_controller.dart';
import '../SqLite/home_sqlite.dart';
import '../Thems/color.dart';
import '../constant/custom_icon_btn.dart';
import '../constant/my_text_field.dart';
import '../controllers/InformationTourism.dart';
import '../models/Information.dart';

class CheckOut extends StatelessWidget {
  CheckOut({
    Key? key,
    this.index,
    this.noteData,
  }) : super(key: key);
  final Information? noteData;
  final int? index;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  FontController _controllera = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<InformationToursit>(
          init: InformationToursit(),
          builder: (_controller) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
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
                      "Checkout".tr,
                      style: TextStyle(
                        fontSize: _controllera.defaultLArgeSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        ),
                      ),
                      child: GetBuilder<TextInputGetx>(
                        init: TextInputGetx(),
                        builder: (_controllerText) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 25,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'First Name'.tr,
                                        style: TextStyle(
                                          fontSize:
                                              _controllera.defaultmiduemSize,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25.0,
                              ),
                              child: MyTextFormField(
                                controller: firstNameController,
                                // text: authController.name.text,
                                validation: (value) {
                                  if (value.isEmpty) {
                                    if (value.isEmpty) {
                                      return '';
                                    } else if (value.length < 6) {
                                      return "Please provide a username of 5+ character";
                                    }
                                  }
                                  return '';
                                },
                                hintText: 'First Name'.tr,
                                inputType: TextInputType.none,
                                prefics: Icons.person_outline_outlined,
                                suffix: _controllerText.isListenin
                                    ? Icons.mic
                                    : Icons.mic_none_outlined,
                                onTap: () {
                                  firstNameController.text =
                                      _controllerText.Name;
                                },
                                suffixPreesed: () {
                                  _controllerText.toggleRecordingName();
                                  firstNameController.clear();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 25,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Last Name'.tr,
                                        style: TextStyle(
                                          fontSize:
                                              _controllera.defaultmiduemSize,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                // left: 25.0,
                                // right: 25.0,
                                top: 10.0,
                              ),
                              child: MyTextFormField(
                                //context: context,
                                controller: lastNameController,
                                validation: (value) {
                                  if (value.isEmpty) {
                                    if (value.isEmpty) {
                                      return '';
                                    } else if (value.length < 6) {
                                      return "Please provide a username of 5+ character";
                                    }
                                  }
                                  return '';
                                },
                                hintText: 'Last Name'.tr,
                                inputType: TextInputType.none,
                                prefics: Icons.person_outline_outlined,
                                suffix: _controllerText.isListenin
                                    ? Icons.mic
                                    : Icons.mic_none_outlined,
                                onTap: () {
                                  lastNameController.text =
                                      _controllerText.LastName;
                                },
                                suffixPreesed: () {
                                  _controllerText.toggleRecordingLastName();
                                  lastNameController.clear();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                                top: 25,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Phone Number'.tr,
                                        style: TextStyle(
                                          fontSize:
                                              _controllera.defaultmiduemSize,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: MyTextFormField(
                                      // context: context,
                                      controller: phoneNumberController,
                                      validation: (value) {
                                        if (value.isEmpty) {
                                          if (value.isEmpty) {
                                            return 'Phone Number'.tr;
                                          } else if (value.length < 6) {
                                            return "Please provide a username of 5+ character";
                                          }
                                        }
                                        return '';
                                      },
                                      hintText: 'Phone Number',
                                      inputType: TextInputType.none,
                                      prefics: Icons.phone_in_talk_sharp,
                                      suffix: _controllerText.isListenin
                                          ? Icons.mic
                                          : Icons.mic_none_outlined,
                                      onTap: () {
                                        String x = phoneNumberController.text =
                                            _controllerText.Phone;
                                        _controllerText.Phone.replaceAll(
                                            ' ', '');
                                        return x.replaceAll(' ', '');
                                      },
                                      suffixPreesed: () {
                                        _controllerText
                                            .toggleRecordingPhoneNmuber();
                                        phoneNumberController.clear();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            AnimatedOpacity(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              opacity: 0.99,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  left: 16,
                                  bottom: 2,
                                  right: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              DesignCourseAppTheme.nearlyWhite,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: DesignCourseAppTheme.grey
                                                .withOpacity(
                                              0.2,
                                            ),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: DesignCourseAppTheme
                                                  .nearlyBlue
                                                  .withOpacity(
                                                0.5,
                                              ),
                                              offset: const Offset(
                                                1.1,
                                                1.1,
                                              ),
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(CheckOut());
                                            Database().updatedProgamming(
                                              authController.user.uid,
                                              firstNameController.text,
                                              lastNameController.text,
                                              phoneNumberController.text,
                                            );
                                            Get.to(
                                              SqflitePage(),
                                            );
                                          },
                                          child: Center(
                                            child: Text(
                                              'Checkout'.tr,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: _controllera
                                                    .defaultLArgeSize,
                                                letterSpacing: 0.2,
                                                color: DesignCourseAppTheme
                                                    .nearlyWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
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
    );
  }
}
