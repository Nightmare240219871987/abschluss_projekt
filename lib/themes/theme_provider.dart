import 'package:abschluss_projekt/themes/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeData _themeData = light;

  ThemeData get themeData => _themeData;

  void setDarkTheme(bool isDark) {
    if (isDark) {
      isDarkMode = true;
      _themeData = dark;
    } else {
      isDarkMode = false;
      _themeData = light;
    }
    notifyListeners();
  }
}
