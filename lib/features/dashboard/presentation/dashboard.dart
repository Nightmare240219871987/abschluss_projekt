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
    Future<double> available = widget.db.getAvailable(DateTime.now().month);
    Future<double> incoming = widget.db.getSumOfIncoming(DateTime.now().month);
    Future<double> outgoing = widget.db.getSumOfOutgoing(DateTime.now().month);
    Future<double> saving = widget.db.getSumOfSaved(DateTime.now().month);
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            spacing: 10,
            children: [
              FutureBuilder(
                future: available,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return BlueCard(
                      title: "Verfügbar",
                      ammount: "${snapshot.data!.toStringAsFixed(2)}€",
                      image: Misc.available,
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Es ist ein Fehler Aufgetreten. (${snapshot.error})",
                        ),
                        Icon(Icons.error),
                      ],
                    );
                  }
                  return Text("Es wurde noch keine Aktion ausgeführt.");
                },
              ),
              FutureBuilder(
                future: incoming,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return BlueCard(
                      title: "Einnahmen",
                      ammount: "${snapshot.data!.toStringAsFixed(2)}€",
                      image: Misc.incoming,
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error),
                        Text(
                          "Es ist ein Fehler Aufgetreten. (${snapshot.error})",
                        ),
                      ],
                    );
                  }
                  return Text("Es wurde noch keine Aktion ausgeführt.");
                },
              ),
              FutureBuilder(
                future: outgoing,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return BlueCard(
                      title: "Ausgaben",
                      ammount: "${snapshot.data!.toStringAsFixed(2)}€",
                      image: Misc.outgoing,
                      titleColor: Color.fromARGB(255, 241, 103, 93),
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Color.fromARGB(255, 241, 103, 93),
                        size: 28,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error),
                        Text(
                          "Es ist ein Fehler Aufgetreten. (${snapshot.error})",
                        ),
                      ],
                    );
                  }
                  return Text("Es wurde noch keine Aktion ausgeführt.");
                },
              ),
              FutureBuilder(
                future: saving,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return BlueCard(
                      title: "Sparen",
                      ammount: "${snapshot.data!.toStringAsFixed(2)}€",
                      image: Misc.save,
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error),
                        Text(
                          "Es ist ein Fehler Aufgetreten. (${snapshot.error})",
                        ),
                      ],
                    );
                  }
                  return Text("Es wurde noch keine Aktion ausgeführt.");
                },
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
