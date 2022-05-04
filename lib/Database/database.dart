// ignore_for_file: avoid_print, prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/Information.dart';
import '../models/progam_model_EN.dart';
import '../models/program_model_AR.dart';
import '../models/user.dart';

class Database extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = "users";
  final String bookCollection = "book";

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection(userCollection).doc(user.id).set({
        "id": user.id,
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(userCollection).doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addUserProgamming(
    String uid,
    String imagePath,
    String title,
    String overView,
    num tourPrice,
    String duration,
    num dur,
    String body,
    String include,
    String exculde,
  ) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(bookCollection)
          .doc(uuid)
          .set({
        "id": uuid,
        "imagePath": imagePath,
        "title": title,
        "overView": overView,
        "tourPrice": tourPrice,
        "duration": duration,
        "dur": dur,
        "body": body,
        "include": include,
        "exclude": exculde,
      });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> addedProgamming(
    String id,
    String name,
    String startDate,
    String endDate,
    num totailPrice,
    num adult,
    num child,
    String manTranslate,
    String firstName,
    String lastName,
    String phoneNumber,
    num numberChild,
    num numberAdult,
  ) async {
    try {
      // var uuid = Uuid().v4();
      await _firestore.collection('Booked').doc(id).set(
        {
          //"id": uuid,
          "idman": id,
          'name': name,
          "startDate": startDate,
          "endDate": endDate,
          "totailPrice": totailPrice,
          "adult": adult,
          "child": child,
          "manTranslate": manTranslate,
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "numberAdult": numberAdult,
          "numberChild": numberChild,
        },
      );
      //  x = uuid;
      update();
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> updatedProgamming(
    String uid,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    try {
      await _firestore.collection('Booked').doc(uid).update({
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> addNewProgaimmingEn(
    String id,
    String imagePath,
    String title,
    String overView,
    num tourPrice,
    String duration,
    num dur,
    String body,
    String include,
    String exculde,
  ) async {
    try {
      var uuid = Uuid().v4();
      await _firestore.collection('TourProgammingEN').doc(uuid).set({
        "id": uuid,
        "imagePath": imagePath,
        "title": title,
        "overView": overView,
        "tourPrice": tourPrice,
        "duration": duration,
        "dur": dur,
        "body": body,
        "include": include,
        "exclude": exculde,
      });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> updateProgaimmingEN(
    //String uid,
    String id,
    String imagePath,
    String title,
    String overView,
    num tourPrice,
    String duration,
    num dur,
    String body,
    String include,
    String exculde,
  ) async {
    try {
      await _firestore.collection('TourProgammingEN').doc(id).update({
        "imagePath": imagePath,
        "title": title,
        "overView": overView,
        "tourPrice": tourPrice,
        "duration": duration,
        "dur": dur,
        "body": body,
        "include": include,
        "exclude": exculde,
      }).then((value) => {
            print('tmam'),
          });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> deleteProgammingEN(
    String uid,
    String id,
  ) async {
    try {
      await _firestore.collection('TourProgammingEN').doc(uid).delete();
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> addNewProgaimmingAR(
    String id,
    String imagePath,
    String title,
    String overView,
    num tourPrice,
    String duration,
    num dur,
    String body,
    String include,
    String exculde,
  ) async {
    try {
      var uuid = Uuid().v4();
      await _firestore.collection('TourProgammingAR').doc(uuid).set({
        "id": uuid,
        "imagePath": imagePath,
        "title": title,
        "overView": overView,
        "tourPrice": tourPrice,
        "duration": duration,
        "dur": dur,
        "body": body,
        "include": include,
        "exclude": exculde,
      });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> updateProgaimmingAR(
    String id,
    String imagePath,
    String title,
    String overView,
    num tourPrice,
    String duration,
    num dur,
    String body,
    String include,
    String exculde,
  ) async {
    try {
      await _firestore.collection('TourProgammingAR').doc(id).update({
        "imagePath": imagePath,
        "title": title,
        "overView": overView,
        "tourPrice": tourPrice,
        "duration": duration,
        "dur": dur,
        "body": body,
        "include": include,
        "exclude": exculde,
      });
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> deleteProgammingAR(
    String uid,
    String id,
  ) async {
    try {
      await _firestore.collection('TourProgammingAR').doc(uid).delete();
    } catch (e) {
      print('e.message');
    }
  }

  Future<void> deleteBookedUser(
    String name,
  ) async {
    try {
      var collection = FirebaseFirestore.instance.collection('Booked');
      var snapShot = await collection.where('firstName', isEqualTo: name).get();
      return await snapShot.docs.first.reference.delete();
    } catch (e) {
      print('e.message');
    }
  }

  Future deletePhotoStroge(var Url) async {
    FirebaseStorage.instance.refFromURL(Url).delete();
  }

  Stream<List<ProgammingModelEn>> ProgamingStream() {
    return _firestore
        .collection('TourProgammingEN')
        .orderBy("title", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProgammingModelEn> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProgammingModelEn.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<ProgammingModelAR>> ProgamingStreamAr() {
    return _firestore
        .collection('TourProgammingAR')
        .orderBy("title", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProgammingModelAR> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProgammingModelAR.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<Information>> InformationStream() {
    return _firestore
        .collection('Booked')
        .orderBy("name", descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<Information> retVal = [];
        query.docs.forEach(
          (element) {
            retVal.add(
              Information.fromDocumentSnapshot(
                element,
              ),
            );
          },
        );
        return retVal;
      },
    );
  }

  Stream<List<ProgammingModelEn>> myTrip(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection('book')
        .orderBy("title", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProgammingModelEn> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProgammingModelEn.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
