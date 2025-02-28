import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Forgot_Password/view/change_pass_view.dart';
import 'package:client_project/Feature/Forgot_Password/view/forgot_view.dart';
import 'package:client_project/Feature/Login/cubit/login_cubit.dart';
import 'package:client_project/Feature/Login/cubit/login_state.dart';
import 'package:client_project/Feature/pages/Privacy_1.dart';
import 'package:client_project/Feature/pages/help.dart';
import 'package:client_project/Feature/pages/term_of-use.dart';
import 'package:client_project/Feature/settings/Widget/AllowNotificationWidget.dart';
import 'package:client_project/Feature/settings/Widget/SettingsBuildContiner.dart';
import 'package:client_project/Feature/settings/Widget/showDeleteAccountPopup.dart';
import 'package:client_project/Feature/settings/Widget/showLogoutPopup.dart';
import 'package:client_project/Feature/splash/splash_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          NotificationsBuildContainer(
            child: const AllowNotificationWidget(),
            text: "Notification",
            icon: Icons.notifications_outlined,
            onPress: () {},
          ),
          SettingsBuildContiner(
            onpress: () {
              navigateTo(context, const ForgotPassView());
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
              navigateTo(context, const TermsOfUseView());
            },
            text: "Terms of use",
            icon: Icons.file_present_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {
              navigateTo(context, const HelpView());
            },
            text: "Help",
            icon: Icons.help_outline,
          ),
          SettingsBuildContiner(
            onpress: () {
              showLogoutPopup(context, () {
                LoginCubit.get(context).logoutUser().then((value) {
                  print(CachePrfHelper.getUid().toString());
                  if (CachePrfHelper.getUid() == null) {
                    navigateAndFinish(context, const SplashView());
                  }
                });
              });
            },
            text: "Log out",
            icon: Icons.logout_outlined,
          ),
          SettingsBuildContiner(
            onpress: () {
              showDeleteAccountPopup(context, () {
                LoginCubit.get(context).deleteAccount().then((value) {
                  print(CachePrfHelper.getUid().toString());
                  if (CachePrfHelper.getUid() == null) {
                    navigateAndFinish(context, const SplashView());
                  }
                });
              });
            },
            text: "Delete Account",
            icon: Icons.delete_outline,
          ),
        ],
      ),
    );
  }
}
