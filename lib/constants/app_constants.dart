import 'package:flutter/material.dart';

class AppConstants {
  static const padding = 8.0;
  static const fontFamily = "Luckiest";
  static const Color textColor = Color(0xffffffff);
  static const Color iconButtonWidgetColor = Color.fromARGB(255, 255, 226, 84);
  static const Color overlayBgColor = Color.fromARGB(255, 38, 116, 180);
  static const TextStyle largeDisplayText = TextStyle(
    fontSize: 40.0,
    color: textColor,
    fontFamily: fontFamily,
    height: 0,
  );
  static const TextStyle largeText = TextStyle(
      fontSize: 32.0,
      color: textColor,
      fontFamily: fontFamily,
      height: 0,
      decoration: TextDecoration.none);
  static const TextStyle mediumText = TextStyle(
      fontSize: 24.0,
      color: textColor,
      fontFamily: fontFamily,
      height: 0,
      decoration: TextDecoration.none);
  static const TextStyle smallText = TextStyle(
    fontSize: 20.0,
    color: textColor,
    fontFamily: fontFamily,
    height: 0,
    decoration: TextDecoration.none,
    leadingDistribution: null,
  );
}
