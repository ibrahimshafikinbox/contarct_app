import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  // final Color background;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;
  final Color bottonColor;

  const DefaultButton({
    Key? key,
    this.height = 50,
    required this.function,
    required this.text,
    this.isUpperCase = false,
    this.radius = 25.0,
    required this.textColor,
    required this.bottonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        // width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: bottonColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: function,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class appButton extends StatelessWidget {
  final double height;
  // final Color background;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;
  final Color bottonColor;

  const appButton({
    super.key,
    this.height = 50,
    required this.function,
    required this.text,
    this.isUpperCase = false,
    this.radius = 25.0,
    required this.textColor,
    required this.bottonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class appButtonWithIcon extends StatelessWidget {
  final double height;
  // final Color background;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;
  final Color bottonColor;
  final IconData icon;

  const appButtonWithIcon({
    Key? key,
    this.height = 50,
    required this.function,
    required this.text,
    this.isUpperCase = false,
    this.radius = 25.0,
    required this.textColor,
    required this.bottonColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSizedBox.sizedW100,
              Text(
                isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: textColor,
                ),
              ),
              // Spacer(),
              Spacer(), Icon(icon)
            ],
          ),
        ),
      ),
    );
  }
}
