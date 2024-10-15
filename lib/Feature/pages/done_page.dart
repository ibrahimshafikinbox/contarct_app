import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';

import 'package:client_project/Feature/Login/widget/app_button.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';

import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizedBox.sizedH50,
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Done!",
                  style: TextStyle(
                    fontSize: 28.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Now you can start uploading your contract.",
                  style: TextStyle(
                    fontSize: 28.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            AppSizedBox.sizedH50,
            Image.asset("assets/img/Rectangle 1.png"),
            AppSizedBox.sizedH50,
            DefaultButton(
                function: () {
                  navigateAndFinish(context, ContractHomeView());
                },
                text: "Let's go!",
                textColor: AppColors.white,
                bottonColor: AppColors.green)
          ],
        ),
      ),
    );
  }
}
