import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/screens/SingleUserPastProducts.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/ConfirmationDialogBox.dart';
import 'package:wce_support/widgets/ContainerWithBlueBorder.dart';
import '../Provider/Auth provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/LoginPage.dart';

class HomeScreen extends StatefulWidget {
  String? token;
  String? user;
  String? userid;
  HomeScreen({super.key, this.token, this.user, this.userid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // SharedPreferences  pref = await SharedPreferences.getInstance();
    // String token =
    // print(pref.getString('userid'));
    // if(widget.token!=null  && widget.token!=null &&widget.token!=null){

    Provider.of<Auth>(context, listen: false)
        .setuser(widget.token, widget.user, widget.userid);
    // }
  }
  viewYourGrievances(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SideMenuNavigation(loadedPage: 'put_grievance')));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SingleUserPastGrievances()));
  }
  viewYourProducts(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SideMenuNavigation(loadedPage: 'sell_products')));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SingleUserPastProducts()));
  }
  
  Future<bool> backNavigation() async {
      return await showDialog( 
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to exit an App?'),
          actions:[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:const Text('No'),
            ),
            TextButton(
              onPressed: () => exit(0), 
              child:const Text('Yes'),
            ),
          ],
        ),
      )??false;
  }
  @override
  Widget build(BuildContext context) {
    final authtoken = Provider.of<Auth>(context, listen: false).token;
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: backNavigation,
        child: Stack(children: [
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
          SingleChildScrollView(
            child: Column(
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
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                authtoken == null
                    ? const LoginPage()
                    : Container(
                       child: Column(
                        children: [
                          ContainerWithBlueBorder(content: "View Your Grievances", function: viewYourGrievances,),
                          ContainerWithBlueBorder(content: "View Your Products", function: viewYourProducts),
                        ],
                       ),
                    )
                    // : const Center(child: Text("You are logged in")),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
