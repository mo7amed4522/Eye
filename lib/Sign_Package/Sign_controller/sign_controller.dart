// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Voic_Recognaization/api/speech_api.dart';
import '../../Voic_Recognaization/utils.dart';

class TextInputGetx extends GetxController {
  TextEditingController controller = TextEditingController();
  bool isListenin = false;
  String Name = '';
  String Text = '';
  String Pass = '';
  String LastName = '';
  String Phone = '';

  void toggleRecording() {
    SpeechApi.toggleRecording(
      onResult: (Text) {
        this.Text = Text;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(Text);
            },
          );
        }
      },
    );
  }

  void toggleRecordingName() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.Name = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(Name);
            },
          );
        }
      },
    );
  }

  void toggleRecordingLastName() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.LastName = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(LastName);
            },
          );
        }
      },
    );
  }

  void toggleRecordingPhoneNmuber() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.Phone = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(Phone);
            },
          );
        }
      },
    );
  }

  void togglelRecordingPass() => SpeechApi.toggleRecording(
        onResult: (Text) {
          this.Pass = Text;
          update();
        },
        onListening: (isListenin) {
          this.isListenin = isListenin;
          update();

          if (!isListenin) {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                Utils.scanText(Pass);
              },
            );
          }
        },
      );
}
