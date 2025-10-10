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
  @override
  void initState() {
    startUp(context);
    super.initState();
  }

  Future<void> startUp(BuildContext context) async {
    AuthRepository auth = context.read<FirebaseAuthRepository>();
    DatabaseRepository db = context.read<FirestoreRepository>();
    db.setUser(auth.getUser());
    await db.initialize();
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
              Consumer<FirestoreRepository>(
                builder: (context, value, child) {
                  return BlueCard(
                    title: "Verfügbar",
                    ammount:
                        "${value.getAvailable(DateTime.now().month).toStringAsFixed(2)}€",
                    image: Misc.available,
                    icon: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                  );
                },
              ),
              Consumer<FirestoreRepository>(
                builder: (context, value, child) {
                  return BlueCard(
                    title: "Einnahmen",
                    ammount:
                        "${value.getSumOfIncoming(DateTime.now().month).toStringAsFixed(2)}€",
                    image: Misc.incoming,
                    icon: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                  );
                },
              ),
              Consumer<FirestoreRepository>(
                builder: (context, value, child) {
                  return BlueCard(
                    title: "Ausgaben",
                    ammount:
                        "${value.getSumOfOutgoing(DateTime.now().month).toStringAsFixed(2)}€",
                    image: Misc.outgoing,
                    titleColor: Color.fromARGB(255, 241, 103, 93),
                    icon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Color.fromARGB(255, 241, 103, 93),
                      size: 28,
                    ),
                  );
                },
              ),
              Consumer<FirestoreRepository>(
                builder: (context, value, child) {
                  return BlueCard(
                    title: "Sparen",
                    ammount:
                        "${value.getSumOfSaved(DateTime.now().month).toStringAsFixed(2)}€",
                    image: Misc.save,
                    icon: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.green,
                      size: 28,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
