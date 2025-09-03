import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

String decodeMonth(double month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mär";
    case 4:
      return "Apr";
    case 5:
      return "Mai";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Okt";
    case 11:
      return "Nov";
    case 12:
      return "Dez";
    default:
      return "";
  }
}

List<BarChartGroupData> generateGroupData(List<Transaction> ta) {
  List<double> monthly = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<BarChartRodData> rods = [];
  List<BarChartGroupData> groups = [];
  for (int i = 1; i <= 12; i++) {
    for (Transaction t in ta) {
      if (t.date.month == i) {
        monthly[i - 1] += t.price;
      }
    }
  }
  for (double d in monthly) {
    rods.add(BarChartRodData(toY: d));
  }
  for (int i = 0; i < monthly.length; i++) {
    groups.add(BarChartGroupData(x: i + 1, barRods: [rods[i]]));
  }
  return groups;
}

Future<List<Transaction>> generateTransactionData(
  TransactionType type,
  DatabaseRepository db,
) async {
  List<Transaction> ta = [];
  for (Transaction t in await db.getAllTransactions()) {
    if (t.transactionType == type) {
      ta.add(t);
    }
  }
  return ta;
}

List<ListTile> getListTiles(List<Transaction> ta) {
  List<List<Transaction>> monthly = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  List<ListTile> listTiles = [];
  for (int i = 0; i < 12; i++) {
    for (Transaction t in ta) {
      if (t.date.month == i + 1) {
        monthly[i].add(t);
      }
    }
  }
  for (int i = 0; i < monthly.length; i++) {
    Iterable<Text> trans = monthly[i].map(
      (t) => Text(
        "${t.title} : ${t.price.toStringAsFixed(2)}€",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
    listTiles.add(
      ListTile(
        title: Text(
          "${decodeMonth(i + 1)} : ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(children: trans.toList()),
      ),
    );
  }
  return listTiles;
}
