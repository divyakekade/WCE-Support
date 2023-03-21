import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


class SigninPage extends StatefulWidget{
  final VoidCallback showLoginPage;

  const SigninPage({Key? key,
    required this.showLoginPage
  }):super(key: key);
  @override
  State<SigninPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<SigninPage>{






  @override
  Widget build(BuildContext context){
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    double hc = MediaQuery.of(context).size.height * 0.45;
    double wc = MediaQuery.of(context).size.width * 0.9;
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
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: width10*4),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: grey_color,
                        ),
                        BoxShadow(
                          offset: Offset(5, 2),
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.black38,
                          inset: true,
                        ),
                      ],
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: heightc,
                        fontWeight: FontWeight.bold,
                        color: heading_color,
                      ),

                    ),
                  ),

                  Container(
                    height: hc*1.2,
                    width: wc,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: width10),
                    decoration: BoxDecoration(
                      color: grey_color,

                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: Offset(2.0, 5.0)
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: heightc,
                          ),
                          TextField(
                                decoration: InputDecoration(

                                  hintText: 'email',
                                  border: UnderlineInputBorder(),
                                ),
                              ),

                          SizedBox(height: width10*3,),
                          //prn
                          TextField(
                            decoration: InputDecoration(

                              hintText: 'prn',
                              border: UnderlineInputBorder(),
                            ),
                          ),

                          SizedBox(height: width10*3,),
                          //password
                         TextField(

                                obscureText: true,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Password',
                                ),
                              ),

                          SizedBox(height: width10*6,),

                          //button
                          ElevatedButton(
                            onPressed: () {
                              print("Signed Up");
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              textStyle: TextStyle(fontSize: heightc),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                            ),

                          ),
                          SizedBox(height: width10*4,),
                          // a member? login now


                              Text("Allready registered?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: heightc/1.2,
                                ),
                              ),
                              SizedBox(height: heightc/1.5,),
                              GestureDetector(
                                  onTap: widget.showLoginPage,
                                  child: Text("Login",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: heightc/1.2,
                                    ),
                                  )
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

      backgroundColor: card_background,
    );
  }
}
