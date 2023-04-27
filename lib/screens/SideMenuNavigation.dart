import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wce_support/screens/CreateUser.dart';
import 'package:wce_support/screens/EditProfile.dart';
import 'package:wce_support/screens/FavouriteProducts.dart';
import 'package:wce_support/screens/HomePage.dart';
import 'package:wce_support/screens/BuyProducts.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/LogoutPage.dart';
import 'package:wce_support/screens/PutGrievance.dart';
import 'package:wce_support/screens/SellProducts.dart';
import 'package:wce_support/screens/UsersManagement.dart';
import 'package:wce_support/screens/ViewGrievances.dart';
import 'package:wce_support/widgets/SidebarHeader.dart';
import '../Provider/Auth provider.dart';
import '../widgets/Appbar.dart';

class SideMenuNavigation extends StatefulWidget {
  static const routeurl = "/sidemenunavigation";
  final String loadedPage;
  String? token;
  dynamic? user;
  String? userid;
  SideMenuNavigation(
      {super.key,
      required this.loadedPage,
      this.token,
      this.user,
      this.userid});

  @override
  State<SideMenuNavigation> createState() => SideMenuNavigationState();
}

class SideMenuNavigationState extends State<SideMenuNavigation> {
  dynamic currentPage;
  dynamic user;
  @override
  void initState() {
    super.initState();
    Provider.of<Auth>(context, listen: false)
        .setuser(widget.token, widget.user, widget.userid);
    user = Provider.of<Auth>(context, listen: false).user;
    currentPage = widget.loadedPage;
  }

  @override
  Widget build(BuildContext context) {
    dynamic container;
    if (currentPage == "home") {
      container = HomeScreen(
          user: widget.user, userid: widget.userid, token: widget.token);
    } else if (currentPage == "buy_products") {
      container = const BuyProducts();
    } else if (currentPage == "sell_products") {
      container = const SellProduct();
    } else if (currentPage == "favourite_products") {
      container = const FavouriteProducts();
    } else if (currentPage == "view_grievances") {
      container = const ViewGrievances();
    } else if (currentPage == "put_grievance") {
      container = const PutGrievance();
    } else if (currentPage == "view_profile") {
      container = const EditProfile();
    } else if (currentPage == "users_management") {
      container = const UsersManagement();
    } else if (currentPage == "logout") {
      container = const LogoutPage();
      // QuickAlert.show(context: context, type: QuickAlertType.success);
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: const Appbar(),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [const SidebarHeader(), SidebarList()],
            ),
          ),
        ),
        body: container);
  }

  // ignore: non_constant_identifier_names
  Widget SidebarList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home_outlined, currentPage == "home"),
          menuItem(2, "Buy Products", Icons.shopping_cart_outlined,
              currentPage == "buy_products"),
          menuItem(3, "Sell Products", Icons.sell_outlined,
              currentPage == "sell_products"),
          menuItem(4, "Favourite Products", Icons.favorite_border_outlined,
              currentPage == "favourite_products"),
          menuItem(5, "View Grievances", Icons.notes,
              currentPage == "view_grievances"),
          menuItem(6, "Put Grievance", Icons.feedback_outlined,
              currentPage == "put_grievance"),
          menuItem(7, "Profile Settings", Icons.settings_outlined,
              currentPage == "view_profile"),
          user['isadmin']==true
              ? menuItem(8, "Users Management", Icons.person_add_outlined,
                  currentPage == "users_management")
              : const SizedBox(),
          menuItem(9, "Logout", Icons.logout, currentPage == "logout"),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    final authtoken = Provider.of<Auth>(context, listen: false).token;
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = "home";
            } else if (id == 2) {
              currentPage = "buy_products";
            } else if (id == 3) {
              currentPage = "sell_products";
            } else if (id == 4) {
              currentPage = "favourite_products";
            } else if (id == 5) {
              currentPage = "view_grievances";
            } else if (id == 6) {
              if (authtoken == null) {
                currentPage = "home";
              } else {
                currentPage = "put_grievance";
              }
            } else if (id == 7) {
              currentPage = "view_profile";
            } else if (id == 8) {
              currentPage = "users_management";
            } else if (id == 9) {
              currentPage = "logout";
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 22,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
