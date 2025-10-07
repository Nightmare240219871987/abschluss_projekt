import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/auth_repository.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firebase_auth_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/features/dashboard/domain/blue_card.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/data/my_assets.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool firstBuild = true;

  @override
  void initState() {
    super.initState();
  }

  void oninit(DatabaseRepository db, AuthRepository auth) async {
    db.setUser(auth.getUser());
    await db.initialize();
    firstBuild = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    DatabaseRepository db = context.read<FirestoreRepository>();
    if (firstBuild) {
      oninit(db, auth);
    }

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
                    "${db.getAvailable(DateTime.now().month).toStringAsFixed(2)}€",
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
                    "${db.getSumOfIncoming(DateTime.now().month).toStringAsFixed(2)}€",
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
                    "${db.getSumOfOutgoing(DateTime.now().month).toStringAsFixed(2)}€",
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
                    "${db.getSumOfSaved(DateTime.now().month).toStringAsFixed(2)}€",
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
