import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isdark");
    if (isDark != null) {
      if (isDark = true) {
        mode = ThemeMode.light;
      } else {
        mode = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    mode = themeMode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', mode == ThemeMode.dark);

    notifyListeners();
  }

  // saveTheme(ThemeMode themeMode) async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString("themeMode", themeMode.toString());
  // }

  // loadTheme() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   String? saveMode = sharedPreferences.getString("themeMode");

  //   if (saveMode == ThemeMode.dark.toString()) {
  //     mode = ThemeMode.dark;
  //   } else if (saveMode == ThemeMode.light.toString()) {
  //     mode = ThemeMode.light;
  //   } else {
  //     mode = ThemeMode.light;
  //   }

  //   notifyListeners();
  // }
}
