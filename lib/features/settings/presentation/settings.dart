import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/shared_prefs.dart';
import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final ThemeProvider themeProvider;
  final AuthRepository auth;
  const Settings({super.key, required this.themeProvider, required this.auth});
  // TODO: Sprachunterstüzung
  // TODO: User löschen implementieren
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Text("Darkmode"),
              trailing: Switch(
                value: widget.themeProvider.isDarkMode,
                onChanged: (value) {
                  saveDarkmode(value);
                  setState(() {
                    widget.themeProvider.setDarkTheme(value);
                  });
                },
              ),
            ),
            ListTile(
              leading: Text("Account"),
              trailing: TextButton(
                onPressed: () async {
                  await widget.auth.signOut();
                  setState(() {});
                },
                child: Text("Ausloggen"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
