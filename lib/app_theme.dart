import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color black = Color(0xff242424);
  static Color white = Color(0xffF8F8F8);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      backgroundColor: primaryLight,
      unselectedItemColor: white,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.amiri(
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: black,
          ),
        )),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: black,
        ),
      ),
      titleMedium: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: black,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
