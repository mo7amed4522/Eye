// ignore_for_file: file_names, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, missing_return, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Database/database.dart';
import '../../../../constant/custom_icon_btn.dart';
import '../../../../constant/my_text_field.dart';
import '../../../../constant/text_form.dart';
import '../../../../models/Information.dart';

class OverViewLastView extends StatelessWidget {
  OverViewLastView({
    Key? key,
    required this.index,
    required this.infoData,
  }) : super(
          key: key,
        );
  final int index;
  final Information infoData;
  String email = '';
  String startDate = '';
  String endDate = '';
  num totailPrice = 1;
  num adult = 1;
  num child = 1;
  String manTranslate = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  num numberChild = 1;
  num numberAdult = 1;

  @override
  Widget build(BuildContext context) {
    firstName = infoData.firstName!;
    lastName = infoData.lastName!;
    startDate = infoData.startDate!;
    endDate = infoData.endDate!;
    child = infoData.child!;
    adult = infoData.adult!;
    numberAdult = infoData.numberAdult!;
    numberChild = infoData.numberChild!;
    totailPrice = infoData.totailPrice!;
    email = infoData.email!;
    phoneNumber = infoData.phoneNumber!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "OverView".tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIconBtn(
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {
                        Database().deleteBookedUser(firstName);
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height + 625,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        textData(
                          'First Name',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            enable: false,
                            controller: TextEditingController(
                              text: firstName,
                            ),
                            // text: authController.name.text,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a First Name';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                              }
                              return value;
                            },
                            hintText: 'First Name',
                            inputType: TextInputType.none,
                            prefics: Icons.person_outline_outlined,
                          ),
                        ),
                        textData(
                          'Last Name',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: lastName,
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: 'Last Name',
                            inputType: TextInputType.none,
                            prefics: Icons.person_outline_outlined,
                          ),
                        ),
                        textData(
                          'start Date',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: startDate,
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.date_range_outlined,
                          ),
                        ),
                        textData(
                          'End Date',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: endDate,
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.date_range_outlined,
                          ),
                        ),
                        textData(
                          'EMail Address',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: email,
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.email_outlined,
                          ),
                        ),
                        textData(
                          'Phone Number',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: phoneNumber,
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                //  return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.phone_outlined,
                          ),
                        ),
                        textData(
                          'Number of Child',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: numberChild.toString(),
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                //  return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.child_care_outlined,
                          ),
                        ),
                        textData(
                          'Number of Adult',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: numberAdult.toString(),
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                //  return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.person,
                          ),
                        ),
                        textData(
                          'total of Adult',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: adult.toString(),
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.person,
                          ),
                        ),
                        textData(
                          'total of Child',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: child.toString(),
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                //  return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.child_care_outlined,
                          ),
                        ),
                        textData(
                          'Total Price',
                          20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: MyTextFormField(
                            controller: TextEditingController(
                              text: totailPrice.toString(),
                            ),
                            // text: authController.name.text,
                            enable: false,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                } else if (value.length < 6) {
                                  return "Please provide a username of 5+ character";
                                }
                                // return null;
                              }
                              return value;
                            },
                            hintText: '',
                            inputType: TextInputType.none,
                            prefics: Icons.monetization_on_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
