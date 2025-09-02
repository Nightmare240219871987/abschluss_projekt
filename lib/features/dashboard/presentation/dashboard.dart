import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/features/dashboard/domain/blue_card.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/data/my_assets.dart';

class Dashboard extends StatefulWidget {
  final DatabaseRepository db;
  // ignore: prefer_const_constructors_in_immutables
  Dashboard({super.key, required this.db});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    String available = widget.db
        .getAvailable(DateTime.now().month)
        .toStringAsFixed(2);
    String incoming = widget.db
        .getSumOfIncoming(DateTime.now().month)
        .toStringAsFixed(2);
    String outgoing = widget.db
        .getSumOfOutgoing(DateTime.now().month)
        .toStringAsFixed(2);
    String saving = widget.db
        .getSumOfSaved(DateTime.now().month)
        .toStringAsFixed(2);
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
                ammount: "$available€",
                image: Misc.available,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Einnahmen",
                ammount: "$incoming€",
                image: Misc.incoming,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Ausgaben",
                ammount: "$outgoing€",
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
                ammount: "$saving€",
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
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () async {
          await Navigator.pushNamed(context, "/addPage");
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
