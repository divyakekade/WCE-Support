import 'package:flutter/material.dart';
import 'package:wce_support/screens/HomePage.dart';
import 'package:wce_support/screens/PutGrievance.dart';
import 'package:wce_support/screens/ViewGrievances.dart';
import 'package:wce_support/widgets/SidebarHeader.dart';
import '../widgets/Appbar.dart';

class SideMenuNavigation extends StatefulWidget {
  const SideMenuNavigation({super.key});

  @override
  State<SideMenuNavigation> createState() => _SideMenuNavigationState();
}

class _SideMenuNavigationState extends State<SideMenuNavigation> {
  var currentPage="home";

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == "home") {
      container = const HomePage();
    } else if (currentPage == "buy_products") {
      container = const HomePage(); //need to change 
    } else if (currentPage == "sell_products") {
      container = const HomePage(); //need to change 
    } else if (currentPage == "view_grievances") {
      container = const ViewGrievances();
    } else if (currentPage == "put_grievance") {
      container = const PutGrievance();
    } else if (currentPage == "view_profile") {
      container = const HomePage(); //need to change 
    } else if (currentPage == "logout") {
      container = const HomePage(); //need to change 
    }
    
    return Scaffold(
        appBar: const Appbar(),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SidebarHeader(),
                SidebarList()
              ],
            ),
          ),
        ),
        body: container
        );
  } 

  Widget SidebarList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == "home" ? true : false),
          menuItem(2, "Buy Products", Icons.shopping_cart_outlined,
              currentPage == "buy_products" ? true : false),
          menuItem(3, "Sell Products", Icons.sell_outlined,
              currentPage == "sell_products" ? true : false),
          menuItem(4, "View Grivances", Icons.notes,
              currentPage == "view_grievances" ? true : false),
          menuItem(5, "Put Grievance", Icons.feedback_outlined,
              currentPage == "put_grievance" ? true : false),
          menuItem(6, "View Profile", Icons.person_outlined,
              currentPage == "view_profile" ? true : false),
          menuItem(7, "Logout", Icons.logout,
              currentPage == "logout" ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
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
              currentPage = "view_grievances";
            } else if (id == 5) {
              currentPage = "put_grievance";
            } else if (id == 6) {
              currentPage = "view_profile";
            } else if (id == 7) {
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

