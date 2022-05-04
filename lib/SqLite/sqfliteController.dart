// ignore_for_file: file_names, unnecessary_this, prefer_const_constructors, non_constant_identifier_names, prefer_function_declarations_over_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_eye/SqLite/sqliteModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Thems/color.dart';
import '../Voic_Recognaization/api/speech_api.dart';
import '../Voic_Recognaization/utils.dart';
import '../country_picker/model/country.dart';
import '../country_picker/page/country_page.dart';
import '../country_picker/widget/flage_widget.dart';

class SqfLiteController extends GetxController {
  TextEditingController nameCardController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpirayionController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool isListenin = false;
  String nameCard = '';
  String cardNumber = '';
  String cardExpirayion = '';
  String cvv = '';
  Country? countr;

//name Card
  void toggleRecordingNameCard() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.nameCard = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(nameCard);
            },
          );
        }
      },
    );
  }

  //Card Number
  void toggleRecordingCardNumber() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.cardNumber = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(cardNumber);
            },
          );
        }
      },
    );
  }

  //Card Expirayion
  void toggleRecordingCardExpirayion() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.cardExpirayion = Name;
        update();
      },
      onListening: (isListenin) {
        this.isListenin = isListenin;
        update();
        if (!isListenin) {
          Future.delayed(
            Duration(seconds: 1),
            () {
              Utils.scanText(cardExpirayion);
            },
          );
        }
      },
    );
  }

  //Card Expirayion
  void toggleRecordingCVV() {
    SpeechApi.toggleRecording(
      onResult: (Name) {
        this.cvv = Name;
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

//Now inside this we can initialize the database
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,contry TEXT NOT NULL, cardName TEXT NOT NULL, cardExpiration TEXT NOT NULL,cvv INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  //Saving Data in SQLite
  Future<int> insertUser(List<Checkout> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  //Retrieve Data From SQLite
  Future<List<Checkout>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => Checkout.fromMap(e)).toList();
  }

  //Delete Data From SQLite
  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Widget buildSingleCountry(
    context,
  ) {
    final onTap = () async {
      final country = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CountryPage()),
      );

      if (country == null) return;

      this.countr = country;
      update();
    };

    return buildCountryPicker(
      title: 'Select Country'.tr,
      child: countr == null
          ? buildListTile(
              title: 'Not Yet'.tr,
              onTap: onTap,
            )
          : buildListTile(
              title: countr!.name,
              leading: FlagWidget(code: countr!.code),
              onTap: onTap,
            ),
    );
  }

  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
    Widget? leading,
  }) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
    );
  }

  Widget buildCountryPicker({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: DesignCourseAppTheme.nearlyBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(margin: EdgeInsets.zero, child: child),
        ],
      );
}
