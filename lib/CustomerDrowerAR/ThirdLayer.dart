// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, avoid_print, deprecated_member_use, must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../Lacal/change.dart';
import '../MyTrip/home_my_trip.dart';
import '../Sign_Package/login_page.dart';
import '../cashHelper/cahHelper.dart';
import '../constant/time_box.dart';
import '../settings/setting.dart';

class ThiredPage extends StatelessWidget {
  ThiredPage({Key? key}) : super(key: key);
  FontController _controllera = Get.put(FontController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 50,
          right: 10,
          left: 10,
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       height: 150,
                  //       width: 150,
                  //       decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             blurRadius: 1.0,
                  //           ),
                  //         ],
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(
                  //           image: NetworkImage(
                  //             'https://firebasestorage.googleapis.com/v0/b/flutternote-cf02b.appspot.com/o/image%2Fimage_2022-04-25_164528.png?alt=media&token=e306fbb0-3283-4492-a476-c0a14444de09',
                  //           ),
                  //           fit: BoxFit.fill,
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(
                  //         10,
                  //       ),
                  //       child: Text(
                  //         "Tourist App".tr,
                  //         style: TextStyle(
                  //           fontSize: _controllera.defaultLArgeSize,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Text(''),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/flutternote-cf02b.appspot.com/o/image%2Fimage_2022-04-25_164528.png?alt=media&token=e306fbb0-3283-4492-a476-c0a14444de09',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                              10.0,
                            ),
                            child: Text(
                              "Tourist App".tr,
                              style: TextStyle(
                                fontSize: _controllera.defaultLArgeSize,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Get.to(Setting());
                //   },
                //   child: Text(
                //     "Settings".tr,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: _controllera.defaultLArgeSize,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Text(
                  '',
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Setting());
                  },
                  child: Text(
                    "Settings".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _controllera.defaultLArgeSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            //Spacer(),
            Divider(
              color: Color(0xFF5950a0),
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(ChangeLang());
                  //   },
                  //   child: Text(
                  //     "Languages".tr,
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: _controllera.defaultLArgeSize,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  Text(
                    '',
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ChangeLang());
                    },
                    child: Text(
                      "Languages".tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _controllera.defaultLArgeSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Spacer(),
            Divider(
              color: Color(0xFF5950a0),
              thickness: 2,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: double.minPositive,
                  left: double.minPositive,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(HomeMyTrip());
                    //   },
                    //   child: Text(
                    //     "My Trip".tr,
                    //     //textAlign: TextAlign.right,
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: _controllera.defaultLArgeSize,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      '',
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(HomeMyTrip());
                      },
                      child: Text(
                        "My Trip".tr,
                        //textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _controllera.defaultLArgeSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     showSignOutDialog(
                  //       context: context,
                  //       text1: 'Are you sure you want to log out ?'.tr,
                  //       text2:
                  //           'Your data are already saved so when logging back your data will be there.'
                  //               .tr,
                  //       onTap: () {
                  //         authController.lognOut();
                  //         Get.close(0);
                  //         CasheHelper.removeData('access').then(
                  //           (value) => {
                  //             Navigator.of(context).pushAndRemoveUntil(
                  //                 MaterialPageRoute(
                  //                     builder: (context) => SignInPage()),
                  //                 (Route<dynamic> route) => false),
                  //           },
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10, bottom: 20),
                  //     child: Row(
                  //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Icon(
                  //           Icons.power_settings_new_outlined,
                  //           color: Colors.white,
                  //         ),
                  //         const SizedBox(
                  //           width: 7,
                  //         ),
                  //         Text(
                  //           "Sign Out".tr,
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: _controllera.defaultmiduemSize,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Text(
                    '',
                  ),
                  GestureDetector(
                    onTap: () {
                      showSignOutDialog(
                        context: context,
                        text1: 'Are you sure you want to log out ?'.tr,
                        text2:
                            'Your data are already saved so when logging back your data will be there.'
                                .tr,
                        onTap: () {
                          authController.lognOut();
                          Get.close(0);
                          CasheHelper.removeData('access').then(
                            (value) => {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()),
                                  (Route<dynamic> route) => false),
                            },
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 10),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.power_settings_new_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Logout".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _controllera.defaultLArgeSize,
                              fontWeight: FontWeight.bold,
                            ),
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
    );
  }
}
