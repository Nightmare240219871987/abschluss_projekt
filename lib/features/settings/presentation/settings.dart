import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final ThemeProvider themeProvider;
  const Settings({super.key, required this.themeProvider});

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
                  setState(() {
                    widget.themeProvider.setDarkTheme(value);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
