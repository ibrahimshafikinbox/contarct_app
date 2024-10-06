import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/privacy_5.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Privacy_4 extends StatelessWidget {
  const Privacy_4({Key? key}) : super(key: key);

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
            const Text(
                "We keep your privacy \nprotected like treasure in the bottom of the ocean.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            AppSizedBox.sizedH25,
            // Detailed description
            const Text(
              "Below is the Privacy Policy for the app.\n\n"
              "Certain terms apply depending on your jurisdiction (meaning the state you reside in within the United States or the country of which you are a citizen).\n\n"
              "This app protects your information, complies with privacy laws, and will only collect, process, and share your information with strategic partners under the following conditions: with your consent, for legal requirements, or after de-identifying (removing your personal information) the data to analyze it and provide better service(s).",
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
                  navigateTo(context, Privacy_5());
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
