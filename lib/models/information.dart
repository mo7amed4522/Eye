import 'package:cloud_firestore/cloud_firestore.dart';

class Information {
  String? email = '';
  String? startDate = '';
  String? endDate = '';
  num? totailPrice;
  num? adult;
  num? child;
  String? manTranslate;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  num? numberChild;
  num? numberAdult;

  Information({
    this.email,
    this.startDate,
    this.endDate,
    this.totailPrice,
    this.adult,
    this.child,
    this.manTranslate,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.numberAdult,
    this.numberChild,
  });

  Information.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    email = documentSnapshot['name'];
    startDate = documentSnapshot['startDate'];
    endDate = documentSnapshot["endDate"];
    totailPrice = documentSnapshot["totailPrice"];
    adult = documentSnapshot["adult"];
    child = documentSnapshot["child"];
    manTranslate = documentSnapshot["manTranslate"];
    firstName = documentSnapshot["firstName"];
    lastName = documentSnapshot["lastName"];
    phoneNumber = documentSnapshot["phoneNumber"];
    numberAdult = documentSnapshot["numberAdult"];
    numberChild = documentSnapshot["numberChild"];
  }

  Information.fromJson(Map<String, dynamic> json) {
    email = json['name'];
    startDate = json['startDate'];
    endDate = json["endDate"];
    totailPrice = json["totailPrice"];
    adult = json["adult"];
    child = json["child"];
    manTranslate = json["manTranslate"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    phoneNumber = json["phoneNumber"];
    numberAdult = json["numberAdult"];
    numberChild = json["numberChild"];
  }
}
