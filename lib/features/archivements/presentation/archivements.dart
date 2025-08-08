import 'package:abschluss_projekt/common/widgets/my_app_bar.dart';
import 'package:abschluss_projekt/common/widgets/my_navigation_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Archivements extends StatelessWidget {
  List<Image> medals = List<Image>.generate(
    15,
    (value) => Image.asset(
      "assets/medal.png",
      height: 48,
      filterQuality: FilterQuality.high,
    ),
  );

  // ignore: prefer_typing_uninitialized_variables

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
