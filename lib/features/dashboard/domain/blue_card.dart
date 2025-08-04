import 'package:flutter/material.dart';
import 'package:abschluss_projekt/data/my_colors.dart';

// ignore: must_be_immutable
class BlueCard extends StatelessWidget {
  Image? image;
  String title;
  String ammount;
  Icon? icon;
  Color? titleColor;

  BlueCard({
    super.key,
    required this.title,
    this.titleColor,
    required this.ammount,
    this.image,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: MyColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.whiteSpace,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(padding: const EdgeInsets.all(8.0), child: image),
            ),
            SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 115,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ammount,
                  style: TextStyle(color: MyColors.whiteSpace, fontSize: 28),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(children: [SizedBox(height: 20), icon ?? SizedBox()]),
          ],
        ),
      ),
    );
  }
}
