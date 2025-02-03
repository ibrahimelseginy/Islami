import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String languageCode = 'ar';

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
  }

  void changeLanguageCode(String selectedLanaguage) {
    if (selectedLanaguage == languageCode) return;
    languageCode = selectedLanaguage;
    notifyListeners();
  }
}
