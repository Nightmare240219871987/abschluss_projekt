import 'package:abschluss_projekt/common/classes/route_definition.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});
  static int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: MyNavigationBar.currentIndex,
      onDestinationSelected: (value) {
        RouteDefinition.route(context, value);
        MyNavigationBar.currentIndex = value;
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
    );
  }
}
