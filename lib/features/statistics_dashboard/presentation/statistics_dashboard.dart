import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsDashboard extends StatelessWidget {
  const StatisticsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            children: [
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(value: 0.66, minHeight: 25),
                  ),
                  Image.asset("assets/misc/medal.png", height: 64),
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
                          child: Image.asset("assets/misc/medal.png", height: 48),
                        ),
                        Positioned(
                          top: 0,
                          right: 18,
                          child: Image.asset("assets/misc/medal.png", height: 48),
                        ),
                        Positioned(
                          top: 0,
                          right: 36,
                          child: Image.asset("assets/misc/medal.png", height: 48),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                //TODO: Monate in Kurzform als Balken beschriftung machen
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(sideTitles: SideTitles()
                        
                        //TODO: Datensätze verarbeiten aus db_repo
                      ),
                    ),
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

      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
