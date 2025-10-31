import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool _switchState;

  @override
  void initState() {
    super.initState();
    _switchState = context.read<ThemeProvider>().isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.read<ThemeProvider>();
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    DatabaseRepository db = context.read<FirestoreRepository>();
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          ListTile(
            leading: Text("Darkmode"),
            trailing: Switch(
              value: _switchState,
              onChanged: (value) {
                saveDarkmode(value);
                themeProvider.setDarkTheme(value);
                setState(() {
                  _switchState = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Text("Account"),
            trailing: TextButton(
              onPressed: () {
                auth.signOut();
                setState(() {});
              },
              child: Text("Ausloggen"),
            ),
          ),
          ListTile(
            leading: null,
            trailing: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("User löschen?"),
                      content: Text(
                        "Wollen die den Benutzer mit allen Daten löschen? Alle daten sind dann unwiederbringlich verloren!",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            db.deleteUser().whenComplete(() {
                              auth.deleteAccount();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Benutzer wurde gelöscht"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Löschen",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Abbrechen"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Löschen", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
