// ignore_for_file: file_names, prefer_final_fields, avoid_print, unrelated_type_equality_checks, unused_local_variable, unused_catch_clause, empty_catches, await_only_futures, missing_return, prefer_const_constructors, unused_element, body_might_complete_normally_nullable, unused_catch_stack
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_eye/AuthController/user_controller.dart';
import '../Database/database.dart';
import '../models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<int> axisCount = 2.obs;
  final storage = FlutterSecureStorage();

  User get user => _firebaseUser.value!;

  @override
  void onInit() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    super.onInit();
  }

  void createUser() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then(
        (value) {
          UserModel _user = UserModel(
            id: value.user!.uid,
            name: name.text,
            email: email.text,
          );
          Database().createNewUser(_user).then(
            (value) {
              if (value) {
                Get.find<UserController>().user = _user;
                Get.back();
                _clearControllers();
              }
            },
          );
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error creating account'.tr,
        'You must enter the data correctly'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      UserCredential _user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      storeTokenAndData(_user);
      return _user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error logging in'.tr,
        'Email or password wrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> lognOut() async {
    await FirebaseAuth.instance.signOut();
    _googleSignIn.disconnect();
    await storage.delete(key: 'token');
  }

  login() async {
    try {
      print("IN logging in email ${email.text} password ${password.text}");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      storeTokenAndData(userCredential);
      _clearControllers();
      return userCredential;
    } catch (e) {
      Get.snackbar(
        'Error logging in'.tr,
        'Email or password wrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> storeTokenAndData(UserCredential _userCredential) async {
    await storage.write(
      key: 'token',
      value: _userCredential.credential!.token.toString(),
    );
    await storage.write(
      key: 'userCredential',
      value: _userCredential.toString(),
    );
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  accessLogin() async {
    try {
      UserCredential _userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      //storgeTokenAndDate(_userCredential);
      print(_userCredential);
      return _userCredential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error logging in'.tr,
        'Email or password wrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signout() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().user = UserModel();
      await storage.delete(key: 'token');
    } catch (e) {
      Get.snackbar(
        'Error signing out'.tr,
        'Internet connection error'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
