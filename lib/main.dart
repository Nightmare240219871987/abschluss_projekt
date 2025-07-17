import 'package:abschluss_projekt/Pages/add_page.dart';
import 'package:abschluss_projekt/Pages/home_page.dart';
import 'package:abschluss_projekt/Pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/splash": (context) => Splash(),
        "/home": (context) => HomePage(),
        "/addPage": (context) => AddPage(),
      },
      home: HomePage(),
    );
  }
}
