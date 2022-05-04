// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, avoid_print, unused_local_variable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../AuthController/auth_controller.dart';
import '../../../AuthController/user_controller.dart';
import '../../../Database/database.dart';
import '../../../Thems/color.dart';
import '../../../constant/custom_icon_btn.dart';
import '../../../constant/my_text_field.dart';
import '../../../constant/text_form.dart';
import '../../../models/progam_model_EN.dart';
import 'controller_home_1/controller.dart';

class Update_Progamming_EN extends StatelessWidget {
  Update_Progamming_EN({
    Key? key,
    required this.index,
    required this.noteData,
  }) : super(key: key);
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final ProgammingModelEn noteData;
  final int index;
  num number = 0;
  num dura = 0;

  final AddNewProgrmmingController _controller =
      Get.put(AddNewProgrmmingController());

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
    _controller.dur = noteData.dur!;
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
                  "Update Programming",
                  style: TextStyle(
                    fontSize: 20,
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
                      'Title',
                      20.0,
                    ),
                    MyTextFormField(
                      controller: _controller.titleController,
                      hintText: 'title',
                      inputType: TextInputType.text,
                      max: null,
                      validation: (value) {
                        return value;
                      },
                    ),
                    textData(
                      'overView',
                      20.0,
                    ),
                    MyTextFormField(
                      controller: _controller.overViewController,
                      max: null,
                      hintText: 'overView',
                      inputType: TextInputType.text,
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
                              key: Key(_controller.tourPrice.toString()),
                              onChanged: (v) {
                                number =
                                    _controller.changeTourPrice(num.parse(v));
                                number = _controller.tourPrice = num.parse(v);
                                print(_controller.tourPrice.toString());
                                print(number);
                              },
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              initialValue: _controller.tourPrice.toString(),
                              onTap: () {
                                print(number);
                              },
                              textCapitalization: TextCapitalization.sentences,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "TourPrice",
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
                      'duration',
                      20.0,
                    ),
                    MyTextFormField(
                      controller: _controller.durationcontroller,
                      hintText: 'duration',
                      inputType: TextInputType.text,
                      validation: (value) {
                        return value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textData(
                      'Duration Data',
                      20.0,
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
                              key: Key(_controller.dur.toString()),
                              onChanged: (value) {
                                dura = _controller
                                    .changeDuration(num.parse(value));
                                dura = _controller.dur = num.parse(value);
                                print(_controller.dur.toString());
                                print(dura);
                              },
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              initialValue: _controller.dur.toString(),
                              onTap: () {
                                print(dura);
                              },
                              textCapitalization: TextCapitalization.sentences,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "Duration Date",
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
                      'Include',
                      20.0,
                    ),
                    MyTextFormField(
                      controller: _controller.includecontroller,
                      hintText: 'Include',
                      inputType: TextInputType.text,
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
                      controller: _controller.excludecontroller,
                      hintText: 'Exclude',
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
                      'Itinerary',
                      20.0,
                    ),
                    MyTextFormField(
                      controller: _controller.bodyController,
                      inputType: TextInputType.text,
                      hintText: 'Type something...',
                      max: null,
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
          advanciedDialog(
            context: context,
            text: 'Warring  !!!',
            text2: 'You have to wait a minute for the changes to take place',
          );
          //_advainceDialog(context);
          print(number);
        },
        label: Text("Save"),
        icon: Icon(Icons.save),
      ),
    );
  }

  void advanciedDialog({
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
                                      Database().updateProgaimmingEN(
                                        noteData.id!,
                                        _controller.Url,
                                        _controller.titleController.text,
                                        _controller.overViewController.text,
                                        number,
                                        _controller.durationcontroller.text,
                                        dura,
                                        _controller.bodyController.text,
                                        _controller.includecontroller.text,
                                        _controller.excludecontroller.text,
                                      );
                                    }
                                    Get.back();
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
