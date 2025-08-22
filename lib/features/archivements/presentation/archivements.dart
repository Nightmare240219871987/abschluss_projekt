import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';

// TODO: Die medaillen mit chatgpt erstellen und einpflegen.
// ignore: must_be_immutable
class Archivements extends StatelessWidget {
  List<Image> medals = [
    Image.asset("assets/medaillen/m20.png"),
    Image.asset("assets/medaillen/m50.png"),
    Image.asset("assets/medaillen/m100.png"),
    Image.asset("assets/medaillen/m200.png"),
    Image.asset("assets/medaillen/m500.png"),
    Image.asset("assets/medaillen/m1000.png"),
    Image.asset("assets/medaillen/m2000.png"),
    Image.asset("assets/medaillen/m5000.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
    Image.asset("assets/misc/medal.png"),
  ];

  Archivements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: medals,
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
