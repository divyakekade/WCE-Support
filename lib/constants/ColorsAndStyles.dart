// import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
const Color cardBackground = Color(0xffF5F5F5);
const Color headingColor = Color(0xff01353D);
const Color imagebutton = Color(0xffAACAD1);
const Color cardColor = ui.Color.fromARGB(255, 225, 225, 225);
const Color greyColor = Color(0xffE0E0E0);
const Color backgroundColor= ui.Color.fromARGB(255, 239, 245, 248);

final headingBoxDecoration = BoxDecoration(
  color: cardBackground,
  boxShadow: const [
    BoxShadow(
        color: Color.fromRGBO(159, 157, 157, 1),
        offset: Offset(2, 3),
        blurRadius: 4,
        inset: true)
  ],
  borderRadius: BorderRadius.circular(15),
  // border: Border.all(color: Colors.black, width: 1)
);
final headingTextStyle = TextStyle(
  shadows: const [
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Color.fromRGBO(159, 157, 157, 1),
    )
  ],
  color: headingColor,
  fontWeight: FontWeight.w500,
  fontSize: MediaQueryData.fromWindow(ui.window).size.height * 0.028,
);

// final buttonStyle = ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: primaryColor,
//                     elevation: 5,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                   );
final buttonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(5),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    minimumSize: MaterialStateProperty.all(ui.Size(130, 40)),
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white));

final secondButtonStyle = ButtonStyle(
    elevation: MaterialStatePropertyAll(5),
    minimumSize: MaterialStateProperty.all(ui.Size(150, 45)),
    backgroundColor: MaterialStateProperty.all<Color>(imagebutton),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black));
//constanly repeated styles for the widgets here
//like add style for button used commonly here 
