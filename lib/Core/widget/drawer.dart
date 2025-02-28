import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/cubit/login_cubit.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:client_project/Feature/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDrawer extends StatelessWidget {
  final String lawername;
  final String image;

  const CustomDrawer({
    Key? key,
    required this.lawername,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH45,
            Text('Welcome,$lawername', style: AppTextStyle.textStyleBoldBlack),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.green),
              title: Text('Logout', style: TextStyle(color: AppColors.green)),
              onTap: () {
                LoginCubit.get(context).logoutUser().then((value) {
                  var user_id = CachePrfHelper.getUid();
                  if (user_id == null) {
                    Fluttertoast.showToast(
                        msg: "logOut Success",
                        backgroundColor: AppColors.green);
                    navigateAndFinish(context, SplashView());
                  } else if (user_id != null) {
                    Fluttertoast.showToast(
                        msg: "logOut Error", backgroundColor: AppColors.red);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
