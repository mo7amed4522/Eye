// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_brace_in_string_interps, sized_box_for_whitespace, file_names, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthController/auth_controller.dart';
import '../Database/database.dart';
import '../Filter_Package/filter_page_EN.dart';
import '../Home_Page_En/EN_controller.dart';
import '../Thems/color.dart';
import '../Font/Font_Controller.dart';
import '../models/progam_model_EN.dart';
import '../notification_Package/Notification.dart';

class InformationDetails extends StatelessWidget {
  InformationDetails({
    Key? key,
    this.noteData,
    this.index,
  }) : super(key: key);
  ProgammingModelEn? noteData;
  int? index;
  AuthController authController = Get.find<AuthController>();
  ProgammingController noteController = Get.put(ProgammingController());
  TextEditingController titleController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController overViewController = TextEditingController();
  num tourPrice = 0;
  num dur = 0;
  TextEditingController durationontroller = TextEditingController();
  TextEditingController includeController = TextEditingController();
  TextEditingController excludeController = TextEditingController();
  double opacity1 = 0.0;
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    imagePathController.text = noteData!.imagePath!;
    titleController.text = noteData!.title!;
    bodyController.text = noteData!.body!;
    overViewController.text = noteData!.overView!;
    tourPrice = noteData!.tourPrice!;
    durationontroller.text = noteData!.duration!;
    includeController.text = noteData!.include!;
    excludeController.text = noteData!.exclude!;
    dur = noteData!.dur!;
//final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                          0.5,
                        ),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            expandedHeight: 350,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                20,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 1,
                  right: 5,
                  left: 4,
                ),
                child: Center(
                  child: Text(
                    titleController.text,
                    style: TextStyle(
                      fontSize: _controllera.defaultLArgeSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.black45,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                imagePathController.text,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(
                5.0,
              ),
              child: GetBuilder<FontController>(
                init: FontController(),
                builder: (_controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTimeBoxUI(
                            "Price".tr,
                            tourPrice.toString() + " \$",
                            context,
                            _controllera.defaultmiduemSize,
                            _controllera.defaultsmailSize,
                          ),
                          getTimeBoxUI(
                            'Tour Type'.tr,
                            'Daily Tour'.tr,
                            context,
                            _controllera.defaultmiduemSize,
                            _controllera.defaultsmailSize,
                          ),
                          getTimeBoxUI(
                            'Duration'.tr,
                            durationontroller.text,
                            context,
                            _controllera.defaultmiduemSize,
                            _controllera.defaultsmailSize,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'OverView for trip'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultLArgeSize,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          overViewController.text,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                            letterSpacing: 0.75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Itinerary'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          bodyController.text,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                            letterSpacing: 0.75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Include'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          includeController.text,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                            letterSpacing: 0.75,
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Exclude'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          excludeController.text,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                            letterSpacing: 0.75,
                            height: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          opacity: 0.99,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              bottom: 16,
                              right: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: DesignCourseAppTheme.nearlyWhite,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          16.0,
                                        ),
                                      ),
                                      border: Border.all(
                                        color: DesignCourseAppTheme.grey
                                            .withOpacity(
                                          0.2,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          16.0,
                                        ),
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: DesignCourseAppTheme.nearlyBlue
                                              .withOpacity(
                                            0.5,
                                          ),
                                          offset: const Offset(
                                            1.1,
                                            1.1,
                                          ),
                                          blurRadius: 10.0,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Database().addUserProgamming(
                                          authController.user.uid,
                                          imagePathController.text,
                                          titleController.text,
                                          overViewController.text,
                                          tourPrice,
                                          durationontroller.text,
                                          dur,
                                          bodyController.text,
                                          includeController.text,
                                          excludeController.text,
                                        );
                                        Get.find<NotificationController>()
                                            .createPictureNotification(
                                          titleController.text,
                                          'You have add this trip'.tr,
                                          imagePathController.text,
                                        );
                                        Get.to(
                                          FlutterPageEN(
                                            index: index!,
                                            noteData:
                                                noteController.programs[index!],
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          'Join Trip'.tr,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                _controllera.defaultmiduemSize,
                                            letterSpacing: 0.0,
                                            color: DesignCourseAppTheme
                                                .nearlyWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTimeBoxUI(
    String text1,
    String txt2,
    context,
    double x,
    double y,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        bottom: 2,
        right: 5,
        top: 2,
      ),
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
                0.2,
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
            top: 12.0,
            bottom: 12.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: x,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: y,
                  letterSpacing: 0.27,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
