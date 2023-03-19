import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: const Text("WCE Support",
        style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
    );
  }
}