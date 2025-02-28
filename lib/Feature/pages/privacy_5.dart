import 'package:flutter/material.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/done_page.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';

class Privacy_5 extends StatefulWidget {
  const Privacy_5({Key? key}) : super(key: key);

  @override
  _Privacy_5State createState() => _Privacy_5State();
}

class _Privacy_5State extends State<Privacy_5> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "Not the delicious kind. These cookies are used to personalize your user experience, including authentication, tracking orders, marketing, and usage.\n\n"
        "A screen will pop up, allowing you to select the settings you want.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Create fade animations for each line of text
    _fadeAnimations = [
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0, 1, curve: Curves.easeIn),
        ),
      ),
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 1, curve: Curves.easeIn),
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
      // backgroundColor: AppColors.background, // Uncomment and set a relevant color if needed
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH40,
            // Headline text with fade transition
            const Text(
              "Obligatory cookie acknowledgement.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            AppSizedBox.sizedH25,
            // Fade transition for text lines
            FadeTransition(
              opacity: _fadeAnimations[0],
              child: const Text(
                "Not the delicious kind. These cookies are used to personalize your user experience, including authentication, tracking orders, marketing, and usage.\n\n"
                "A screen will pop up, allowing you to select the settings you want.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  height: 1.5, // Line height for readability
                ),
              ),
            ),
            AppSizedBox.sizedH100,
            // Fade transition for the button
            FadeTransition(
              opacity: _fadeAnimations[1],
              child: DefaultButton(
                function: () {
                  navigateTo(context, DonePage());
                },
                text: "Cookie Settings",
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
