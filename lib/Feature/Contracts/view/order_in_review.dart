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

class OrderInReview extends StatelessWidget {
  const OrderInReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text(
            "Contracts in Review",
            style: AppTextStyle.textStyleBoldBlack25,
          )),
          Image.asset("assets/img/in_review.png"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 1)",
                textColor: AppColors.black,
                bottonColor: AppColors.white,
                icon: Icons.navigate_next),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 2)",
                textColor: AppColors.black,
                bottonColor: AppColors.white,
                icon: Icons.navigate_next),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 3)",
                textColor: AppColors.black,
                bottonColor: AppColors.white,
                icon: Icons.navigate_next),
          )
        ],
      ),
    );
  }
}
