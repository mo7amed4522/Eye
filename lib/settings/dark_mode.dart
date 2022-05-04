// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/cashHelper/cahHelper.dart';
import 'package:my_eye/settings/widgets/list_tile.dart';

import '../Font/Font_Controller.dart';
import '../constant/custom_icon_btn.dart';

class DarkMode extends StatelessWidget {
  DarkMode({Key? key}) : super(key: key);
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    //final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
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
                      "Appearnace".tr,
                      style: TextStyle(
                        fontSize: _controllera.defaultLArgeSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // ListTileSetting(
              //   onTap: () {
              //     Get.changeThemeMode(ThemeMode.system);
              //     CasheHelper.saveData(
              //       key: 'Mode1',
              //       value: true && false,
              //     );
              //   },
              //   title: "Use device setting".tr,
              //   iconData: Icons.settings_brightness_outlined,
              //   subtitle: Text(
              //     "Auttomatically swtich between Light and Dark themes when your system does"
              //         .tr,
              //   ),
              // ),
              ListTileSetting(
                onTap: () {
                  Get.changeThemeMode(ThemeMode.light);
                  CasheHelper.saveData(
                    key: 'Mode1',
                    value: true,
                  );
                },
                title: "Light Mode".tr,
                iconData: Icons.brightness_5,
                subtitle: Text(''),
              ),
              ListTileSetting(
                iconData: Icons.brightness_4_outlined,
                onTap: () {
                  Get.changeThemeMode(ThemeMode.dark);
                  CasheHelper.saveData(
                    key: 'Mode1',
                    value: false,
                  );
                },
                title: "Dark Mode".tr,
                subtitle: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
