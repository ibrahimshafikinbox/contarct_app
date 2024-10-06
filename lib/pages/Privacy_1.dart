import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/privacy_2.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class Privacy_1 extends StatelessWidget {
  const Privacy_1({Key? key}) : super(key: key);

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
            const Text("Legal. Always \n\doing their thing.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            AppSizedBox.sizedH25,
            // Detailed description
            const Text(
              "These are the terms and conditions for using the app. Yes, the thing you normally scroll by without reading.\n\n"
              "First, you upload your contract and pay the service fee. \n\n"
              "Second, one of our legal analysts (aka a lawyer) reviews your contract. They provide suggested redlines, comments, and helpful tips.\n\n"
              "Third, you receive your updated contract, giving you the confidence to achieve your goals.\n\n"
              "You can choose to use all, some, or none of the suggested language. You can negotiate using the tips provided, or sign it knowing you understand what you are agreeing to.\n\n"
              "That's it. This app is designed to help you achieve Contract Contentment.",
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
                  navigateTo(context, Privacy_2());
                },
                text: "Tell Me More",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
