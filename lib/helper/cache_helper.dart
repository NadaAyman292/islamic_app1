import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;
  static Future<void> cachIntialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// set data
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }

    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }

    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

// get data
  static dynamic getData({required String key}) {
    sharedPreferences.get(key);
  }

  // delete data
  static void deleteData({required String key}) {
    sharedPreferences.remove(key);
  }
}
