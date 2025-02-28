import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/privacy_2.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class Privacy_1 extends StatefulWidget {
  const Privacy_1({Key? key}) : super(key: key);

  @override
  _Privacy_1State createState() => _Privacy_1State();
}

class _Privacy_1State extends State<Privacy_1> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "These are the terms and conditions for using the app. Yes, the thing you normally scroll by without reading.\n",
    "First, you upload your contract and pay the service fee.\n",
    "Second, one of our legal analysts (aka a lawyer) reviews your contract. They provide suggested redlines, comments, and helpful tips.\n",
    "Third, you receive your updated contract, giving you the confidence to achieve your goals.\n",
    "You can choose to use all, some, or none of the suggested language. You can negotiate using the tips provided, or sign it knowing you understand what you are agreeing to.\n",
    "That's it. This app is designed to help you achieve Contract Contentment.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12), // Total duration for all animations
    );

    // Create fade-in animations for each line, staggering them with intervals
    _fadeAnimations = [
      for (int i = 0; i < _textLines.length; i++)
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(i * 0.1, (i + 1) * 0.1, curve: Curves.easeIn),
          ),
        ),
    ];

    _controller.forward(); // Start the animations
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
        child: ListView(
          children: [
            const Text(
              "Legal. Always \ndoing their thing.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            AppSizedBox.sizedH25,

            // Display each line with its own fade animation
            ..._textLines.asMap().entries.map((entry) {
              int index = entry.key;
              String line = entry.value;
              return FadeTransition(
                opacity: _fadeAnimations[index],
                child: Text(
                  line,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              );
            }).toList(),

            SizedBox(height: 50),

            // Animated button that appears after text
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, Privacy_2());
                },
                text: "Tell Me More",
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
