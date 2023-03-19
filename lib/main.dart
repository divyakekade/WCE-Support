import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WCE Support',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(primaryColor),
      ),
      home: const SideMenuNavigation(),
    );
  }
}


