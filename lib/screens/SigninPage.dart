import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const SigninPage({Key? key, required this.showLoginPage}) : super(key: key);
  @override
  State<SigninPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<SigninPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _prnController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _prnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    // double hc = MediaQuery.of(context).size.height * 0.45;
    // double wc = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: width10,
                ),
                ///////////
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.0052,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: headingBoxDecoration,
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                        //prn
                        TextField(
                          controller: _prnController,
                          decoration: const InputDecoration(
                            hintText: 'prn',
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
                          onPressed: () {
                            print(_prnController);
                          },
                          style: buttonStyle,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: width10 * 4,
                        ),
                        // a member? login now

                        Text(
                          "Account already exists?",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: heightc / 1.2,
                          ),
                        ),
                        SizedBox(height: width10),
                        GestureDetector(
                            onTap: widget.showLoginPage,
                            child: Text(
                              "Login",
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
