// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_field, prefer_final_fields, avoid_print, sized_box_for_whitespace, unused_element, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_eye/constant/default_button.dart';
import 'package:my_eye/models/program_model_AR.dart';
import '../AuthController/auth_controller.dart';
import '../Checkout/checkout.dart';
import '../Database/database.dart';
import '../Font/Font_Controller.dart';
import '../Thems/color.dart';
import '../constant/custom_icon_btn.dart';
import 'Controller/filter_controller.dart';

class FlutterPage extends StatelessWidget {
  FlutterPage({
    Key? key,
    required this.noteData,
    required this.index,
  }) : super(key: key);
  num x = 1;
  ProgammingModelAR noteData;
  int index;
  num dur = 0;
  DateTime _value = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController durationontroller = TextEditingController();
  AuthController authController = Get.find<AuthController>();
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    x = noteData.tourPrice!;
    durationontroller.text = noteData.duration!;
    titleController.text = noteData.title!;
    dur = noteData.dur!;
    //final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FilterController>(
          init: FilterController(),
          builder: (_contoller) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIconBtn(
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  Text(
                    "Flight Confirmation".tr,
                    style: TextStyle(
                      fontSize: _controllera.defaultLArgeSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
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
                                'The Start Date'.tr,
                                style: TextStyle(
                                  fontSize: _controllera.defaultmiduemSize,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                              onTap: () async {
                                showDatePicker(
                                  builder: ((context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors
                                              .yellow, // header background color
                                          onPrimary:
                                              Colors.black, // header text color
                                          onSurface:
                                              Colors.green, // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary:
                                                Colors.red, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  }),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(30000),
                                ).then((value) {
                                  _contoller.startDate.text =
                                      DateFormat.yMMMd().format(value!);
                                  _value = value;
                                  print(value.toString());
                                });
                              },
                              controller: _contoller.startDate,
                              keyboardType: TextInputType.none,
                              // enabled: false,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "The Start Date",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                                'The End Date'.tr,
                                style: TextStyle(
                                  fontSize: _controllera.defaultmiduemSize,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                              onTap: () {
                                DateTime value =
                                    _value.add(Duration(days: dur.toInt()));
                                _contoller.endDate.text =
                                    DateFormat.yMMMd().format(value);
                                print(value);
                              },
                              onChanged: (vlau) {
                                vlau = _value.add(Duration(days: 1)).toString();
                                _contoller.endDate.text = DateFormat.yMMMd()
                                    .format(DateTime.parse(vlau));
                              },
                              controller: _contoller.endDate,
                              keyboardType: TextInputType.none,
                              keyboardAppearance: Brightness.dark,
                              decoration: const InputDecoration(
                                hintText: "The End Date",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 10,
                        right: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adult  (1 - 10)'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultmiduemSize,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _contoller.increaseAdult(x);
                                  },
                                  child: Container(
                                    height: 33,
                                    width: 33,
                                    //padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                        bottomLeft: const Radius.circular(40.0),
                                        bottomRight:
                                            const Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add_outlined
                                          // size: 30,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${_contoller.counterAdult}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _contoller.decruceAdult(x);
                                  },
                                  child: Container(
                                    height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                        bottomLeft: const Radius.circular(40.0),
                                        bottomRight:
                                            const Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 10,
                        right: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Child   (1 - 10)'.tr,
                            style: TextStyle(
                              fontSize: _controllera.defaultmiduemSize,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _contoller.increaseChild(x / 2);
                                  },
                                  child: Container(
                                    height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                        bottomLeft: const Radius.circular(40.0),
                                        bottomRight:
                                            const Radius.circular(40.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_outlined,
                                        // size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  8.0,
                                ),
                                child: Text(
                                  '${_contoller.counterChild}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _contoller.decruceChild(
                                      x / 2,
                                    );
                                  },
                                  child: Container(
                                    height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(
                                          40.0,
                                        ),
                                        topRight: const Radius.circular(
                                          40.0,
                                        ),
                                        bottomLeft: const Radius.circular(
                                          40.0,
                                        ),
                                        bottomRight: const Radius.circular(
                                          40.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'Tourist guide'.tr,
                        style: TextStyle(
                          fontSize: _controllera.defaultmiduemSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        25.0,
                      ),
                      child: DropdownButton(
                        value: _contoller.dropdownvalue.tr,
                        isExpanded: true,
                        isDense: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        items: _contoller.items.map((String items) {
                          return DropdownMenuItem(
                            value: items.tr,
                            child: Container(
                              width: double.infinity,
                              //alignment: Alignment.centerLeft,
                              child: Text(items.tr),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          _contoller.dropdownvalue = newValue.toString();
                          _contoller.update();
                          print(_contoller.dropdownvalue);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            25,
                          ),
                          child: Icon(
                            Icons.schedule_outlined,
                            size: 30,
                          ),
                        ),
                        Text(
                          durationontroller.text,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Icon(
                            Icons.book_online_outlined,
                            size: 30,
                          ),
                        ),
                        Text(
                          'Mobile Ticket'.tr,
                          style: TextStyle(
                            fontSize: _controllera.defaultmiduemSize,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        num total = _contoller.countAd + _contoller.countCH;
                        _advainceDialog(
                          context,
                          '${titleController.text}',
                          '${_contoller.dropdownvalue}',
                          '${durationontroller.text}',
                          '${_contoller.counterAdult}',
                          '${_contoller.countAd}',
                          '${_contoller.counterChild}',
                          '${_contoller.countCH}',
                          '$total',
                          _controllera.defaultmiduemSize,
                        );
                        Database().addedProgamming(
                          authController.user.uid,
                          authController.user.email!,
                          _contoller.startDate.text,
                          _contoller.endDate.text,
                          total,
                          _contoller.countAd,
                          _contoller.countCH,
                          _contoller.dropdownvalue,
                          '',
                          '',
                          '',
                          _contoller.counterChild,
                          _contoller.counterAdult,
                        );
                      },
                      child: animatedOptacity(
                        'Check Availability'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _advainceDialog(
    BuildContext context,
    String _text1,
    String _text2,
    String _text3,
    String _num1,
    String _price1,
    String _num2,
    String _price2,
    String _totalPrice,
    double text,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
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
                            'Confirm'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: text,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _text1,
                            style: TextStyle(
                              fontSize: text,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _text2,
                            style: TextStyle(
                              fontSize: text,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _text3,
                            style: TextStyle(
                              fontSize: text,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  'Adults'.tr,
                                ),
                              ),
                              Text(
                                _num1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  _price1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  'Childern'.tr,
                                ),
                              ),
                              Text(
                                _num2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  _price2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  'Total price'.tr,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Text(
                                  _totalPrice,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              25.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Cancel'.tr,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: text,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      CheckOut(),
                                    );
                                  },
                                  child: Text(
                                    'Confirm'.tr,
                                    style: TextStyle(
                                      color: DesignCourseAppTheme.nearlyBlue,
                                      fontSize: text,
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
                            image: AssetImage('assets/LOGO.jpeg'),
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
