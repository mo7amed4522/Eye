// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AuthController/auth_controller.dart';
import '../../AuthController/user_controller.dart';
import '../../Database/database.dart';
import '../../constant/custom_icon_btn.dart';
import '../../constant/my_text_field.dart';
import '../../constant/text_form.dart';
import '../Pages/home/controller_home_1/controller.dart';

class Add_Progamming extends StatelessWidget {
  Add_Progamming({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  final TextEditingController tourPricecontroller = TextEditingController();
  final TextEditingController durationcontroller = TextEditingController();
  final TextEditingController includecontroller = TextEditingController();
  final TextEditingController excludecontroller = TextEditingController();
  final TextEditingController durcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return GetBuilder<AddNewProgrmmingController>(
      init: AddNewProgrmmingController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(children: [
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
                    "Add Program",
                    style: TextStyle(
                      fontSize: 20 * textScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Theme.of(context).backgroundColor,
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (controller.image != null)
                                  ? Image.network(
                                      controller.imagePathController.text,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPIWNxqYlgwcPj7JZDM_5pS7nf-Gy9ySNmD4WOLHd_YGhEILVR-DqzJ6FIEdbMw-dxoY&usqp=CAU",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: GestureDetector(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30.0,
                              color: Color(0xff476cfb),
                            ),
                            onTap: () {
                              controller.getImage();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      textData(
                        'Title',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        controller: titleController,
                        hintText: "Title",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'TourPrice',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.number,
                        controller: tourPricecontroller,
                        hintText: "TourPrice",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'duration',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        controller: durationcontroller,
                        hintText: "duration",
                        validation: (value) {
                          return value;
                        },
                      ),
                      textData(
                        'Duration Data',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.number,
                        controller: durcontroller,
                        hintText: "Duration Data",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'Include',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        max: null,
                        controller: includecontroller,
                        hintText: "Include",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'Exclude',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        max: null,
                        controller: excludecontroller,
                        hintText: "Exclude",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'overView',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        max: null,
                        controller: overViewController,
                        hintText: "overView",
                        validation: (value) {
                          return value;
                        },
                      ),
                      textData(
                        'Itinerary',
                        20.0,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        max: null,
                        controller: bodyController,
                        hintText: "Type something...",
                        validation: (value) {
                          return value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (titleController.text.isEmpty &&
                bodyController.text.isEmpty &&
                controller.Url == null) {
              //showEmptyTitleDialog(context);
            } else {
              Database().addNewProgaimmingEn(
                authController.user.uid,
                controller.Url.toString(),
                titleController.text,
                overViewController.text,
                double.parse(tourPricecontroller.text),
                durationcontroller.text,
                double.parse(durcontroller.text),
                bodyController.text,
                includecontroller.text,
                excludecontroller.text,
              );
              Get.back();
            }
          },
          label: Text("Save"),
          icon: Icon(Icons.save),
        ),
      ),
    );
  }
}
