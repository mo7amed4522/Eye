// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import '../Thems/color.dart';

SecondLayerState? secondLayerState;

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();
  // openTab() => createState().openTab();
}

class SecondLayerState extends State<SecondLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 550),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DesignCourseAppTheme.nearlyBlue,
      ),
      child: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
