// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, must_be_immutable, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Font/Font_Controller.dart';

class ListTileSetting extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final IconData? iconData;
  final Widget? subtitle;

  ListTileSetting({
    this.title,
    this.iconData,
    this.onTap,
    this.subtitle,
  });
  FontController _controllera = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          onTap: () {
            onTap!();
          },
          leading: Icon(
            iconData,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            title!,
            style: TextStyle(
              fontSize: _controllera.defaultLArgeSize,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: ((20)),
            color: Theme.of(context).iconTheme.color,
          ),
          subtitle: subtitle,
        ),
        Divider(
          indent: 60,
          thickness: 2,
        ),
      ],
    );
  }
}
