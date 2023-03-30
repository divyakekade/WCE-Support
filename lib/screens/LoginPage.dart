import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
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

  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    // double hc = MediaQuery.of(context).size.height * 0.45;
    // double wc = MediaQuery.of(context).size.width * 0.9;
    Future<void> login() async {
      print(_emailController.text);
      print(_passwordController.text);
      try {
        await Provider.of<Auth>(context, listen: false)
            .login(_emailController.text, _passwordController.text);
      } catch (error) {
        showErrorDialogBox2(error.toString(), context);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //text field
                SizedBox(
                  height: width10,
                ),
                //////////////
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.0052,
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  decoration: headingBoxDecoration,
                  child: Center(
                    child: Text(
                      'Login',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: heightc / 2, horizontal: width10 * 2),
                  margin: EdgeInsets.symmetric(horizontal: width10),
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: Offset(2.0, 5.0))
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: width10 * 2,
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'email',
                            border: UnderlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: width10 * 2,
                        ),
                        //password
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Password',
                          ),
                        ),

                        SizedBox(
                          height: width10 * 6,
                        ),
                        //button
                        ElevatedButton(
                          onPressed: login,
                          style: buttonStyle,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: width10 * 3,
                        ),
                        //not a member? register now

                        Text(
                          "Account doesn't exist?",
                          style: TextStyle(
                            //  fontWeight: FontWeight.bold,
                            fontSize: heightc / 1.2,
                          ),
                        ),
                        SizedBox(height: width10),
                        GestureDetector(
                            onTap: null,
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: heightc / 1.2,
                              ),
                            )),
                        SizedBox(
                          height: width10,
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
      backgroundColor: cardBackground,
    );
  }
}
