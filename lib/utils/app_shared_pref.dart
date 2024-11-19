import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  static late SharedPreferences sharedpref;
  static init() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedpref.setInt(key, value);
    } else if (value is double) {
      return await sharedpref.setDouble(key, value);
    } else if (value is bool) {
      return await sharedpref.setBool(key, value);
    } else {
      return await sharedpref.setString(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedpref.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedpref.remove(key);
  }
}
