import 'package:abschluss_projekt/src/features/transaction/presentation/add_transaction.dart';
import 'package:abschluss_projekt/src/features/transaction/presentation/transaction_overview.dart';
import 'package:abschluss_projekt/src/features/splash/presentation/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

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
