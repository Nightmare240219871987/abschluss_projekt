import 'package:abschluss_projekt/common/classes/user.dart';
import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:flutter/material.dart';

//TODO: Freischalt Mechanic implementieren

// ignore: must_be_immutable
class Archivements extends StatelessWidget {
  DatabaseRepository db;

  Archivements({super.key, required this.db});

  List<Image> medalImages = [
    Image.asset("assets/medaillen/m20.png"),
    Image.asset("assets/medaillen/m50.png"),
    Image.asset("assets/medaillen/m100.png"),
    Image.asset("assets/medaillen/m200.png"),
    Image.asset("assets/medaillen/m500.png"),
    Image.asset("assets/medaillen/m1000.png"),
    Image.asset("assets/medaillen/m2000.png"),
    Image.asset("assets/medaillen/m5000.png"),
    Image.asset("assets/medaillen/m10000.png"),
    Image.asset("assets/medaillen/m20000.png"),
    Image.asset("assets/medaillen/m50000.png"),
    Image.asset("assets/medaillen/m100000.png"),
    Image.asset("assets/medaillen/m200000.png"),
    Image.asset("assets/medaillen/m500000.png"),
    Image.asset("assets/medaillen/m1000000.png"),
  ];

  List<Badge> medalBadges = [];

  User? user;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < medalImages.length; i++) {
      medalBadges.add(
        Badge(
          backgroundColor: Colors.transparent,
          label: medalImages[i],
          isLabelVisible: true,
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: medalBadges,
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
