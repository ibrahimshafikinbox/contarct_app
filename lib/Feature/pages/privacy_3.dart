import 'package:client_project/Core/navigation_helper.dart';

import 'package:client_project/Feature/Login/widget/app_button.dart';

import 'package:client_project/Feature/pages/privacy_3.dart';
import 'package:client_project/Feature/pages/privacy_4.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';

import 'package:flutter/material.dart';

class Privacy_3 extends StatelessWidget {
  const Privacy_3({Key? key}) : super(key: key);

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
              "(3) Confidentiality.\n\n"
              "This app protects your confidential information, including your contract, the names of the parties involved, and any private information you provide.\n\n"
              "You may have heard of attorney-client privileged information, which means it is confidential and generally cannot be disclosed by an attorney.\n\n"
              "For the unbundled service of reviewing your contract, any confidential information you provide will only be used and shared with our team to deliver this service.",
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
                  navigateTo(context, Privacy_4());
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
