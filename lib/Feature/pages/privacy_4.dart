import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/privacy_5.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class Privacy_4 extends StatefulWidget {
  const Privacy_4({Key? key}) : super(key: key);

  @override
  _Privacy_4State createState() => _Privacy_4State();
}

class _Privacy_4State extends State<Privacy_4> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "Below is the Privacy Policy for the app.\n",
    "Certain terms apply depending on your jurisdiction (meaning the state you reside in within the United States or the country of which you are a citizen).\n",
    "This app protects your information, complies with privacy laws, and will only collect, process, and share your information with strategic partners under the following conditions:\n",
    "- with your consent,\n",
    "- for legal requirements,\n",
    "- or after de-identifying (removing your personal information) the data to analyze it and provide better service(s).",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _fadeAnimations = [
      for (int i = 0; i < _textLines.length; i++)
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(i * 0.2, (i + 1) * 0.2, curve: Curves.easeIn),
          ),
        ),
    ];

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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline text
            FadeTransition(
              opacity: _fadeAnimations[0],
              child: const Text(
                "We keep your privacy \nprotected like treasure in the bottom of the ocean.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            AppSizedBox.sizedH25,

            // Line-by-line fade-in description
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

            // Button
            AppSizedBox.sizedH40,

            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, Privacy_5());
                },
                text: "I Understand",
                textColor: AppColors.white,
                bottonColor: AppColors.green,
              ),
            ),
            AppSizedBox.sizedH40,
          ],
        ),
      ),
    );
  }
}
