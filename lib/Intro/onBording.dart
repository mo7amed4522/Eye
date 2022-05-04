// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:my_eye/First_time/choice.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import '../Font/Font_Controller.dart';
import '../Thems/color.dart';
import '../cashHelper/cahHelper.dart';
import '../constant/custom_icon_btn.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.body,
    required this.title,
  });
}

class OnBoarding extends StatelessWidget {
  final PageController onBoardController = PageController();

  List<BoardingModel> boardingModel = [
    BoardingModel(
      image: 'assets/image1.jpeg',
      body:
          'The application is very easy to use and if you need help, we are at your service for 24 hours and all transactions through the application by using your voice'
              .tr,
      title: 'Usability'.tr,
    ),
    BoardingModel(
      image: 'assets/image2.png',
      body: 'Book your flight while you are in your home or anywhere'.tr,
      title: 'From anywhere'.tr,
    ),
    BoardingModel(
      image: 'assets/image3.png',
      body:
          'We will guarantee your safety and security throughout the trip and throughout your use of the application'
              .tr,
      title: 'Security and safety. Be assured, we are with you'.tr,
    ),
    BoardingModel(
      image: 'assets/image4.png',
      body:
          'The application is free for the first time user and this is for a limited period'
              .tr
              .tr,
      title: 'For free'.tr,
    ),
  ];
  bool isLast = false;

  OnBoarding({
    Key? key,
  }) : super(
          key: key,
        );
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    // final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 1,
          bottom: 20,
          right: 1,
          left: 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boardingModel.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                itemBuilder: (context, index) => onBoarding(
                  boardingModel[index],
                  context,
                  _controllera.defaultLArgeSize,
                  _controllera.defaultmiduemSize,
                ),
                itemCount: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    controller: onBoardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: DesignCourseAppTheme.nearlyBlue,
                      expansionFactor: 4,
                      dotHeight: 10,
                      dotWidth: 20,
                      spacing: 10,
                    ),
                    count: 4,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        CasheHelper.saveData(
                          key: 'ShowOnBoard',
                          value: false,
                        ).then((value) => {
                              if (value)
                                navigateAndKill(
                                  context,
                                  ChoicePage(),
                                ),
                            });
                      } else {
                        onBoardController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget onBoarding(
    model,
    context,
    double textscal1,
    double textscal2,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                  bottomLeft: const Radius.circular(50.0),
                  bottomRight: const Radius.circular(50.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    '${model.image}',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          separator(0, 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${model.title}',
              style: TextStyle(
                fontSize: textscal1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          separator(
            0,
            20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${model.body}',
              style: TextStyle(
                fontSize: textscal2,
              ),
            ),
          ),
          separator(
            0,
            50,
          ),
        ],
      );
}

Widget separator(
  double wide,
  double high,
) {
  return SizedBox(
    width: wide,
    height: high,
  );
}
