// ignore_for_file: file_names
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_brace_in_string_interps, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/Admin_Package/Pages/home/updatePageEN.dart';

import '../../../AuthController/auth_controller.dart';
import '../../../Database/database.dart';
import '../../../Home_Page_En/EN_controller.dart';
import '../../../Thems/color.dart';
import '../../../constant/custom_icon_btn.dart';
import '../../../constant/time_box.dart';
import '../../../Font/Font_Controller.dart';
import '../../../models/progam_model_EN.dart';

class InformatonDetailsAdmin extends StatelessWidget {
  InformatonDetailsAdmin({
    Key? key,
    required this.noteData,
    this.index,
  }) : super(key: key);
  final ProgammingModelEn noteData;
  final int? index;
  final AuthController authController = Get.find<AuthController>();
  final ProgammingController noteController = Get.find<ProgammingController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  num tourPrice = 1;
  final TextEditingController durationontroller = TextEditingController();
  final TextEditingController includeController = TextEditingController();
  final TextEditingController excludeController = TextEditingController();
  double opacity1 = 0.0;
  String id = '';

  @override
  Widget build(BuildContext context) {
    imagePathController.text = noteData.imagePath!;
    titleController.text = noteData.title!;
    bodyController.text = noteData.body!;
    overViewController.text = noteData.overView!;
    tourPrice = noteData.tourPrice!;
    durationontroller.text = noteData.duration!;
    includeController.text = noteData.include!;
    excludeController.text = noteData.exclude!;
    id = noteData.id!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomIconBtn(
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      Database().deleteProgammingEN(
                        id,
                        authController.user.uid,
                      );
                      Database().deletePhotoStroge(imagePathController);
                      Get.back();
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ),
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
                  child: GestureDetector(
                    onTap: () {
                      //  Get.to(FiltersScreen());
                      Get.to(Update_Progamming_EN(
                        index: index!,
                        noteData: noteController.programs[index!],
                      ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear_all_sharp,
                          size: 30,
                        ),
                        Text(
                          'Edit',
                        ),
                      ],
                    ),
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
                      fontSize: 20,
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
                            "Price",
                            tourPrice.toString() + " \$",
                            context,
                            _controller.defaultmiduemSize,
                            _controller.defaultmiduemSize,
                          ),
                          getTimeBoxUI(
                            'Tour Type',
                            'Daily Tour',
                            context,
                            _controller.defaultmiduemSize,
                            _controller.defaultmiduemSize,
                          ),
                          getTimeBoxUI(
                            'Duration',
                            durationontroller.text,
                            context,
                            _controller.defaultmiduemSize,
                            _controller.defaultmiduemSize,
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
                            'OverView for trip',
                            style: TextStyle(
                              fontSize: _controller.defaultLArgeSize,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          overViewController.text,
                          style: TextStyle(
                            fontSize: _controller.defaultmiduemSize,
                            letterSpacing: 0.75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Itinerary',
                            style: TextStyle(
                              fontSize: _controller.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          bodyController.text,
                          style: TextStyle(
                            fontSize: _controller.defaultmiduemSize,
                            letterSpacing: 0.75,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Include',
                            style: TextStyle(
                              fontSize: _controller.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          includeController.text,
                          style: TextStyle(
                            fontSize: _controller.defaultmiduemSize,
                            letterSpacing: 0.75,
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Exclude',
                            style: TextStyle(
                              fontSize: _controller.defaultLArgeSize,
                              letterSpacing: 0.75,
                              color: DesignCourseAppTheme.nearlyBlue,
                            ),
                          ),
                        ),
                        Text(
                          excludeController.text,
                          style: TextStyle(
                            fontSize: _controller.defaultmiduemSize,
                            letterSpacing: 0.75,
                            height: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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
}
