// ignore_for_file: file_names
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  static void initializeNotificationService() {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: "basic_channel_key",
        channelName: "Basic Channel",
        channelDescription: "Used to send the main notifications to our users",
        channelShowBadge: true,
        defaultColor: Colors.deepPurple,
        enableLights: true,
        enableVibration: true,
        //setting this to high or max will cause the notification to drop down from the top
        importance: NotificationImportance.Max,
        playSound: true,
        //Use the sound we added to the folders just now
        // soundSource: "resource://raw/res_mysound",
      )
    ]);
  }

  Future<void> createPictureNotification(
    String _title,
    String _body,
    String _imagePath,
  ) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        //The id should be unique
        id: 2,
        channelKey: 'basic_channel_key',
        title: '$_title ${Emojis.art_framed_picture}',
        body: _body,
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: _imagePath,
      ),
    );
  }

  Future<void> cleareAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  @override
  void onInit() {
    super.onInit();
    //Request permission from user to show notifications
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    //Clear badge on controller init as well
    AwesomeNotifications()
        .getGlobalBadgeCounter()
        .then((value) => AwesomeNotifications().setGlobalBadgeCounter(0));

    //Listen to different actions
    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      //We can do stuff like route to a different screen
      //On IOS, the badge count will not decrease by itself, we have to do it here
      AwesomeNotifications()
          .getGlobalBadgeCounter()
          .then((value) => AwesomeNotifications().setGlobalBadgeCounter(0));
    });
    AwesomeNotifications()
        .createdStream
        .listen((ReceivedNotification receivedNotification) {
      //We will display a snackbar to here
      Get.snackbar(
        "Your trip added".tr,
        "Fill in the rest of the information to confirm trip".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
//Close streams
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
  }
}
