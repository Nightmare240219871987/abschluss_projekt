import 'package:abschluss_projekt/data/database_repository.dart';
import 'package:abschluss_projekt/data/firestore_repository.dart';
import 'package:abschluss_projekt/features/archivements/domain/medal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Archivements extends StatefulWidget {
  const Archivements({super.key});

  @override
  State<Archivements> createState() => _ArchivementsState();
}

class _ArchivementsState extends State<Archivements> {
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

  @override
  void initState() {
    List<int> limits = [
      20,
      50,
      100,
      200,
      500,
      1000,
      2000,
      5000,
      10000,
      20000,
      50000,
      100000,
      200000,
      500000,
      1000000,
    ];
    List<bool> archivements = unlockMedals(
      context.read<FirestoreRepository>(),
      limits,
    );

    for (int i = 0; i < medalImages.length; i++) {
      medalBadges.add(
        Badge(
          backgroundColor: Colors.transparent,
          label: Medal(image: medalImages[i], unlocked: archivements[i]),
        ),
      );
    }
    super.initState();
  }

  List<bool> unlockMedals(DatabaseRepository db, List<int> limits) {
    List<bool> boolList = [];
    double currentSaved = db.readCurrentSaved();
    for (int i = 0; i < limits.length; i++) {
      if (currentSaved >= limits[i]) {
        boolList.add(true);
        continue;
      }
      boolList.add(false);
    }
    return boolList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: medalBadges,
    );
  }
}
