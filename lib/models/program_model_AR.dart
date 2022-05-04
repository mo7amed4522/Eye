// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgammingModelAR {
  String? id;
  String? imagePath;
  String? title;
  String? overView;
  num? tourPrice;
  String? duration;
  num? dur;
  String? body;
  String? include;
  String? exclude;

  ProgammingModelAR({
    this.id,
    this.imagePath,
    this.title,
    this.overView,
    this.tourPrice,
    this.duration,
    this.dur,
    this.body,
    this.include,
    this.exclude,
  });

  ProgammingModelAR.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    imagePath = documentSnapshot['imagePath'];
    title = documentSnapshot['title'];
    overView = documentSnapshot["overView"];
    tourPrice = documentSnapshot["tourPrice"];
    duration = documentSnapshot["duration"];
    dur = documentSnapshot["dur"];
    body = documentSnapshot["body"];
    include = documentSnapshot["include"];
    exclude = documentSnapshot["exclude"];
  }

  ProgammingModelAR.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    imagePath = json['imagePath'];
    title = json['title'];
    overView = json["overView"];
    tourPrice = json["tourPrice"];
    duration = json["duration"];
    dur = json["dur"];
    body = json["body"];
    include = json["include"];
    exclude = json["exclude"];
  }
}
