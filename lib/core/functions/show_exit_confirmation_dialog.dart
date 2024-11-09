import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Exit App?"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => GoRouter.of(context).pop(false),
                child: Text("No"),
              ),
              TextButton(
                onPressed: () => GoRouter.of(context).pop(true),
                child: Text("Yes"),
              ),
            ],
          );
        },
      ) ??
      Future.value(false); // Default to false if the dialog is dismissed
}
