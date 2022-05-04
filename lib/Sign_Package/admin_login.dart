// ignore_for_file: file_names, duplicate_ignore, unrelated_type_equality_checks, must_be_immutable, await_only_futures, unused_local_variable, avoid_print, body_might_complete_normally_nullable, unnecessary_null_comparison, prefer_final_fields
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/constant/default_button.dart';
import '../Admin_Package/dashboard/dashbord.dart';
import '../Font/Font_Controller.dart';
import '../constant/my_text_field.dart';
import 'login_page.dart';

class AdminLoginPage extends StatelessWidget {
  AdminLoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    //  final textScale = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In".tr,
          style: TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor,
            fontFamily: 'Segoe UI',
            fontSize: 30,
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
          child: SingleChildScrollView(
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
                    'Sign In'.tr,
                    style: TextStyle(
                      //fontFamily: 'Segoe UI',
                      fontSize: _controllera.defaultLArgeSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextFormField(
                    controller: emailController,
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
                    inputType: TextInputType.emailAddress,
                    prefics: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextFormField(
                    controller: passwordController,
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
                    inputType: TextInputType.emailAddress,
                    prefics: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (emailController.text == 'myeye123@gmail.com' &&
                          passwordController.text == '123456') {
                        UserCredential _user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                          // print(_user);
                        );
                        print(_user);
                        Get.to(My_dashbord_NavaAge());
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
        ),
      ),
    );
  }
}
