import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorizedIconButton extends StatelessWidget {
  Icon icon;
  Color backgroundColor;
  void Function()? onPressed;
  ColorizedIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Padding(padding: EdgeInsetsGeometry.all(8), child: icon),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
    );
  }
}
