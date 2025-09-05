import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/features/statistics_dashboard/domain/statistic_utils.dart';

// ignore: must_be_immutable
class TransactionDetails extends StatefulWidget {
  final DatabaseRepository db;
  TransactionType transactionType;
  ThemeProvider themeProvider;
  TransactionDetails({
    super.key,
    required this.db,
    required this.transactionType,
    required this.themeProvider,
  });

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: FutureBuilder(
            future: generateTransactionData(widget.transactionType, widget.db),
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

        FutureBuilder(
          future: generateTransactionData(widget.transactionType, widget.db),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                children: getListTiles(
                  snapshot.data!,
                  widget.db,
                  () {
                    setState(() {});
                  },
                  () {
                    setState(() {});
                  },
                  context,
                  widget.themeProvider,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
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
      ],
    );
  }
}
