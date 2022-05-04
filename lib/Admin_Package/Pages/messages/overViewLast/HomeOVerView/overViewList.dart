// ignore_for_file: unnecessary_new, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, missing_return, file_names, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../AuthController/auth_controller.dart';
import '../../../../../constant/time_box.dart';
import '../../../../../controllers/InformationTourism.dart';
import '../overViewLast.dart';

class OverViewList extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final InformationToursit noteController = Get.find<InformationToursit>();

  OverViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: noteController.info.length,
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(authController.axisCount.value),
        crossAxisCount: 1,
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
                      OverViewLastView(
                        index: index,
                        infoData: noteController.info[index],
                      ),
                    );
                  },
                  child: getTimeBoxUIPhoto(
                    noteController.informationList[index].firstName! +
                        "   " +
                        noteController.informationList[index].lastName!,
                    noteController.informationList[index].totailPrice
                        .toString(),
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPIWNxqYlgwcPj7JZDM_5pS7nf-Gy9ySNmD4WOLHd_YGhEILVR-DqzJ6FIEdbMw-dxoY&usqp=CAU',
                    true,
                    14.0 * textScale,
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
