import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppDialog {
  static void showLoding({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Gap(10),
              CircularProgressIndicator(),
              Gap(10),
              Text(
                "Loding...",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }

  static void showError(
      {required String content, required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            Icons.warning,
            size: 30,
            color: Colors.red,
          ),
          content: Text(
            content,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Text("Ok"))
          ],
        );
      },
    );
  }
}
