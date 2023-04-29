import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleUserPastGrievnaces.dart';
import 'package:wce_support/screens/SingleUserPastProducts.dart';
import 'package:wce_support/widgets/ContainerWithBlueBorder.dart';
import '../Provider/Auth provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/LoginPage.dart';

class HomeScreen extends StatefulWidget {
  String? token;
  dynamic? user;
  String? userid;
  HomeScreen({super.key, this.token, this.user, this.userid});
  static String routeUrl = "./home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic user;
  @override
  void initState() {
    super.initState();
    // SharedPreferences  pref = await SharedPreferences.getInstance();
    // String token =
    // print(pref.getString('userid'));
    // if(widget.token!=null  && widget.token!=null &&widget.token!=null){
    user = Provider.of<Auth>(context, listen: false).user;
    Provider.of<Auth>(context, listen: false)
        .setuser(widget.token, widget.user, widget.userid);
    // }
  }

  viewYourGrievances() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SingleUserPastGrievances()));
  }

  viewYourProducts() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SingleUserPastProducts()));
  }

  manageUsers() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            SideMenuNavigation(loadedPage: 'users_management')));
  }

  viewManagementGrievances(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            SideMenuNavigation(loadedPage: 'view_grievances')));
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
                // onPressed: () => Navigator.of(context).pop(true),
                onPressed: ()=>SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final authtoken = Provider.of<Auth>(context, listen: false).token;
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    print(user);
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
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   color: backgroundColor),
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
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  decoration: const BoxDecoration(
                      // border: Border.all(color: const Color(0xff5a2f2f), width: 1),
                      // borderRadius: BorderRadius.circular(15),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/walchand.jfif',
                      // alignment: Alignment.center,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                authtoken == null
                    ? const LoginPage()
                    : Container(
                        padding: EdgeInsets.symmetric(
                            // vertical: MediaQuery.of(context).size.height * 0.02,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          children: user['admintype'] == 'studentadmin'
                              ? [
                                  ContainerWithBlueBorder(
                                      content:
                                          "Create, view and edit user profiles",
                                      btnText: "Manage",
                                      function: manageUsers)
                                ]
                              : user['admintype']=="NO" ? [
                                  ContainerWithBlueBorder(
                                    content: "View Your Grievances",
                                    btnText: "View",
                                    function: viewYourGrievances,
                                  ),
                                  ContainerWithBlueBorder(
                                      content: "View Your Products",
                                      btnText: "View",
                                      function: viewYourProducts),
                                ]:[
                                  ContainerWithBlueBorder(
                                    content: "View Your Grievances",
                                    btnText: "View",
                                    function: viewManagementGrievances,
                                  ),
                                ],
                        ),
                      )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
