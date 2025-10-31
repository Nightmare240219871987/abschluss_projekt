import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Medal extends StatelessWidget {
  Image image;
  bool unlocked;
  Medal({super.key, required this.image, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12),
          child: image,
        ),
        if (!unlocked)
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withValues(alpha: 0.4)),
            ),
          ),
      ],
    );
  }
}
