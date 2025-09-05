import 'package:abschluss_projekt/common/classes/transaction.dart';
import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/colorized_icon_button.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/features/statistics/domain/transaction_details.dart';
import 'package:abschluss_projekt/themes/theme_provider.dart';
import 'package:flutter/material.dart';

// TODO: Continuous Mechanics implementieren
class StatisticsDashboard extends StatefulWidget {
  final DatabaseRepository db;
  final ThemeProvider themeProvider;
  const StatisticsDashboard({
    super.key,
    required this.db,
    required this.themeProvider,
  });

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
      TransactionDetails(
        db: widget.db,
        transactionType: TransactionType.incoming,
        themeProvider: widget.themeProvider,
      ),
    );
    _statistics.add(
      TransactionDetails(
        db: widget.db,
        transactionType: TransactionType.outgoing,
        themeProvider: widget.themeProvider,
      ),
    );
    _statistics.add(
      TransactionDetails(
        db: widget.db,
        transactionType: TransactionType.saving,
        themeProvider: widget.themeProvider,
      ),
    );
  }

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
                          child: Image.asset(
                            "assets/misc/medal.png",
                            height: 48,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 18,
                          child: Image.asset(
                            "assets/misc/medal.png",
                            height: 48,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 36,
                          child: Image.asset(
                            "assets/misc/medal.png",
                            height: 48,
                          ),
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
              _statistics[_currentIndex],
            ],
          ),
        ),
      ),

      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
