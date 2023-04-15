import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

import 'SideMenuNavigation.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  Future<void> logout() async {
    await Provider.of<Auth>(context,listen: false).logout();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SideMenuNavigation(loadedPage: 'home')));
  }

  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.0052,
                  horizontal: MediaQuery.of(context).size.width * 0.18),
              decoration: headingBoxDecoration,
              child: Text(
                'Logout',
                style: headingTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.015),
              decoration: BoxDecoration(
                color: const Color(0x9d47b6d2),
                border: Border.all(
                    color: const Color.fromARGB(255, 7, 65, 79), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width10 * 0.001),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: heightc / 2, horizontal: width10 * 2),
                        margin: EdgeInsets.symmetric(horizontal: width10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 246, 246),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: width10 * 1,
                              ),
                              Text(
                                "Do you want to logout?",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.023,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: width10 * 2,
                              ),
                              //button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: logout,
                                    style: buttonStyle,
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: heightc * 0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
