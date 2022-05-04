// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison
// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AuthController/auth_controller.dart';
import '../../AuthController/user_controller.dart';
import '../../Database/database.dart';
import '../../constant/custom_icon_btn.dart';
import '../../constant/my_text_field.dart';
import '../../constant/text_form.dart';
import '../Pages/home/controller_home_1/controller.dart';

class Add_Progamming_AR extends StatelessWidget {
  Add_Progamming_AR({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController imagePathController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  final TextEditingController tourPricecontroller = TextEditingController();
  final TextEditingController durationcontroller = TextEditingController();
  final TextEditingController durcontroller = TextEditingController();
  final TextEditingController includecontroller = TextEditingController();
  final TextEditingController excludecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  width: MediaQuery.of(context).size.width / 8,
                ),
                Text(
                  "اضافة برنامج السياحي",
                  style: TextStyle(
                    fontSize: 18 * textScale,
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
                child: GetBuilder<AddNewProgrmmingController>(
                  init: AddNewProgrmmingController(),
                  builder: (_controller) => Column(
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
                              child: (_controller.image != null)
                                  ? Image.network(
                                      _controller.imagePathController.text,
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
                              _controller.getImage();
                            },
                          ),
                        ),
                      ),
                      textData(
                        'Title',
                        18.0 * textScale,
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
                        'overView',
                        18.0 * textScale,
                      ),
                      MyTextFormField(
                        // context: context,
                        inputType: TextInputType.text,
                        controller: overViewController,
                        max: null,
                        hintText: "overView",
                        validation: (value) {
                          return value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'Tour Price',
                        18.0 * textScale,
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
                        'Duration',
                        18.0 * textScale,
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
                      SizedBox(
                        height: 20,
                      ),
                      textData(
                        'Duration Data',
                        18.0 * textScale,
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
                        18.0 * textScale,
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
                        18.0 * textScale,
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
                        'Itinerary',
                        18.0 * textScale,
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
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty &&
              bodyController.text.isEmpty &&
              imagePathController.text.isEmpty) {
            //showEmptyTitleDialog(context);
          } else {
            Database().addNewProgaimmingAR(
              authController.user.uid,
              imagePathController.text,
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
        label: Text("تأكيد"),
        icon: Icon(Icons.save),
      ),
    );
  }
}
