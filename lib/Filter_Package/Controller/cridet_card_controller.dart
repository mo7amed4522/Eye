// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutterimport 'dart:html';, non_constant_identifier_names, unnecessary_this
import 'package:get/get.dart';
import '../../Voic_Recognaization/api/speech_api.dart';
import '../../Voic_Recognaization/utils.dart';

class CreditCardController extends GetxController {
  String number = '';
  String expiredDate = '';
  String cvv = '';
  String cardHolder = '';
  bool isListenin = false;

  void toggleRecordingNumber() {
    SpeechApi.toggleRecording(
      onResult: (Text) {
        this.number = Text;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(number);
            },
          );
        }
      },
    );
  }

  void toggleRecordingexpireDate() {
    SpeechApi.toggleRecording(
      onResult: (Text) {
        this.expiredDate = Text;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(expiredDate);
            },
          );
        }
      },
    );
  }

  void toggleRecordingCVV() {
    SpeechApi.toggleRecording(
      onResult: (Text) {
        this.cvv = Text;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(cvv);
            },
          );
        }
      },
    );
  }

  void toggleRecordingCardHoald() {
    SpeechApi.toggleRecording(
      onResult: (Text) {
        this.cardHolder = Text;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(cardHolder);
            },
          );
        }
      },
    );
  }
}
