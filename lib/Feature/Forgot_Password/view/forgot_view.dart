import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/View/login_view.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Add toast for feedback

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword() async {
    final String email = emailController.text.trim();
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("'Password reset link sent! Check your email.'");
      Fluttertoast.showToast(
          timeInSecForIosWeb: 5,
          toastLength: Toast.LENGTH_LONG,
          msg: 'Password reset link sent! Check your email.');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? 'An error occurred.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH60,
            const Center(
              child: Text(
                "Forgot Your Password?",
                style: AppTextStyle.textStyleBoldBlack,
              ),
            ),
            AppSizedBox.sizedH30,
            const Text(
              'Please enter the email you use to sign in.',
              style: AppTextStyle.textStyleRegularBlack,
            ),
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
            AppSizedBox.sizedH30,
            DefaultButton(
              function: () {
                if (emailController.text.isNotEmpty) {
                  resetPassword();
                } else {
                  Fluttertoast.showToast(msg: 'Please enter your email.');
                }
              },
              text: "Request password reset",
              textColor: AppColors.white,
              bottonColor: AppColors.green,
            ),
            Center(
              child: TextButton(
                child: const Text("Back to Sign in"),
                onPressed: () {
                  navigateAndFinish(context, const LoginView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
