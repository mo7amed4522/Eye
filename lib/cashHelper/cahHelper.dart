// ignore_for_file: file_names, missing_return
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

bool? token;
String? userName;
String? password;

class CasheHelper {
  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    return sharedPref!.get(key);
  }

  static Future<dynamic> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) return await sharedPref!.setInt(key, value);
    if (value is bool) return await sharedPref!.setBool(key, value);
    return await sharedPref!.setDouble(key, value);
  }

  static Future<dynamic> savaString({
    required String key,
    required String value,
  }) async {
    return await sharedPref!.setString(key, value);
  }

  static Future<bool> removeData(String key) async {
    return await sharedPref!.remove(key);
  }
}
