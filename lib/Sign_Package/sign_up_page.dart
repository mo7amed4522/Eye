// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, deprecated_member_use, missing_return, unused_local_variable, unnecessary_null_comparison, must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/constant/default_button.dart';
import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../constant/my_text_field.dart';
import 'Sign_controller/sign_controller.dart';
import 'login_page.dart';

class SignUPPage extends StatelessWidget {
  SignUPPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  //final UserController userController = Get.find<UserController>();
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    // final textScale = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up".tr,
          style: TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor,
            fontFamily: 'Segoe UI',
            fontSize: _controllera.defaultLArgeSize,
            shadows: [
              Shadow(
                color: const Color(0xba000000),
                offset: Offset(
                  0,
                  3,
                ),
                blurRadius: 6,
              )
            ],
          ),
        ),
        //centerTitle: true,
        leading: InkWell(
          onTap: () => Get.to(
            SignInPage(),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).backgroundColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(
                  0,
                  3,
                ), // changes position of shadow
              ),
            ],
          ),
          width: screenWidth,
          height: screenHeight,
          child: GetBuilder<TextInputGetx>(
            init: TextInputGetx(),
            builder: (_controllerText) => SingleChildScrollView(
              //controller: controller,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Register Now !!'.tr,
                      style: TextStyle(
                        //fontFamily: 'Segoe UI',
                        fontSize: _controllera.defaultLArgeSize,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    MyTextFormField(
                      controller: authController.name,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a username!';
                          } else if (value.length < 6) {
                            return "Please provide a username of 5+ character";
                          }
                        }
                        return value;
                      },
                      hintText: 'UserName'.tr,
                      inputType: TextInputType.none,
                      prefics: Icons.person_outline_outlined,
                      suffix: _controllerText.isListenin
                          ? Icons.mic
                          : Icons.mic_none_outlined,
                      onTap: () {
                        authController.name.text = _controllerText.Name;
                      },
                      suffixPreesed: () {
                        _controllerText.toggleRecordingName();
                        authController.name.clear();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextFormField(
                      controller: authController.email,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)
                              ? 'null'
                              : "Please Enter Correct Email";
                        }
                        return value;
                      },
                      hintText: 'Email Address'.tr,
                      inputType: TextInputType.none,
                      prefics: Icons.email_outlined,
                      suffix: _controllerText.isListenin
                          ? Icons.mic
                          : Icons.mic_none_outlined,
                      onTap: () {
                        String x = authController.email.text =
                            _controllerText.Text.replaceAll(' ', '') +
                                "@gmail.com";
                        return x.replaceAll(' ', '');
                      },
                      suffixPreesed: () {
                        _controllerText.toggleRecording();
                        authController.email.clear();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextFormField(
                      controller: authController.password,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a password!';
                          } else if (value.length < 6) {
                            return "Please provide password of 5+ character ";
                          }
                        }
                        return value;
                      },
                      hintText: 'Password'.tr,
                      inputType: TextInputType.none,
                      prefics: Icons.remove_red_eye_outlined,
                      suffix: _controllerText.isListenin
                          ? Icons.mic
                          : Icons.mic_none_outlined,
                      onTap: () {
                        authController.password.text =
                            _controllerText.Pass.replaceAll(' ', '');
                      },
                      suffixPreesed: () {
                        _controllerText.togglelRecordingPass();
                        authController.password.clear();
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authController.createUser();
                        }
                      },
                      child: animatedOptacity(
                        'Sign Up'.tr,
                      ),
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
}
