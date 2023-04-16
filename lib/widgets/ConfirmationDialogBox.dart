import 'package:flutter/material.dart';

void showConfirmationDialogBox(String message,Future<void> Function() function,BuildContext context) {
  showDialog(
      context: context,
      builder: ((ctx) => AlertDialog(
            content: Text(message, style: const TextStyle(fontWeight: FontWeight.w500),),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text("No")),
              TextButton(
                  onPressed: ()=>function(),
                  child: const Text("Yes")),
            ],
          )));
}
