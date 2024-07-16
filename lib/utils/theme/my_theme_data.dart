import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/utils/theme/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: MyColors.primaryColor),
      dividerColor: MyColors.primaryColor,
      dividerTheme: const DividerThemeData(color: MyColors.primaryColor),
      primaryColor: MyColors.primaryColor,
      iconTheme: const IconThemeData(color: MyColors.blackColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: MyColors.blackColor),
          backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: MyColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.blackColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MyColors.blackColor),
          bodyMedium: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: MyColors.blackColor),
          bodySmall: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: MyColors.blackColor)));

  ///   darkk   ////
  static ThemeData darkTheme = ThemeData(
      iconTheme: const IconThemeData(color: MyColors.yellowColor),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: MyColors.primaryDarkColor),
      scaffoldBackgroundColor: Colors.transparent,
      dividerColor: MyColors.yellowColor,
      dividerTheme: const DividerThemeData(color: MyColors.yellowColor),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff141A2E),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.yellowColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MyColors.whiteColor),
          bodyMedium: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: MyColors.yellowColor),
          bodySmall: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: MyColors.yellowColor)));
}
