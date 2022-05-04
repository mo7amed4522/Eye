// ignore_for_file: file_names, must_be_immutable, prefer_final_fields
// ignore_for_file: unnecessary_new, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, missing_return
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../AuthController/auth_controller.dart';
import '../Font/Font_Controller.dart';
import '../constant/time_box.dart';
import 'information_my_trip.dart';
import 'mytrip_controller.dart';

class ListMyTrip extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final MyTripController noteController = Get.find<MyTripController>();
  FontController _controllera = Get.put(FontController());

  ListMyTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textScale = MediaQuery.of(context).textScaleFactor;
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: noteController.notes.length,
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(authController.axisCount.value),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      InformatiomMyDetails(
                        index: index,
                        noteData: noteController.notes[index],
                      ),
                    );
                  },
                  child: getTimeBoxUIPhoto(
                    noteController.noteList[index].title!,
                    noteController.noteList[index].tourPrice.toString(),
                    noteController.noteList[index].imagePath!,
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
