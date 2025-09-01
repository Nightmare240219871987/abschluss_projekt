import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/features/add_transaction/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/archivements/presentation/archivements.dart';
import 'package:abschluss_projekt/features/login_screen/presentation/login_screen.dart';
import 'package:abschluss_projekt/features/settings/presentation/settings.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/presentation/statistics_dashboard.dart';
import 'package:abschluss_projekt/features/transaction_dashboard/presentation/transaction_dashboard.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  final DatabaseRepository db;
  const AppHome({super.key, required this.db});
  // TODO: QR Code Scanner Seite erstellen
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
        "/dashboard": (context) => TransactionDashboard(db: db),
        "/addPage": (context) => AddTransaction(themeProvider: themeProvider),
        "/statistics": (context) => StatisticsDashboard(),
        "/archivements": (context) => Archivements(),
        "/settings": (context) => Settings(themeProvider: themeProvider),
        "/login": (context) => LoginScreen(db: db),
      },
      initialRoute: "/login",
    );
  }
}
