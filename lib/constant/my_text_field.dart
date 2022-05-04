// ignore_for_file: prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, body_might_complete_normally_nullable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.onTap,
    this.suffix,
    this.controller,
    this.suffixPreesed,
    required this.validation,
    this.prefics,
    this.text,
    this.enable,
    this.max,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  dynamic onTap;
  final IconData? suffix;
  final IconData? prefics;
  final String Function(String) validation;
  final Function? suffixPreesed;
  TextEditingController? controller = TextEditingController();
  String? text;
  bool? enable = true;
  int? max = 2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10,
      ),
      child: Material(
        elevation: 15.0,
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          maxLines: max,
          enabled: enable,
          initialValue: text,
          autofocus: false,
          validator: (value) {
            validation(value!);
          },
          controller: controller,
          onTap: onTap,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefics,
              color: Theme.of(context).iconTheme.color,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  suffixPreesed!();
                },
                icon: Icon(
                  suffix,
                  color: Colors.grey,
                ),
              ),
            ),
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
