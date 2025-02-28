import 'package:flutter/material.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/ScreenSplash_3.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class ScreenSplash_2 extends StatefulWidget {
  const ScreenSplash_2({Key? key}) : super(key: key);

  @override
  _ScreenSplash_2State createState() => _ScreenSplash_2State();
}

class _ScreenSplash_2State extends State<ScreenSplash_2>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "Glad you asked.",
    "First, you upload your contract and pay the service fee.",
    "Second, one of our team of legal analysts (aka a lawyer) reviews the contract. They provide suggested redlines, comments, and helpful tips.",
    "Third, you get your updated contract and the zen contract confidence to achieve your goals.",
    "You get to take that updated contract and use all, some, or none of the suggested language. You can negotiate using the tips provided. Or, you can sign it knowing that you understand what you are signing.",
    "That's it. That is what the app provides. Contract Contentment."
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _fadeAnimations = List.generate(_textLines.length, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve:
              Interval(index * 0.15, (index + 1) * 0.15, curve: Curves.easeIn),
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
            AppSizedBox.sizedH40,

            // Fade transition for the dynamic text lines
            ...List.generate(_textLines.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: FadeTransition(
                  opacity: _fadeAnimations[index],
                  child: Text(
                    _textLines[index],
                    style: index == 0
                        ? AppTextStyle
                            .textStyleBoldBlack20 // First line: headline
                        : TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                            height: 1.5, // Line height for readability
                          ), // Other lines: description
                  ),
                ),
              );
            }),

            const Spacer(), // Push the button to the bottom

            // Fade transition for the button
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, ScreenSplash_3());
                },
                text: "How do I start?",
                textColor: AppColors.white,
                bottonColor: AppColors.green,
              ),
            ),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
