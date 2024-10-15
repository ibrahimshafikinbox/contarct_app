import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH50,
            Center(
              child: Text(
                "Forgot Your Password ",
                style: AppTextStyle.textStyleBoldBlack,
              ),
            ),
            AppSizedBox.sizedH50,
            Text('Enter your new password  '),
            AppSizedBox.sizedH10,
            DefaultFormField(
              controller: passwordController,
              type: TextInputType.emailAddress,
              hint: 'password',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter passsword';
                }
                return null;
              },
              label: 'password',
              maxlines: 1,
            ),
            AppSizedBox.sizedH10,
            DefaultFormField(
              controller: confirmnameController,
              type: TextInputType.emailAddress,
              hint: 'Confirm password',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter passsword';
                }
                return null;
              },
              label: 'Confirm password',
              maxlines: 1,
            ),
            AppSizedBox.sizedH50,
            DefaultButton(
                function: () {},
                text: "Change your password now",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
          ],
        ),
      ),
    );
  }
}
