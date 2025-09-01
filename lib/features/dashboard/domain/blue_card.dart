import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFeeeeee),
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
                  style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
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
