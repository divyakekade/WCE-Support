import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      // border: Border.all(color: const Color(0xff5a2f2f), width: 1),
                      // borderRadius: BorderRadius.circular(15),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ]),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(15),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/walchand.jfif',
                      // alignment: Alignment.center,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
    );
  }
}



