import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorizedIconButton extends StatelessWidget {
  Icon icon;
  bool isSelected;

  void Function()? onPressed;
  ColorizedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: isSelected
            ? WidgetStatePropertyAll(
                Theme.of(context).primaryColor.withValues(alpha: 0.7),
              )
            : WidgetStatePropertyAll(
                Theme.of(context).primaryColor.withValues(alpha: 1),
              ),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).secondaryHeaderColor,
        ),
      ),
      onPressed: onPressed,
      icon: Padding(padding: EdgeInsetsGeometry.all(8), child: icon),
    );
  }
}
