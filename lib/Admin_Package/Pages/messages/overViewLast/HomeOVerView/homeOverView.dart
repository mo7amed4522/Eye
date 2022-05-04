// ignore_for_file: file_names, unnecessary_null_comparison
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AuthController/auth_controller.dart';
import '../../../../../constant/custom_icon_btn.dart';
import '../../../../../controllers/InformationTourism.dart';

import 'overViewList.dart';

class HomePageOverView extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();

  HomePageOverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  // vertical: 5,
                  //horizontal: 1,
                  ),
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
                                  "OverView".tr,
                                  style: TextStyle(
                                    fontSize: 24 * textScale,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetX<InformationToursit>(
                      init: Get.put<InformationToursit>(InformationToursit()),
                      builder: (InformationToursit noteController) {
                        if (noteController.info != null) {
                          return OverViewList();
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
      ),
    );
  }
}
