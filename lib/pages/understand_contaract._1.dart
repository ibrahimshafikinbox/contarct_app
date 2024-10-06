import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/understand_contaract_2.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ScreenSplash_1 extends StatelessWidget {
  const ScreenSplash_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH50,
            // Headline text
            const Text("Do you want to\nunderstand your\ncontract?",
                style: AppTextStyle.textStyleBoldBlack20),
            SizedBox(height: 20.0),

            // Detailed description
            const Text(
              "Do you want to know what certain words mean?\n\n"
              "What parts of your contract you can pushback and negotiate?\n\n"
              "What terms are missing?\n\n"
              "Or, want peace of mind that you are not signing something that can backfire and lose you money?\n\n",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                height: 1.5, // Line height for readability
              ),
            ),
            const Text(
              "This app is here to help . ",
              style: AppTextStyle.textStyleBoldBlack20,
            ),

            const Spacer(), // Push the button to the bottom

            // Button
            DefaultButton(
                function: () {
                  navigateTo(context, ScreenSplash_2());
                },
                text: "How ? ",
                textColor: AppColors.white,
                bottonColor: AppColors.green)
          ],
        ),
      ),
    );
  }
}
