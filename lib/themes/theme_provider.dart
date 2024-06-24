import 'package:flutter/material.dart';
import 'package:isar_crud_app/themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  // initially, the theme is light
  ThemeData _themeData = lightMode;

  // getter method to access the theme from another part of the code
  ThemeData get themeData => _themeData;

  // getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle dark to light mode and vice versa
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
