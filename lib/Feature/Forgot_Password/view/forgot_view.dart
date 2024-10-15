import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
            Text('Please enter the email you use to sign in '),
            AppSizedBox.sizedH10,
            DefaultFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              hint: 'user@gmail.com',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              label: 'Email',
              maxlines: 1,
            ),
            AppSizedBox.sizedH100,
            DefaultButton(
                function: () {},
                text: "Request password reset ",
                textColor: AppColors.white,
                bottonColor: AppColors.green),
            Center(
              child: TextButton(
                child: Text("Back to Sign in"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
