import 'package:flutter/material.dart';

ThemeData getThemeDataDark() => ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Color(0xffFACC1D),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ));
