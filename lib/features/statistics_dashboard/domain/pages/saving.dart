import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/domain/statistic_utils.dart';

class Saving extends StatelessWidget {
  final DatabaseRepository db;
  const Saving({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: BarChart(
            BarChartData(
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
              ),

              barGroups: generateGroupData(
                generateTransactionData(TransactionType.saving, db),
              ),
            ),
          ),
        ),

        Column(
          children: getListTiles(
            generateTransactionData(TransactionType.saving, db),
          ),
        ),
      ],
    );
  }
}
