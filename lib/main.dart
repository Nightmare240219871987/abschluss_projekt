import 'package:abschluss_projekt/app.dart';
import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/data/mock_database_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:abschluss_projekt/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abschluss_projekt/common/classes/user.dart';

Future<void> main() async {
  // TODO: QR Code Scanner Seite erstellen
  // TODO: Animation -> Splash screen
  // TODO: Übersetzung in andere Sprachen (intl Flutter package)
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseRepository db = FirestoreRepository();
  AuthRepository auth = FirebaseAuthRepository();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeSharedPrefs();
  await db.initialize(User(email: ""));

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: App(db: db, auth: auth),
    ),
  );
}
