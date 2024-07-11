import 'package:flutter/material.dart';

ThemeData getThemeDataLight() => ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xffB7935F),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ),
    );
