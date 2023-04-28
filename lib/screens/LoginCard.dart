import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class LoginCard extends StatefulWidget {

  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginCard> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Future<void> login() async {
      print(_emailController.text);
      print(_passwordController.text);
      try {
        await Provider.of<Auth>(context, listen: false)
            .login(_emailController.text, _passwordController.text);
        showCustomSnackbar(1, "Logged in successfully!", context);
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SideMenuNavigation(loadedPage: 'home',)));
      } catch (error) {
        showErrorDialogBox2(error.toString(), context);
      }
    }
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.13,
              horizontal: MediaQuery.of(context).size.width * 0.06),
          padding: EdgeInsets.symmetric(
              // vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.015),
          decoration: BoxDecoration(
            color: const Color(0x9d47b6d2),
            border:
                Border.all(color: const Color.fromARGB(255, 7, 65, 79), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10 * 0.001),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.0052,
                      horizontal: MediaQuery.of(context).size.width * 0.18),
                  decoration: headingBoxDecoration,
                  child: Text(
                    'Login',
                    style: headingTextStyle,
                  ),
                ),
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
                            height: width10 * 2,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  labelText: 'username',
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: width10 * 2,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: TextField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'password',
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                          ),
                          SizedBox(
                            height: width10 * 5,
                          ),
                          //button
                          ElevatedButton(
                            onPressed: login,
                            style: buttonStyle,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: heightc*0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  )
                ],
              ),
            ),
          ),
    );
  }
}