// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/settings/widgets/list_tile.dart';
import '../AuthController/auth_controller.dart';
import '../Font/font_settings.dart';
import '../constant/custom_icon_btn.dart';
import '../Font/Font_Controller.dart';
import 'Permision.dart';
import 'dark_mode.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: GetBuilder<FontController>(
            init: FontController(),
            builder: (controller) => Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconBtn(
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        color: Theme.of(context).backgroundColor,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Text(
                        "Settings".tr,
                        style: TextStyle(
                          fontSize: controller.defaultLArgeSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => DarkMode());
                  },
                  title: "Dark Mode".tr,
                  iconData: Icons.nights_stay,
                  subtitle: Text(''),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => FontSettingsController());
                  },
                  title: "Font Controller".tr,
                  iconData: Icons.font_download,
                  subtitle: Text(''),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTileSetting(
                  onTap: () {
                    Get.to(() => PremasioinPage());
                  },
                  title: "Request Permission !".tr,
                  iconData: Icons.edit,
                  subtitle: Text(''),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
