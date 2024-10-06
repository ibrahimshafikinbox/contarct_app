import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/privacy_3.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Privacy_2 extends StatelessWidget {
  const Privacy_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH40,
            // Headline text
            const Text("Here are the important \n\ things for you to know.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            AppSizedBox.sizedH25,
            // Detailed description
            const Text(
              "(1) This is an \"unbundled\" service. This means you are using this app for the limited purpose of reviewing your contract and providing redlines (notes and suggested language).\n\n"
              "This also means that outside of reviewing your contract, we are not your attorney, maid, or parents.\n\n"
              "This app is designed to provide you with knowledge and updated language to use in your contract.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                height: 1.5, // Line height for readability
              ),
            ),

            const Spacer(), // Push the button to the bottom

            // Button
            DefaultButton(
                function: () {
                  navigateTo(context, Privacy_3());
                },
                text: "I Understand",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
