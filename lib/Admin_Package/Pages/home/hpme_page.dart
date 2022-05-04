// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AuthController/auth_controller.dart';
import '../../../Home_Page_En/EN_controller.dart';
import '../../../Sign_Package/login_page.dart';
import '../../../constant/custom_icon_btn.dart';
import '../../../constant/time_box.dart';
import '../../Add_new_progamming/add_progam.dart';
import 'NoteListAdmin.dart';

class HomePageBottomNavBottomNav extends StatelessWidget {
  HomePageBottomNavBottomNav({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Obx(
                () => Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: Stack(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  "Tourism App",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    //color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 7,
                                top: 5,
                                child: CustomIconBtn(
                                  color: Theme.of(context).backgroundColor,
                                  onPressed: () {
                                    authController.axisCount.value =
                                        authController.axisCount.value == 2
                                            ? 4
                                            : 2;
                                  },
                                  icon: Icon(
                                    authController.axisCount.value == 2
                                        ? Icons.list
                                        : Icons.grid_on,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 7,
                                top: 5,
                                child: CustomIconBtn(
                                  color: Theme.of(context).backgroundColor,
                                  onPressed: () {
                                    showSignOutDialog(
                                      context: context,
                                      text1:
                                          'Are you sure you want to log out ?'
                                              .tr,
                                      text2:
                                          'Your data are already saved so when logging back your data will be there.'
                                              .tr,
                                      onTap: () {
                                        authController.signout();
                                        authController.lognOut();
                                        Get.close(2);
                                        Get.to(SignInPage());
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.exit_to_app,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetX<ProgammingController>(
                      init:
                          Get.put<ProgammingController>(ProgammingController()),
                      builder: (ProgammingController noteController) {
                        if (noteController.programs != null) {
                          return NoteListAdmin();
                        } else {
                          return Text("No notes, create some ");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(Add_Progamming());
          },
          child: const Icon(
            Icons.add,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
        ),
      ),
    );
  }
}
