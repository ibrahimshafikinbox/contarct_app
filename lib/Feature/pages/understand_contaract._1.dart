import 'package:flutter/material.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/understand_contaract_2.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class ScreenSplash_1 extends StatefulWidget {
  const ScreenSplash_1({Key? key}) : super(key: key);

  @override
  _ScreenSplash_1State createState() => _ScreenSplash_1State();
}

class _ScreenSplash_1State extends State<ScreenSplash_1>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "Do you want to understand your contract?",
    "Do you want to know what certain words mean?",
    "What parts of your contract you can push back and negotiate?",
    "What terms are missing?",
    "Or, want peace of mind that you are not signing something that can backfire and lose you money?",
    "This app is here to help.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    // Calculate step size to ensure it does not exceed 1.0
    double step = 1.0 / (_textLines.length + 1);

    _fadeAnimations = List.generate(_textLines.length, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * step,
            (index * step) +
                0.2, // Ensures the last interval does not exceed 1.0
            curve: Curves.easeIn,
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH50,
            // Show text lines with fade animation one by one
            ...List.generate(_textLines.length, (index) {
              return FadeTransition(
                opacity: _fadeAnimations[index],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    _textLines[index],
                    style: index == 0 || index == _textLines.length - 1
                        ? AppTextStyle.textStyleBoldBlack20
                        : const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                  ),
                ),
              );
            }),

            const Spacer(),

            // Fade transition for the button after text animations
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, ScreenSplash_2());
                },
                text: "How?",
                textColor: AppColors.white,
                bottonColor: AppColors.green,
              ),
            ),
            AppSizedBox.sizedH100
          ],
        ),
      ),
    );
  }
}
