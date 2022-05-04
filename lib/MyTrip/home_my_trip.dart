// ignore_for_file: file_names, unnecessary_null_comparison, must_be_immutable, prefer_final_fields
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../constant/custom_icon_btn.dart';
import 'home_list_my_trip.dart';
import 'mytrip_controller.dart';

class HomeMyTrip extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();
  FontController _controllera = Get.put(FontController());

  HomeMyTrip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: Obx(
              () => Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left: 7,
                        child: CustomIconBtn(
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                "My Trip".tr,
                                style: TextStyle(
                                  fontSize: _controllera.defaultLArgeSize,
                                  fontWeight: FontWeight.bold,
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
                  GetX<MyTripController>(
                    init: Get.put<MyTripController>(MyTripController()),
                    builder: (MyTripController noteController) {
                      if (noteController.notes != null) {
                        return ListMyTrip();
                      } else {
                        return Center(
                          child: Center(
                            child: Text(
                              "No notes, create some ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
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
