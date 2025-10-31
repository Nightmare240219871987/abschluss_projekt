import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/features/statistics/domain/transaction_details.dart';
import 'package:flutter/material.dart';

class StatisticsDashboard extends StatefulWidget {
  const StatisticsDashboard({super.key});

  @override
  State<StatisticsDashboard> createState() => _StatisticsDashboardState();
}

class _StatisticsDashboardState extends State<StatisticsDashboard> {
  final List<Widget> _statistics = [];
  int _currentIndex = 0;
  bool isSelectedB1 = true;
  bool isSelectedB2 = false;
  bool isSelectedB3 = false;

  @override
  void initState() {
    super.initState();
    _statistics.add(
      TransactionDetails(transactionType: TransactionType.incoming),
    );
    _statistics.add(
      TransactionDetails(transactionType: TransactionType.outgoing),
    );
    _statistics.add(
      TransactionDetails(transactionType: TransactionType.saving),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColorizedIconButton(
                  icon: Icon(Icons.input_outlined),
                  isSelected: isSelectedB1,
                  onPressed: () {
                    setState(() {
                      isSelectedB1 = true;
                      isSelectedB2 = false;
                      isSelectedB3 = false;
                      _currentIndex = 0;
                    });
                  },
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.output_outlined),
                  isSelected: isSelectedB2,
                  onPressed: () {
                    setState(() {
                      isSelectedB1 = false;
                      isSelectedB2 = true;
                      isSelectedB3 = false;
                      _currentIndex = 1;
                    });
                  },
                ),
                ColorizedIconButton(
                  icon: Icon(Icons.euro_outlined),
                  isSelected: isSelectedB3,
                  onPressed: () {
                    setState(() {
                      isSelectedB1 = false;
                      isSelectedB2 = false;
                      isSelectedB3 = true;
                      _currentIndex = 2;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 120),
            _statistics[_currentIndex],
          ],
        ),
      ),
    );
  }
}
