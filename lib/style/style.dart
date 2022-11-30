import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static Color bgColor = Colors.white;
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  static const fontScaleFactor = 1.1;

  static TextStyle mainTitle = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 18.0 * fontScaleFactor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    color: Colors.black,
    fontSize: 16.0 * fontScaleFactor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle dateTitle = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 13.0 * fontScaleFactor,
    fontWeight: FontWeight.w500,
  );

  static const layoutScaleFactor = 1.0;

  static const spacing = 16.0 * layoutScaleFactor;
  static const elevation = 0.0 * layoutScaleFactor;
  static const radius = 12.0 * layoutScaleFactor;
}
