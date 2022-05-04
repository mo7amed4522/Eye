// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, missing_required_param, camel_case_types, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, deprecated_member_use, avoid_print, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AuthController/auth_controller.dart';
import '../../../Home_Page_AR/AR_controller.dart';
import '../../../Sign_Package/login_page.dart';
import '../../../constant/custom_icon_btn.dart';
import '../../../constant/time_box.dart';
import '../../Add_new_progamming/add_Progam_AR.dart';
import 'NodeListAR.dart';

class Home_page_buttom_nav2 extends StatelessWidget {
  Home_page_buttom_nav2({Key? key}) : super(key: key);
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
                                  "البرامج السياحية",
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
                    GetX<ProgammingControllerAr>(
                      init: Get.put<ProgammingControllerAr>(
                          ProgammingControllerAr()),
                      builder: (ProgammingControllerAr noteController) {
                        if (noteController.programs != null) {
                          return NoteListAdminAR();
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
            Get.to(Add_Progamming_AR());
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
