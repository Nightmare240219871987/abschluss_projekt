import 'package:abschluss_projekt/Classes/my_colors.dart';
import 'package:abschluss_projekt/Classes/my_pics.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            MyPics.logo,
            SizedBox(width: 10),
            Text(
              "Finance Tracker",
              style: TextStyle(
                color: MyColors.whiteSpace,
                fontSize: 32,
                shadows: [Shadow(color: MyColors.font)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
