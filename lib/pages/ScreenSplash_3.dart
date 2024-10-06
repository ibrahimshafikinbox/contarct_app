import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/pages/Privacy_1.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ScreenSplash_3 extends StatelessWidget {
  const ScreenSplash_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizedBox.sizedH50,
            const Text(
              "All you have to do is create an account\n"
              "and start a new order.\n",
              style: AppTextStyle.textStyleBoldBlack,
            ),
            AppSizedBox.sizedH50,
            Image.asset("assets/img/splash 3.png"),
            AppSizedBox.sizedH50,
            DefaultButton(
                function: () {
                  navigateTo(context, Privacy_1());
                },
                text: "Sign me up!",
                textColor: AppColors.white,
                bottonColor: AppColors.green)
          ],
        ),
      ),
    );
  }
}
