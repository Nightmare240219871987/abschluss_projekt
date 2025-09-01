import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/features/transaction_dashboard/domain/blue_card.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/data/my_assets.dart';

class TransactionDashboard extends StatelessWidget {
  final DatabaseRepository db;
  // ignore: prefer_const_constructors_in_immutables
  TransactionDashboard({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            spacing: 10,
            children: [
              BlueCard(
                title: "Verfügbar",
                ammount: "1200,00€",
                image: Misc.available,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Einnahmen",
                ammount: "2000,00€",
                image: Misc.incoming,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Ausgaben",
                ammount: "800,00€",
                image: Misc.outgoing,
                titleColor: Color.fromARGB(255, 241, 103, 93),
                icon: Icon(
                  Icons.arrow_downward_rounded,
                  color: Color.fromARGB(255, 241, 103, 93),
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Sparen",
                ammount: "365,50€",
                image: Misc.save,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(48),
        ),
        elevation: 8,
        onPressed: () {
          Navigator.pushNamed(context, "/addPage");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
