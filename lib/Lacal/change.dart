// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CustomDrower/CustomDrawer.dart';
import '../CustomerDrowerAR/CustomDrawerAR.dart';
import '../Font/Font_Controller.dart';
import '../Thems/color.dart';
import '../constant/custom_icon_btn.dart';
import 'local_controller.dart';

class ChangeLang extends StatelessWidget {
  ChangeLang({Key? key}) : super(key: key);
  MyLocalController controllerLang = Get.find();
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomIconBtn(
                  color: Theme.of(context).backgroundColor,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "Language".tr,
                  style: TextStyle(
                    fontSize: _controllera.defaultLArgeSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  getTimeBoxUI(
                    'Arabic',
                    'assets/egypt.png',
                    false,
                    _controllera.defaultmiduemSize,
                    false,
                    context,
                    'ar',
                    CustomDrawAR(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getTimeBoxUI(
                    'English',
                    'assets/english.png',
                    false,
                    _controllera.defaultmiduemSize,
                    false,
                    context,
                    'en',
                    CustomDraw(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(
    String name,
    String imgPath,
    bool added,
    double x,
    bool isFavorite,
    BuildContext context,
    String lang,
    Widget kah,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          controllerLang.changeLang(lang);
          navigateAndKill(
            context,
            kah,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16.0,
              ),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(
                  0.7,
                ),
                offset: const Offset(
                  1.1,
                  1.1,
                ),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              top: 15.0,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: x,
                      letterSpacing: 0.27,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          imgPath,
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
