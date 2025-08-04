import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ThemeProvider themeProvider;
  const MyAppBar({super.key, required this.themeProvider});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 64);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text("Finance Tracker"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 28.0),
          child: Switch(
            value: widget.themeProvider.isDarkMode,
            onChanged: (value) {
              setState(() {
                widget.themeProvider.setDarkTheme(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
