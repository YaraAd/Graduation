import 'package:eventk/constants.dart';
import 'package:flutter/material.dart';
/*Yara❤️*/

Future<void> ShowDialog(
  BuildContext context,
  String password,
) async {
  bool? confirm = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Are you sure you want to delete your account?',
          style: TextStyle(color: const Color.fromARGB(200, 0, 0, 0)),
        ),
        content: Text(
          'Deleting your account will remove all your data permanently. This action cannot be undone.',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Cancel deletion
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: kButtonsColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );

  if (confirm == true) {
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile deletion cancelled.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
