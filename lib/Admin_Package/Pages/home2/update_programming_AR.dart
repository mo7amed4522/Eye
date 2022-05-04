// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, avoid_print, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_eye/models/program_model_AR.dart';
import '../../../AuthController/auth_controller.dart';
import '../../../AuthController/user_controller.dart';
import '../../../Database/database.dart';
import '../../../Thems/color.dart';
import '../../../constant/custom_icon_btn.dart';
import '../../../constant/my_text_field.dart';
import '../../../constant/text_form.dart';
import 'controller_home_2/controller.dart';

class Update_Progamming_AR extends StatelessWidget {
  Update_Progamming_AR({
    Key? key,
    required this.index,
    required this.noteData,
  }) : super(key: key);
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final ProgammingModelAR noteData;
  final int index;
  num number = 1;
  num dure = 0;
  final AddNewProgrmmingControllerAR _controller =
      Get.put(AddNewProgrmmingControllerAR());

  @override
  Widget build(BuildContext context) {
    _controller.imagePathController.text = noteData.imagePath!;
    _controller.titleController.text = noteData.title!;
    _controller.bodyController.text = noteData.body!;
    _controller.overViewController.text = noteData.overView!;
    _controller.tourPrice = noteData.tourPrice!;
    _controller.durationcontroller.text = noteData.duration!;
    _controller.includecontroller.text = noteData.include!;
    _controller.excludecontroller.text = noteData.exclude!;
    _controller.dura = noteData.dur!;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: size.height,
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
                  width: MediaQuery.of(context).size.width / 7,
                ),
                Text(
                  "تعديل البرنامج السياحي",
                  style: TextStyle(
                    fontSize: 24,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                            child:
                                (_controller.imagePathController.text != null)
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
                    SizedBox(
                      height: 30.0,
                    ),
                    textData(
                      'اسم البرنامج السياحي',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.titleController,
                      hintText: 'اسم الرحلة',
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'نظرة عامة',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.overViewController,
                      max: null,
                      hintText: 'نظرة عامة',
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 25.0,
                          right: 25.0,
                          top: 25.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'قيمة الرحلة',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: DesignCourseAppTheme.nearlyBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 2.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: TextFormField(
                              maxLines: null,
                              key: Key(_controller.tourPrice.toString()),
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              initialValue: _controller.tourPrice.toString(),
                              onChanged: (v) {
                                number = _controller.tourPrice = num.parse(v);
                                print(_controller.tourPrice.toString());
                                print(number);
                              },
                              textCapitalization: TextCapitalization.sentences,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "قيمة الرحلة",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'مدة الرحلة',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.durationcontroller,
                      hintText: 'مدة الرحلة',
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'وقت الرحلة',
                      18.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 2.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: TextFormField(
                              maxLines: null,
                              key: Key(_controller.dura.toString()),
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              initialValue: _controller.dura.toString(),
                              onChanged: (value) {
                                dure = _controller.dura = num.parse(value);
                                print(_controller.dura.toString());
                                print(dure);
                              },
                              textCapitalization: TextCapitalization.sentences,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "وقت الرحلة",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'يشمل',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.includecontroller,
                      hintText: 'يشمل',
                      max: null,
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'يستبعد',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.excludecontroller,
                      hintText: 'يستبعد',
                      max: null,
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textData(
                      'مسار الرحلة',
                      18.0,
                    ),
                    MyTextFormField(
                      controller: _controller.bodyController,
                      max: null,
                      hintText: 'اكتب شئ ما .....',
                      inputType: TextInputType.text,
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
          advanci2edDialog(
            context: context,
            text: 'تحذير !!!!',
            text2: 'عليك الانتظار لمدة دقيقة لكي يتم تغير التعديلات',
          );
          print(number);
        },
        label: Text("حفظ"),
        icon: Icon(Icons.save),
      ),
    );
  }

  void advanci2edDialog({
    BuildContext? context,
    String? text,
    String? text2,
  }) async {
    await showDialog(
      context: context!,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            actions: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                        top: 70,
                        right: 2,
                        bottom: 2,
                      ),
                      child: Column(
                        children: [
                          Text(
                            text!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            text2!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (_controller.Url != null) {
                                      Database().updateProgaimmingAR(
                                        noteData.id!,
                                        _controller.imagePathController.text,
                                        _controller.titleController.text,
                                        _controller.overViewController.text,
                                        number,
                                        _controller.durationcontroller.text,
                                        dure,
                                        _controller.bodyController.text,
                                        _controller.includecontroller.text,
                                        _controller.excludecontroller.text,
                                      );

                                      Get.back();
                                    }

                                    print(number);
                                  },
                                  child: Text(
                                    'Okay',
                                    style: TextStyle(
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/LOGO.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
