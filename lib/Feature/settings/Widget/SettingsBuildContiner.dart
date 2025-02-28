import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

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
