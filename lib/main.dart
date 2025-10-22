import 'package:abschluss_projekt/app.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:abschluss_projekt/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // TODO: QR Code Scanner Seite erstellen
  // TODO: KI Package finden installieren und mit daten trainieren.
  // TODO: Animation -> Splash screen
  // TODO: Übersetzung in andere Sprachen (intl Flutter package)
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeSharedPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FirebaseAuthRepository()),
        ChangeNotifierProvider(create: (context) => FirestoreRepository()),
      ],
      child: App(),
    ),
  );
}
