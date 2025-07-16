import 'package:abschluss_projekt/Widgets/blue_card.dart';
import 'package:flutter/material.dart';
import 'package:abschluss_projekt/Classes/my_colors.dart';
import 'package:abschluss_projekt/Classes/my_pics.dart';

class HomePage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteSpace,
      appBar: AppBar(
        backgroundColor: Color(0xFFDDDDDD),
        title: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text("Finance Tracker"),
        ),
      ),
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
                image: MyPics.available,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Einnahmen",
                ammount: "2000,00€",
                image: MyPics.incoming,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Ausgaben",
                ammount: "800,00€",
                image: MyPics.outgoing,
                titleColor: MyColors.blueCardRed,
                icon: Icon(
                  Icons.arrow_downward_rounded,
                  color: MyColors.blueCardRed,
                  size: 28,
                ),
              ),
              BlueCard(
                title: "Sparen",
                ammount: "365,50€",
                image: MyPics.save,
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
          borderRadius: BorderRadiusGeometry.circular(32),
        ),
        elevation: 8,
        backgroundColor: MyColors.primary,
        onPressed: () {},
        child: Icon(Icons.add, color: MyColors.whiteSpace),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: MyColors.notBody,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, size: 38),
            label: "Startseite",
          ),
          NavigationDestination(
            icon: Icon(Icons.area_chart_outlined, size: 38),
            label: "Statistik",
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outlined, size: 38),
            label: "Erfolge",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, size: 38),
            label: "Einstellungen",
          ),
        ],
      ),
    );
  }
}
