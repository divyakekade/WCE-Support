import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "WCE Support",
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
    //   actions: [
    //     PopupMenuButton(itemBuilder: (context) {
    //       return [
    //         const PopupMenuItem<int>(
    //           value: 0,
    //           child: Text("Profile Settings"),
    //         ),
    //         const PopupMenuItem<int>(
    //           value: 1,
    //           child: Text("Logout"),
    //         ),
    //       ];
    //     },
    //     onSelected:(value){
    //       if(value==0){

    //       }
    //     }
    //     )
    //   ],
    );
  }
}
