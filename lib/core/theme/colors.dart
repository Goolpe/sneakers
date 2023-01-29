import 'package:flutter/material.dart';

extension ColorsExt on Color {
  Color estimate() {
    if (ThemeData.estimateBrightnessForColor(this) == Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }
}
