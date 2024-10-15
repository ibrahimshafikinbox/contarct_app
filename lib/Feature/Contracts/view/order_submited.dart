import 'dart:io';

import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/review_contarct.dart';
import 'package:client_project/Feature/Contracts/view/start_new_order.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/Profile/user_profile.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:client_project/Feature/settings/setting_view.dart';
import 'package:flutter/material.dart';

class OrderSubmitedView extends StatelessWidget {
  const OrderSubmitedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizedBox.sizedH40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSizedBox.sizedW50,
                const Text(
                  "New Order \nSubmitted!",
                  style: AppTextStyle.textStyleBoldBlack18,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 186, 183, 183),
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share_outlined)),
                ),
              ],
            ),
            AppSizedBox.sizedH20,
            Center(
                child: Image.asset(
              "assets/img/submit_logo.png",
              height: 300,
            )),
            AppSizedBox.sizedH20,
            Stack(
              alignment: Alignment.center,
              children: [
                // Line below the text
                Container(
                  height: 2,
                  width: 300, // Adjust the width of the line as needed
                  color: Colors.black,
                ),
                // Text widget
              ],
            ),
            SizedBox(height: 10),
            // Body text
            Text(
              'is submitted and will be assigned to a legal professional. You can check on the status of the contract review in the Contracts Under Review section of the app.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            // Footer text
            Text(
              'We are excited to help you with your goals and make contracting easy and fast.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            AppSizedBox.sizedH60,
            Material(
              borderRadius: BorderRadius.circular(30),
              color: Color(0XFFFFFFFF),
              elevation: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSizedBox.sizedW20,
                    DefaultButton(
                        function: () {},
                        text: "  Contracts Under Review  ",
                        textColor: AppColors.white,
                        bottonColor: AppColors.green),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
