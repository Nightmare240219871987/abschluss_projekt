import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/domain/statistic_utils.dart';

class Outgoing extends StatelessWidget {
  final DatabaseRepository db;
  const Outgoing({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: FutureBuilder(
            future: generateTransactionData(TransactionType.outgoing, db),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: (value, meta) {
                            return Text(
                              decodeMonth(value),
                              style: TextStyle(fontSize: 10),
                            );
                          },
                          showTitles: true,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    barGroups: generateGroupData(snapshot.data!),
                  ),
                );
              } else if (snapshot.hasError) {
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error),
                    Text("Es ist ein Fehler aufgetreten. (${snapshot.error})"),
                  ],
                );
              }
              return Text("Es wurde keine Aktion ausgeführt.");
            },
          ),
        ),
        Column(
          children: [
            FutureBuilder(
              future: generateTransactionData(TransactionType.outgoing, db),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(children: getListTiles(snapshot.data!));
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error),
                      Text(
                        "Es ist ein Fehler aufgetreten. (${snapshot.error})",
                      ),
                    ],
                  );
                }
                return Text("Es wurde keine Aktion ausgeführt.");
              },
            ),
          ],
        ),
      ],
    );
  }
}
