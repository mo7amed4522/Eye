// ignore_for_file: file_names, unnecessary_new, prefer_const_constructors, unused_element
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import '../Home_Page_AR/home_AR.dart';
import 'SecondLAyerAR.dart';

class HomePageARCustom extends StatefulWidget {
  const HomePageARCustom({Key? key}) : super(key: key);

  @override
  _HomePageARCustomState createState() => _HomePageARCustomState();
}

class _HomePageARCustomState extends State<HomePageARCustom>
    with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(
            x: xoffSet,
            y: yoffSet,
          )
          .rotate(
            angle,
          )
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius:
              isOpen ? BorderRadius.circular(10) : BorderRadius.circular(0),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              !isOpen
                  ? Positioned(
                      top: 10,
                      left: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              xoffSet = 150;
                              yoffSet = 80;
                              angle = -0.2;
                              isOpen = true;
                            },
                          );
                          secondLayerARState!.setState(
                            () {
                              secondLayerARState!.xoffSet = 122;
                              secondLayerARState!.yoffSet = 110;
                              secondLayerARState!.angle = -0.275;
                            },
                          );
                        },
                      ),
                    )
                  : Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          if (isOpen == true) {
                            setState(
                              () {
                                xoffSet = 0;
                                yoffSet = 0;
                                angle = 0;
                                isOpen = false;
                              },
                            );
                            secondLayerARState!.setState(
                              () {
                                secondLayerARState!.xoffSet = 0;
                                secondLayerARState!.yoffSet = 0;
                                secondLayerARState!.angle = 0;
                              },
                            );
                          }
                        },
                      ),
                    ),
              HomePageAR(),
            ],
          ),
        ),
      ),
    );
  }
}
