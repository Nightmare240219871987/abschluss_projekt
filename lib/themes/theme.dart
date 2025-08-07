import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF392FFF),
  secondaryHeaderColor: const Color(0xFFeeeeee),
  scaffoldBackgroundColor: const Color(0xFFeeeeee),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color(0xFFeeeeee),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFeeeeee),
    foregroundColor: const Color(0xff111111),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0xFF392FFF),
    foregroundColor: const Color(0xFFeeeeee),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xff111111)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xff111111)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xff111111)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
      ),
      backgroundColor: WidgetStatePropertyAll(const Color(0xFF392FFF)),
      foregroundColor: WidgetStatePropertyAll(const Color(0xFFeeeeee)),
    ),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: const Color(0xFF392FFF),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  ),
  listTileTheme: ListTileThemeData(minLeadingWidth: 125),
  cardTheme: CardThemeData(color: const Color(0xFF392FFF), elevation: 4),
  brightness: Brightness.light,
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF392FFF),
  secondaryHeaderColor: const Color(0xFFeeeeee),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color(0xFF392FFF),
    foregroundColor: const Color(0xFFeeeeee),
  ),

  cardTheme: CardThemeData(color: const Color(0xFF392FFF), elevation: 4),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFeeeeee)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFeeeeee)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFeeeeee)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4)),
      ),
      backgroundColor: WidgetStatePropertyAll(const Color(0xFF392FFF)),
      foregroundColor: WidgetStatePropertyAll(const Color(0xFFeeeeee)),
    ),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: const Color(0xFF392FFF),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  ),

  listTileTheme: ListTileThemeData(minLeadingWidth: 125),
  brightness: Brightness.dark,
);

const Color blueCardRed = Color.fromARGB(255, 241, 103, 93);
