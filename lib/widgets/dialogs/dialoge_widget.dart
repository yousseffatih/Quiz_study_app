import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dialogs {
  static final Dialogs singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return singleton;
  }

  static quetionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi..",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Please login befor you start"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text("Confirm"),
        )
      ],
    );
  }
}
