import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorizedIconButton extends StatelessWidget {
  Icon icon;

  void Function()? onPressed;
  ColorizedIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).secondaryHeaderColor,
        ),
      ),
      onPressed: onPressed,
      icon: Padding(padding: EdgeInsetsGeometry.all(8), child: icon),
    );
  }
}
