import 'package:client_project/Core/navigation_helper.dart';

import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/ScreenSplash_3.dart';

import 'package:client_project/Feature/pages/privacy_3.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

class ScreenSplash_2 extends StatelessWidget {
  const ScreenSplash_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH40,
            // Headline text
            const Text("Glad you asked.",
                style: AppTextStyle.textStyleBoldBlack20),
            SizedBox(height: 20.0),

            // Detailed description
            const Text(
              "First, you upload your contract and pay the service fee.\n\n"
              "Second, one of our team of legal analysts (aka a lawyer) reviews the contract. They provide suggested redlines, comments, and helpful tips.\n\n"
              "Third, you get your updated contract and the zen contract confidence to achieve your goals.\n\n"
              "You get to take that updated contract and use all, some, or none of the suggested language. You can negotiate using the tips provided. Or, you can sign it knowing that you understand what you are signing.\n\n"
              "That's it. That is what the app provides. Contract Contentment.",
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
                  navigateTo(context, ScreenSplash_3());
                },
                text: "How do I start?",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
