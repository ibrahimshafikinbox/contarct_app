import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/done_page.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Privacy_5 extends StatelessWidget {
  const Privacy_5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: a,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH40,
            // Headline text
            const Text("Obligatory cookie acknowledgement.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            AppSizedBox.sizedH25,
            const Text(
              "Not the delicious kind. These cookies are used to personalize your user experience, including authentication, tracking orders, marketing, and usage.\n\n"
              "A screen will pop up, allowing you to select the settings you want.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                height: 1.5, // Line height for readability
              ),
            ),
            AppSizedBox.sizedH100,
            // Button
            DefaultButton(
                function: () {
                  navigateTo(context, DonePage());
                },
                text: "Cookie Settings",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
