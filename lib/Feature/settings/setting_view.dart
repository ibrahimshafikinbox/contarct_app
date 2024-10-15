import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Forgot_Password/view/change_pass_view.dart';
import 'package:client_project/Feature/pages/Privacy_1.dart';
import 'package:flutter/material.dart';

import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_outlined),
          onPressed: () {},
        ),
        title: const Text(
          'Settings',
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: Column(
        children: [
          SettingsBuildContiner(
            onpress: () {},
            text: "Notification",
            icon: Icons.notifications_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {
              navigateTo(context, ChangePasswordView());
            },
            text: "Change password",
            icon: Icons.password_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {
              navigateTo(context, Privacy_1());
            },
            text: "Privacy policy",
            icon: Icons.privacy_tip_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {
             },
            text: "Terms of use",
            icon: Icons.file_present_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {},
            text: "Help",
            icon: Icons.help_outline,
          ),
          SettingsBuildContiner(
            onpress: () {},
            text: "Log out",
            icon: Icons.logout_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {},
            text: "Delete Account",
            icon: Icons.delete_outline,
          ),
        ],
      ),
    );
  }
}

class SettingsBuildContiner extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onpress;

  const SettingsBuildContiner({
    Key? key,
    required this.text,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xffEEEDED),
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(icon),
                AppSizedBox.sizedW20,
                Text(
                  text,
                  style: AppTextStyle.textStyleMediumBlack,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
