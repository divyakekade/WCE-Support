import 'package:flutter/material.dart';
import 'package:wce_support/screens/LoginPage.dart';

import 'package:wce_support/screens/SigninPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: const RegisterPage(),
    );
  }
}



class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}):super(key: key);
  @override
  State<RegisterPage> createState() => _AuthPageState();
}
class _AuthPageState extends State<RegisterPage>{
  bool showLoginPage = true;
  void toggleScreen(){
    setState(() {
      showLoginPage = ! showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context){
    if(showLoginPage){
      return LoginPage();
    }
    else{
      return SigninPage(showLoginPage: toggleScreen);
    }
  }
}