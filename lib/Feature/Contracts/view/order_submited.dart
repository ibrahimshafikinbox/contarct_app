import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:client_project/Feature/Contracts/view/order_in_review.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class OrderSubmitedView extends StatelessWidget {
  const OrderSubmitedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AppSizedBox.sizedH40,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New Order Submitted!",
                  style: AppTextStyle.textStyleBoldBlack18,
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
            const SizedBox(height: 10),
            // Body text
            const Text(
              'is submitted and will be assigned to a legal professional. You can check on the status of the contract review in the Contracts Under Review section of the app.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            // Footer text
            const Text(
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
                        function: () {
                          navigateAndFinish(context, OrderInReview());
                        },
                        text: "  Contracts Under Review  ",
                        textColor: AppColors.white,
                        bottonColor: AppColors.green),
                  ],
                ),
              ),
            ),
            AppSizedBox.sizedH15,
            TextButton(
                onPressed: () {
                  navigateAndFinish(context, ContractHomeView());
                },
                child: const Text("back to home")),
            AppSizedBox.sizedH15,
          ],
        ),
      ),
    );
  }
}
