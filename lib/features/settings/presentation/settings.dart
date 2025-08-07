import 'package:abschluss_projekt/common/classes/route_definition.dart';
import 'package:abschluss_projekt/common/widgets/appbar.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final ThemeProvider themeProvider;
  const Settings({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(themeProvider: themeProvider),
      body: const Placeholder(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          RouteDefinition.route(context, value);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, size: 38),
            label: "Startseite",
          ),
          NavigationDestination(
            icon: Icon(Icons.area_chart_outlined, size: 38),
            label: "Statistik",
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outlined, size: 38),
            label: "Erfolge",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, size: 38),
            label: "Einstellungen",
          ),
        ],
      ),
    );
  }
}
