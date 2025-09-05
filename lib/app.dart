import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/features/add_transaction/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/archivements/presentation/archivements.dart';
import 'package:abschluss_projekt/features/login_screen/presentation/login_screen.dart';
import 'package:abschluss_projekt/features/settings/presentation/settings.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/presentation/statistics_dashboard.dart';
import 'package:abschluss_projekt/features/dashboard/presentation/dashboard.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final DatabaseRepository db;
  const App({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    if (themeProvider.isDarkMode != loadDarkmode()) {
      themeProvider.setDarkTheme(loadDarkmode());
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      routes: {
        "/dashboard": (context) => Dashboard(db: db),
        "/addPage": (context) =>
            AddTransaction(themeProvider: themeProvider, db: db),
        "/statistics": (context) =>
            StatisticsDashboard(db: db, themeProvider: themeProvider),
        "/archivements": (context) => Archivements(db: db),
        "/settings": (context) => Settings(themeProvider: themeProvider),
        "/login": (context) => LoginScreen(db: db),
      },
      initialRoute: "/login",
    );
  }
}
