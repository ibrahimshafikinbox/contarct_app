import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

void showLogoutPopup(BuildContext context, VoidCallback onLogout) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Confirm Logout",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        content: const Text(
          "Are you sure you want to log out?",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          AppSizedBox.sizedW50,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              // Call the passed callback to perform the logout action
              onLogout();
              Navigator.pop(context);
            },
            child: const Text("Log Out"),
          ),
        ],
      );
    },
  );
}
