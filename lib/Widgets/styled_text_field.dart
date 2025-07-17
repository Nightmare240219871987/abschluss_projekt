import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyledTextField extends StatelessWidget {
  String? label;
  Color? borderColor;
  StyledTextField({super.key, this.label, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
        label: Text(
          label ?? "",
          style: TextStyle(color: borderColor ?? Colors.black, fontSize: 18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.black),
        ),
      ),
    );
  }
}
