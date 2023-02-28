import 'package:flutter/material.dart';

class MyStyles {

  static ButtonStyle? defaultButtonStyle() {
    return TextButton.styleFrom(
        backgroundColor: const Color(0xFF10609D),
        foregroundColor: const Color(0xFFC0F0F7));
  }

  static TextStyle? quoteStyle() {
    return const TextStyle(color: Color(0xFF10609D), fontFamily: "Sans");
  }

  static TextStyle? authorStyle() {
    return const TextStyle(
        color: Color(0xFF10609D),
        fontFamily: "Sans",
        fontStyle: FontStyle.italic);
  }
}