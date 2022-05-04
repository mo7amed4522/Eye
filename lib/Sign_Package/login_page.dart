// ignore_for_file: unused_local_variable, prefer_const_declarations, unused_field, prefer_const_constructors, avoid_print, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/Sign_Package/sign_up_page.dart';
import 'package:my_eye/constant/default_button.dart';

import '../AuthController/auth_controller.dart';
import '../AuthController/user_controller.dart';
import '../Font/Font_Controller.dart';
import '../Lacal/local_controller.dart';
import '../Thems/color.dart';
import '../constant/my_text_field.dart';
import 'Sign_controller/sign_controller.dart';
import 'admin_login.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  final UserController userController = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final textScale = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;
    MyLocalController _controller = Get.put(MyLocalController());
    FontController _controllera = Get.put(FontController());

    final widgetList = [
      Row(
        children: [
          SizedBox(
            width: 28,
          ),
          Text(
            'Tourism App'.tr,
            style: TextStyle(
              //fontFamily: 'Segoe UI',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      SizedBox(
        height: 12.0,
      ),
      Form(
        key: _formKey,
        child: GetBuilder<TextInputGetx>(
          init: TextInputGetx(),
          builder: (_controllerText) => Column(
            children: [
              MyTextFormField(
                controller: authController.email,
                validation: (value) {
                  if (value.isEmpty) {
                    return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)
                        ? 'null'
                        : "Please Enter Correct Email";
                  }
                  return value;
                },
                hintText: 'Email Address'.tr,
                inputType: TextInputType.none,
                suffix: _controllerText.isListenin
                    ? Icons.mic
                    : Icons.mic_none_outlined,
                prefics: Icons.email_outlined,
                onTap: () {
                  String x = authController.email.text =
                      _controllerText.Text.replaceAll(' ', '') + "@gmail.com";
                  return x.replaceAll(' ', '');
                },
                suffixPreesed: () {
                  _controllerText.toggleRecording();
                  authController.email.clear();
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              MyTextFormField(
                controller: authController.password,
                validation: (value) {
                  if (value.isEmpty) {
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
                suffix: _controllerText.isListenin
                    ? Icons.mic
                    : Icons.mic_none_outlined,
                prefics: Icons.remove_red_eye_outlined,
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
                height: 25.0,
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    var _user = await authController.accessLogin();
                    print('yes');
                    if (_user != null) {
                      _controller.check();
                    }
                  }
                },
                child: animatedOptacity(
                  'Sign In'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 10.0,
              top: 15.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).backgroundColor,
                    offset: const Offset(
                      0,
                      0,
                    ),
                    blurRadius: 5.0,
                  ),
                ],
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              width: (screenWidth / 2) - 40,
              height: 65,
              child: Material(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                child: InkWell(
                  onTap: () async {
                    print(
                      "Admin tapped",
                    );
                    Get.to(
                      AdminLoginPage(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          child: Image.asset(
                            "assets/admin.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text(
                          "Sign in with\nadmin".tr,
                          style: TextStyle(
                            fontSize: _controllera.defaultsmailSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 30.0,
              top: 15.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).backgroundColor,
                    offset: const Offset(
                      0,
                      0,
                    ),
                    blurRadius: 5.0,
                  ),
                ],
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              width: (screenWidth / 2) - 40,
              height: 65,
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  onTap: () async {
                    print(
                      "google tapped",
                    );

                    UserCredential? _user =
                        await authController.signInWithGoogle();
                    if (_user != null) {
                      _controller.check();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/google.png",
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text(
                          "Sign in with\nGoogle".tr,
                          style: TextStyle(
                            fontSize: _controllera.defaultsmailSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
    ];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: coverHeight + 5,
              backgroundColor: Theme.of(context).backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.asset(
                  "assets/LOGO.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: screenWidth,
                height: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: screenWidth,
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (
                  BuildContext context,
                  int index,
                ) {
                  return widgetList[index];
                },
                childCount: widgetList.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            Container(
              height: 50.0,
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              child: Center(
                child: Wrap(
                  children: [
                    Text(
                      "Don't have an account ?".tr,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontWeight: FontWeight.bold,
                        fontSize: _controllera.defaultmiduemSize,
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          print(
                            "sign up tapped",
                          );
                          Get.to(
                            SignUPPage(),
                          );
                        },
                        child: Text(
                          "Register".tr,
                          style: TextStyle(
                            color: DesignCourseAppTheme.nearlyBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: _controllera.defaultmiduemSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
