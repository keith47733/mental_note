import 'package:flutter/material.dart';

class Style {
  static Color bgColor = Colors.white;
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static const textScaleFactor = 1.2;

  static const layoutScaleFactor = 1.0;

  static const spacing = 14.0 * layoutScaleFactor;
  static const elevation = 0.0 * layoutScaleFactor;
  static const radius = 12.0 * layoutScaleFactor;
}
