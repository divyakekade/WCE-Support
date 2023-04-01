import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/LoginPage.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  // print(pref.getString('userid'));
  runApp(MyApp(
      token: pref.getString('token'),
      id: pref.getString('userid'),
      user: pref.getString('user')));
}

class MyApp extends StatelessWidget {
  String? token;
  String?id;
  String? user;
  MyApp({super.key,  this.token,  this.id,  this.user});

  void initState(BuildContext context) {
    print("token $id");
    
  }

  @override
  Widget build(BuildContext context) {
    // initState(context);
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Griv()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WCE Support',
          theme: ThemeData(
            primarySwatch: buildMaterialColor(primaryColor),
          ),
          home: (token != null && JwtDecoder.isExpired(token!)==false)? SideMenuNavigation(
            loadedPage: "home",
            token: token,
                  user: user,
                  userid: id,
          ): SideMenuNavigation(
                  loadedPage: "home",
                  
                ),
          routes: {}),
    );
  }
}
