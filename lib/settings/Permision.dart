// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:get/get.dart';
import 'package:my_eye/First_time/choice_controller.dart';

import '../Font/Font_Controller.dart';
import '../Thems/color.dart';
import '../constant/custom_icon_btn.dart';

class PremasioinPage extends StatelessWidget {
  PremasioinPage({Key? key}) : super(key: key);
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ChoiceController>(
          init: ChoiceController(),
          builder: (_controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
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
                      "Permision".tr,
                      style: TextStyle(
                        fontSize: _controllera.defaultLArgeSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'If you want to cancel a feature (TalkBack, VoiceOver) or want to activate a feature (TalkBack, VoiceOver)'
                      .tr,
                  style: TextStyle(
                    fontSize: _controllera.defaultLArgeSize,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await FlutterAccessibilityService
                      .requestAccessibilityPermission();
                  _controller.changePermision(false);
                },
                child: getTimeBoxUI(
                  'Request Permission !'.tr,
                  'assets/talkBack.png',
                  false,
                  _controllera.defaultmiduemSize,
                  false,
                  context,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
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
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
