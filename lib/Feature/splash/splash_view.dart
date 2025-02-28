import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Create_account/View/create_acc_view.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/understand_contaract._1.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/Login/View/login_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSizedBox.sizedH50,
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Image.asset("assets/img/Group 12.png")),
          ),
          AppSizedBox.sizedH50,
          appButton(
              function: () {
                navigateTo(context, LoginView());
              },
              text: "Sign In ",
              textColor: AppColors.black,
              bottonColor: AppColors.white),
          AppSizedBox.sizedH20,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Divider(color: AppColors.black)),
                Text('  OR  '),
                Expanded(child: Divider(color: AppColors.black)),
              ],
            ),
          ),
          AppSizedBox.sizedH20,
          appButton(
              function: () {
                navigateTo(context, ScreenSplash_1());
              },
              text: "Sign Up ",
              textColor: AppColors.black,
              bottonColor: AppColors.white),
        ],
      ),
    );
  }
}
