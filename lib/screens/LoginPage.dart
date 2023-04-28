import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/screens/LoginCard.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class LoginPage extends StatefulWidget {
  static const routeUrl = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<bool> backNavigation() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WCE Support",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: backNavigation,
        child: Stack(children: [
            ClipRRect(
                child: Image.asset(
              "assets/walchand.jfif",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              opacity: const AlwaysStoppedAnimation(.36),
            )),
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
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(
                //       horizontal: MediaQuery.of(context).size.width * 0.03),
                //   decoration: const BoxDecoration(
                //       // border: Border.all(color: const Color(0xff5a2f2f), width: 1),
                //       // borderRadius: BorderRadius.circular(15),
                //       borderRadius: BorderRadius.vertical(
                //         bottom: Radius.circular(20),
                //       ),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.grey,
                //             offset: Offset(2, 2),
                //             blurRadius: 5)
                //       ]),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20),
                //     child: Image.asset(
                //       'assets/walchand.jfif',
                //       // alignment: Alignment.center,
                //       width: double.infinity,
                //       height: MediaQuery.of(context).size.height * 0.35,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                LoginCard()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
