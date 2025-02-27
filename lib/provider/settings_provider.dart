import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String languageCode = 'ar';
  SharedPreferences? sharedPreferences;

  String get backgroundImageName =>
      themeMode == ThemeMode.light ? 'default_bg' : 'dark_bg';
  String get ImageName_Body_Sebha =>
      themeMode == ThemeMode.light ? 'body_sebha_logo' : 'body_sebha_dark';
  String get ImageName_Head_Sebha =>
      themeMode == ThemeMode.light ? 'head_sebha_logo' : 'head_sebha_dark';

  void changeTheme(ThemeMode selectedTheme) {
    if (selectedTheme == themeMode) return;
    themeMode = selectedTheme;
    notifyListeners();
    saveThemeMode(themeMode);
  }

  void changeLanguageCode(String selectedLanaguage) {
    if (selectedLanaguage == languageCode) return;
    languageCode = selectedLanaguage;
    notifyListeners();
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    String newTheme = themeMode == ThemeMode.dark ? "dark" : "light";
    await sharedPreferences!.setString("theme", newTheme); // key ,value
  }

  String? getThemeMode() {
    return sharedPreferences!.getString("theme"); // key
  }

  Future<void> loadThemeMode() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldTheme = getThemeMode();
    if (oldTheme != null) {
      themeMode = oldTheme == "dark" ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }

    // Future<void> saveLanguageCode() async {
    //   sharedPreferences = await SharedPreferences.getInstance();
    //   sharedPreferences!.setString("languageCode", languageCode);
    // }
  }
}
