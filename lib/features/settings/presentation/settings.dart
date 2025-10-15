import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  // TODO: User löschen implementieren
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.read<ThemeProvider>();
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    DatabaseRepository db = context.read<FirestoreRepository>();
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Text("Darkmode"),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  saveDarkmode(value);
                  themeProvider.setDarkTheme(value);
                },
              ),
            ),
            ListTile(
              leading: Text("Account"),
              trailing: TextButton(
                onPressed: () async {
                  await auth.signOut();
                  setState(() {});
                },
                child: Text("Ausloggen"),
              ),
            ),
            ListTile(
              leading: null,
              trailing: TextButton(
                onPressed: () async {
                  if (context.mounted) {
                    await db.deleteUser();
                  }
                },
                child: Text("Löschen", style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
