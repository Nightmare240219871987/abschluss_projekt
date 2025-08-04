import 'package:abschluss_projekt/features/splash/presentation/splash.dart';
import 'package:abschluss_projekt/features/add_page/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/dashboard/presentation/dashboard.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});
  // TODO: Statistik Seite erstellen
  // TODO: Erfolge Seite erstellen
  // TODO: QR Code Scanner Seite erstellen
  // TODO: Theme erstellen
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      routes: {
        "/splash": (context) => Splash(),
        "/home": (context) => Dashboard(themeProvider: themeProvider),
        "/addPage": (context) => AddTransaction(themeProvider: themeProvider),
      },
      home: Dashboard(themeProvider: themeProvider),
    );
  }
}
