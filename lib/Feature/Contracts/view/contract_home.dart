// import 'package:flutter/material.dart';

// class ContractHomeView extends StatelessWidget {
//   const ContractHomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(

//     );
//   }
// }

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

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green), // Home Icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Settings Icon
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile Icon
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
              AppSizedBox.sizedH30,
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
                  // navigateTo(context, ReviewContract());
                },
                child: const Text(
                  "Contracts in Review",
                  style: AppTextStyle.textStyleMediumGray18,
                ),
              ),
              AppSizedBox.sizedH30,
              TextButton(
                onPressed: () {
                  navigateTo(context, ());
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
