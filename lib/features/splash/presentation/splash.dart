import 'package:abschluss_projekt/data/my_colors.dart';
import 'package:abschluss_projekt/data/my_pics.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.primary,
              MyColors.primary,
              Color(0xff221c99),
              Color(0xff221c99),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyPics.logo,
                  SizedBox(width: 20),
                  Text(
                    "Finance Tracker",
                    style: TextStyle(color: MyColors.whiteSpace, fontSize: 38),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
