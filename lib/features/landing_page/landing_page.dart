import 'package:abschluss_projekt/features/archivements/presentation/archivements.dart';
import 'package:abschluss_projekt/features/dashboard/presentation/dashboard.dart';
import 'package:abschluss_projekt/features/settings/presentation/settings.dart';
import 'package:abschluss_projekt/features/statistics/presentation/statistics_dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> _pages = [
    Dashboard(),
    StatisticsDashboard(),
    Archivements(),
    Settings(),
  ];
  final List<String> _titles = [
    "Dashboard",
    "Statistik",
    "Errungenschaften",
    "Settings",
  ];
  int _currentPage = 0;
  String _title = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() {
            _currentPage = value;
            _title = _titles[value];
          });
        },
        index: _currentPage,
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.bar_chart, color: Colors.white),
          Icon(Icons.star, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}
