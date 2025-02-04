import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryLight = const Color(0xffB7935F);
  static Color primaryDark = const Color(0xff141A2E);
  static Color black = const Color(0xff242424);
  static Color gold = const Color(0xffFACC1D);
  static Color white = const Color(0xffF8F8F8);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      backgroundColor: primaryLight,
      unselectedItemColor: white,
      type: BottomNavigationBarType.shifting,
    ),
    brightness: Brightness.light,
    dividerTheme: DividerThemeData(color: primaryLight),
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
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: gold,
      backgroundColor: primaryDark,
      unselectedItemColor: white,
      type: BottomNavigationBarType.shifting,
    ), brightness: Brightness.dark,
    dividerTheme: DividerThemeData(color: gold),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.amiri(
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        )),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
      titleMedium: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: gold,
        ),
      ),
    ),
  );
}
