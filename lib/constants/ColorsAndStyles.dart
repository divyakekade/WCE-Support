import 'package:flutter/material.dart';

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

const Color primaryColor = Color(0xff1793A4);
const Color card_background = Color(0xffF5F5F5);
const Color heading_color = Color(0xff01353D);
const Color imagebutton = Color(0xffAACAD1);
const Color cardColor = Color.fromARGB(255, 230, 230, 230);
//constanly repeated styles for the widgets here
//like add style for button used commonly here 
