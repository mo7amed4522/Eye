// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../Thems/color.dart';

class FirstLayerAR extends StatelessWidget {
  const FirstLayerAR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              DesignCourseAppTheme.nearlyBlue,
              DesignCourseAppTheme.nearlyWhite
            ],
          ),
        ),
        //child: Center(child: Text('Kahled')),
      ),
    );
  }
}
