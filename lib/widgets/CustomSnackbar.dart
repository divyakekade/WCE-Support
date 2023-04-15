import 'package:flutter/material.dart';

void showCustomSnackbar(int n,String message, BuildContext context) {
  var snackBar = SnackBar(
        backgroundColor: n==1 ? const Color.fromARGB(255, 73, 188, 158):const Color.fromARGB(255, 247, 78, 78),
        content: Text(
          message,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
