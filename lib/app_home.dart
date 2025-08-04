import 'package:abschluss_projekt/features/splash/presentation/splash.dart';
import 'package:abschluss_projekt/features/add_page/presentation/add_transaction.dart';
import 'package:abschluss_projekt/features/dashboard/presentation/dashboard.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // TODO: Statistik Seite erstellen
  // TODO: Erfolge Seite erstellen
  // TODO: QR Code Scanner Seite erstellen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/splash": (context) => Splash(),
        "/home": (context) => TransactionOverview(),
        "/addPage": (context) => AddTransaction(),
      },
      home: TransactionOverview(),
    );
  }
}
