// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final Color? color;
  final Function? onPressed;
  final Widget? icon;
  CustomIconBtn({
    this.color,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: icon,
      ),
    );
  }
}

void navigateAndKill(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
