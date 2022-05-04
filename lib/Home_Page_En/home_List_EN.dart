// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, must_be_immutable, prefer_final_fields
// ignore_for_file: unnecessary_new, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, missing_return
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../constant/time_box.dart';
import '../information/infoEN.dart';
import 'EN_controller.dart';

class HomeListEN extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final ProgammingController _progammingController =
      Get.find<ProgammingController>();
  FontController _controllera = Get.put(FontController());

  HomeListEN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textScale = MediaQuery.of(context).textScaleFactor;
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: _progammingController.programs.length,
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(authController.axisCount.value),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return Container(
            //height: 500,
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      InformationDetails(
                        index: index,
                        noteData: _progammingController.programs[index],
                      ),
                    );
                  },
                  child: getTimeBoxUIPhoto(
                    _progammingController.programs[index].title!,
                    _progammingController.programs[index].tourPrice.toString(),
                    _progammingController.programs[index].imagePath!,
                    true,
                    _controllera.defaultmiduemSize,
                    false,
                    index,
                    context,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
