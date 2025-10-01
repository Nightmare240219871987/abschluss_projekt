import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/features/dashboard/domain/blue_card.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/data/my_assets.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  final DatabaseRepository db;
  final AuthRepository auth;
  // ignore: prefer_const_constructors_in_immutables
  Dashboard({super.key, required this.db, required this.auth});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    oninit();
    super.initState();
  }

  void oninit() async {
    widget.db.setUser(widget.auth.getUser());
    await widget.db.initialize();
    //await widget.onInit();
    setState(() {});
  }

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
                ammount:
                    "${widget.db.getAvailable(DateTime.now().month).toStringAsFixed(2)}€",
                image: Misc.available,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),

              BlueCard(
                title: "Einnahmen",
                ammount:
                    "${widget.db.getSumOfIncoming(DateTime.now().month).toStringAsFixed(2)}€",
                image: Misc.incoming,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),

              BlueCard(
                title: "Ausgaben",
                ammount:
                    "${widget.db.getSumOfOutgoing(DateTime.now().month).toStringAsFixed(2)}€",
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
                ammount:
                    "${widget.db.getSumOfSaved(DateTime.now().month).toStringAsFixed(2)}€",
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
