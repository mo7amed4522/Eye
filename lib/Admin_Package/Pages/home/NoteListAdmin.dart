// ignore_for_file: file_names, import_of_legacy_library_into_null_safe
// ignore_for_file: unnecessary_new, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, missing_return
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../AuthController/auth_controller.dart';
import '../../../Home_Page_En/EN_controller.dart';
import '../../../constant/time_box.dart';
import 'informationPAge.dart';

class NoteListAdmin extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final ProgammingController noteController = Get.find<ProgammingController>();

  NoteListAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: noteController.programs.length,
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
                      InformatonDetailsAdmin(
                        index: index,
                        noteData: noteController.programs[index],
                      ),
                    );
                  },
                  child: getTimeBoxUIPhoto(
                    noteController.programs[index].title!,
                    noteController.programs[index].tourPrice.toString(),
                    noteController.programs[index].imagePath!,
                    true,
                    14.0 * textScale,
                    false,
                    index,
                    context,
                    //index,
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
