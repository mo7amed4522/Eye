// ignore_for_file: prefer_const_constructors, unused_field, must_be_immutable, prefer_final_fields, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/cashHelper/cahHelper.dart';
import '../constant/custom_icon_btn.dart';
import '../settings/widgets/list_tile.dart';
import 'Font_Controller.dart';

class FontSettingsController extends StatelessWidget {
  const FontSettingsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FontController>(
          init: FontController(),
          builder: (_controllera) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                      "Font Change".tr,
                      style: TextStyle(
                        fontSize: _controllera.defaultLArgeSize,
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
                  // Get.to(() => DarkMode());
                  _controllera.changeBold();
                  CasheHelper.removeData('dynamic');
                  CasheHelper.saveData(
                    key: 'dynamic',
                    value: 0,
                  );
                  print('Change Bold');
                  Get.back();
                },
                title: "Font Bold".tr,
                iconData: Icons.font_download,
                subtitle: Text(''),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTileSetting(
                onTap: () {
                  // Get.to(() => DarkMode());
                  _controllera.restoreFont();
                  CasheHelper.removeData('dynamic');
                  CasheHelper.saveData(
                    key: 'dynamic',
                    value: 1,
                  );
                  print('change Default');
                  Get.back();
                },
                title: "Font Default".tr,
                iconData: Icons.font_download,
                subtitle: Text(''),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTileSetting(
                onTap: () {
                  // Get.to(() => DarkMode());
                  _controllera.changSmaill();
                  CasheHelper.removeData('dynamic');
                  CasheHelper.saveData(
                    key: 'dynamic',
                    value: 2,
                  );
                  print('Change Smaill');
                  Get.back();
                },
                title: "Font small".tr,
                iconData: Icons.font_download,
                subtitle: Text(''),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
