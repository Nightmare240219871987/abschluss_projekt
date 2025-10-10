import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/features/statistics/domain/statistic_utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TransactionDetails extends StatefulWidget {
  TransactionType transactionType;
  TransactionDetails({super.key, required this.transactionType});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    DatabaseRepository db = context.read<FirestoreRepository>();
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: FutureBuilder(
            future: generateTransactionData(widget.transactionType, db),
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
        Consumer<FirestoreRepository>(
          builder: (context, value, child) {
            return FutureBuilder(
              future: generateTransactionData(widget.transactionType, value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: getListTiles(snapshot.data!, context),
                  );
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
            );
          },
        ),
      ],
    );
  }
}
