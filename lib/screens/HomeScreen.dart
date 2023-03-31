import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Auth provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/LoginPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authtoken = Provider.of<Auth>(context, listen: false).token;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                  "assets/walchand.jfif"), // <-- BACKGROUND IMAGE
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.dstATop),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
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
                color: headingColor,
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
                color: headingColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.022,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            authtoken==null?
            const LoginPage()
            // Container(
            //   width: MediaQuery.of(context).size.width*0.3,
            //   height: MediaQuery.of(context).size.height*0.06,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => const LoginPage()));
            //       },
            //       style: ElevatedButton.styleFrom(
            //         foregroundColor: Colors.white,
            //         backgroundColor: primaryColor,
            //         elevation: 10,
            //         shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //       ),
            //       child: Text("Login",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.024),)),
            // )
            : const Center(child: Text("You are logged in")),
          ],
        ),
      ]),
    );
  }
}
