import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/Provider/productProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/BuyProducts.dart';
import 'package:wce_support/screens/EditProfile.dart';
import 'package:wce_support/screens/FavouriteProducts.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/LoginPage.dart';
import 'package:wce_support/screens/LogoutPage.dart';
import 'package:wce_support/screens/PutGrievance.dart';
import 'package:wce_support/screens/SellProducts.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wce_support/screens/UsersManagement.dart';
import 'package:wce_support/screens/ViewGrievances.dart';
import 'package:flutter/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  // print(pref.getString('userid'));
  runApp(MyApp(
      token: pref.getString('token'),
      id: pref.getString('userid'),
      user: pref.getString('user')));
}

class MyApp extends StatelessWidget {
  String? token;
  String? id;
  String? user;
  MyApp({super.key, this.token, this.id, this.user});

  void initState(BuildContext context) {
    print("token $id");
  }

  @override
  Widget build(BuildContext context) {
    // initState(context);
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Griv()),
        ChangeNotifierProvider.value(value: Prod()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WCE Support',
          theme: ThemeData(
            primarySwatch: buildMaterialColor(primaryColor),
          ),
          home: (token != null && JwtDecoder.isExpired(token!) == false)
              ? SideMenuNavigation(
                  loadedPage: "home",
                  token: token,
                  user: user,
                  userid: id,
                )
              : const LoginPage(),
          routes: {
            BuyProducts.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'buy_products',),
            HomeScreen.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'home',),
            SellProduct.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'sell_products',),
            FavouriteProducts.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'favourite_products',),
            ViewGrievances.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'view_grievances',),
            PutGrievance.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'put_grievance',),
            LogoutPage.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'logout',),
            EditProfile.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'view_profile',),
            LoginPage.routeUrl: (ctx) => const LoginPage(),
            UsersManagement.routeUrl: (ctx) => SideMenuNavigation(loadedPage: 'users_management'),
          }),
    );
  }
}
