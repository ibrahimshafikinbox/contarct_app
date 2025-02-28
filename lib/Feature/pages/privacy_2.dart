import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/privacy_3.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class Privacy_2 extends StatefulWidget {
  const Privacy_2({Key? key}) : super(key: key);

  @override
  _Privacy_2State createState() => _Privacy_2State();
}

class _Privacy_2State extends State<Privacy_2> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimationHeadline;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "(1) This is an \"unbundled\" service. This means you are using this app for the limited purpose of reviewing your contract and providing redlines (notes and suggested language).\n",
    "This also means that outside of reviewing your contract, we are not your attorney, maid, or parents.\n",
    "This app is designed to provide you with knowledge and updated language to use in your contract.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Animation for the headline
    _fadeAnimationHeadline = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.4, curve: Curves.easeIn),
      ),
    );

    // Create fade-in animations for each line, staggering them with intervals
    _fadeAnimations = [
      for (int i = 0; i < _textLines.length; i++)
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.4 + (i * 0.2), 0.6 + (i * 0.2),
                curve: Curves.easeIn),
          ),
        ),
    ];

    // Start the animation
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

            // Fade transition for the headline
            FadeTransition(
              opacity: _fadeAnimationHeadline,
              child: const Text(
                "Here are the important \nthings for you to know.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            AppSizedBox.sizedH25,

            // Detailed description text, split into individual fade transitions for each line
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

            Spacer(),

            // Fade transition for the button
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, Privacy_3());
                },
                text: "I Understand",
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
