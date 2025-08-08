import 'package:abschluss_projekt/features/add_transaction/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/archivements/presentation/archivements.dart';
import 'package:abschluss_projekt/features/settings/presentation/settings.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/presentation/statistics_dashboard.dart';
import 'package:abschluss_projekt/features/transaction_dashboard/presentation/transaction_dashboard.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});
  // TODO: QR Code Scanner Seite erstellen
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      routes: {
        "/transactionDashboard": (context) => TransactionDashboard(),
        "/addPage": (context) => AddTransaction(themeProvider: themeProvider),
        "/statisticsDashboard": (context) => StatisticsDashboard(),
        "/archivements": (context) => Archivements(),
        "/settings": (context) => Settings(themeProvider: themeProvider),
      },
      home: TransactionDashboard(),
    );
  }
}
