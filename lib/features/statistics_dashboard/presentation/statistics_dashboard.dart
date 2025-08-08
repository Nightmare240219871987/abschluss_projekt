import 'package:abschluss_projekt/common/classes/route_definition.dart';
import 'package:abschluss_projekt/common/widgets/appbar.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsDashboard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ThemeProvider themeProvider;
  const StatisticsDashboard({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(themeProvider: themeProvider),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(value: 0.66, minHeight: 25),
                  ),
                  Image.asset("assets/medal.png", height: 64),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 96,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Image.asset("assets/medal.png", height: 48),
                        ),
                        Positioned(
                          top: 0,
                          right: 18,
                          child: Image.asset("assets/medal.png", height: 48),
                        ),
                        Positioned(
                          top: 0,
                          right: 36,
                          child: Image.asset("assets/medal.png", height: 48),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ColorizedIconButton(
                    icon: Icon(Icons.input_outlined),
                    onPressed: () {},
                  ),
                  ColorizedIconButton(
                    icon: Icon(Icons.output_outlined),
                    onPressed: () {},
                  ),
                  ColorizedIconButton(
                    icon: Icon(Icons.euro_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 450,
                child: BarChart(
                  BarChartData(
                    maxY: 120,
                    barGroups: [
                      BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(toY: 60)],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(toY: 100)],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Text("Januar:"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                  ],
                ),
              ),
              ListTile(
                leading: Text("Februar:"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                  ],
                ),
              ),
              ListTile(
                leading: Text("März:"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                  ],
                ),
              ),
              ListTile(
                leading: Text("April:"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                    Text("Ausgabe 1: 10€"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

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
