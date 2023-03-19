import 'package:flutter/material.dart';
import '../constants/ColorsAndStyles.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      decoration: const BoxDecoration(color: primaryColor, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 159, 157, 157),
            offset: Offset(0, 3),
            blurRadius: 4)
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/walchand.jfif'),
              ),
            ),
          ),
          const Text(
            "WCE Support",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
