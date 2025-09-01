import 'package:abschluss_projekt/app_home.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/mock_database_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  DatabaseRepository db = MockDatabaseRepository();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPrefs();
  db.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: AppHome(db: db),
    ),
  );
}
