// import 'dart:io';

import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/finished_order.dart';
import 'package:client_project/Feature/Contracts/view/order_in_review.dart';
import 'package:client_project/Feature/Contracts/view/start_new_order.dart';
import 'package:client_project/Feature/Profile/user_profile.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:client_project/Feature/settings/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ContractHomeView extends StatefulWidget {
  @override
  _ContractHomeViewState createState() => _ContractHomeViewState();
}

class _ContractHomeViewState extends State<ContractHomeView> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ContractHomePage(),
    SettingView(),
    UserProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkEmailVerification(context);
    });
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Function to check email verification status
  // Future<void> checkEmailVerification(BuildContext context) async {
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null && !user.emailVerified) {
  //     print(">>>>>>>Not verified ");
  //     showEmailNotVerifiedDialog(context, user);
  //   } else if (user != null && user.emailVerified) {
  //     print(">>>>>>  verified ");
  //   }
  // }
  Future<void> checkEmailVerification(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload();
      user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        print(">>>>>>> Not verified ");
        showEmailNotVerifiedDialog(context, user);
      } else if (user != null && user.emailVerified) {
        print(">>>>>> Verified ");
      }
    }
  }

  // Function to show a warning dialog
  void showEmailNotVerifiedDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Email Not Verified"),
          content: Text(
              "Your email address has not been verified. Please verify your email to continue."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Later"),
            ),
            TextButton(
              onPressed: () async {
                await sendVerificationEmail(user);
                Navigator.of(context).pop();
              },
              child: Text("Resend Verification Email"),
            ),
          ],
        );
      },
    );
  }

  // Function to send a verification email
  Future<void> sendVerificationEmail(User user) async {
    try {
      await user.sendEmailVerification();
      print("Verification email sent.");
    } catch (e) {
      print("Failed to send verification email: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ContractHomePage extends StatelessWidget {
  const ContractHomePage({super.key});

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
              const Text(
                "Contracts. \nMade Easy",
                style: AppTextStyle.textStyleBoldBlack20,
              ),
              AppSizedBox.sizedH30,
              TextButton(
                onPressed: () {
                  navigateTo(context, StartNewOrderView());
                },
                child: const Text(
                  "Start a New Order",
                  style: AppTextStyle.textStyleMediumGray18,
                ),
              ),
              AppSizedBox.sizedH30,
              TextButton(
                onPressed: () {
                  navigateTo(context, const OrderInReview());
                },
                child: const Text(
                  "Contracts in Review",
                  style: AppTextStyle.textStyleMediumGray18,
                ),
              ),
              AppSizedBox.sizedH30,
              TextButton(
                onPressed: () {
                  navigateTo(context, FinishedOrderView());
                },
                child: const Text(
                  "Finished Orders",
                  style: AppTextStyle.textStyleMediumGray18,
                ),
              )
            ]),
      ),
    );
  }
}
