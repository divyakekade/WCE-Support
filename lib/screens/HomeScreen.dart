import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    "assets/walchand.jfif"), // <-- BACKGROUND IMAGE
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
              ),
            ),
          ),
          Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(
                  'Welcome To',
                  style: TextStyle(
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(121, 79, 80, 97),
                      ),
                    ],
                    color: heading_color,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Walchand College Of Engineering, Sangli.',
                  style: TextStyle(
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(121, 79, 80, 97),
                      ),
                    ],
                    color: heading_color,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
      ]),
    );
  }
}



