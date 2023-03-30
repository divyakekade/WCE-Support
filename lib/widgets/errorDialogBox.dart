import 'package:flutter/material.dart';

void showErrorDialogBox2(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: ((ctx) => AlertDialog(
            title: const Text("Opps...Something went wrong"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () =>
                      Navigator.of(ctx).pop(),
                  child: const Text("OK"))
            ],
          )));
}
