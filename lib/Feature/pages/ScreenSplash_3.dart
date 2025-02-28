import 'package:flutter/material.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Create_account/View/create_acc_view.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class ScreenSplash_3 extends StatefulWidget {
  const ScreenSplash_3({Key? key}) : super(key: key);

  @override
  _ScreenSplash_3State createState() => _ScreenSplash_3State();
}

class _ScreenSplash_3State extends State<ScreenSplash_3>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimationText;
  late Animation<double> _fadeAnimationImage;
  late Animation<double> _fadeAnimationButton;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimationText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.4, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationImage = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationButton = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1, curve: Curves.easeIn),
      ),
    );

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizedBox.sizedH50,
            // Fade transition for the text
            FadeTransition(
              opacity: _fadeAnimationText,
              child: const Text(
                "All you have to do is create an account\n"
                "and start a new order.\n",
                style: AppTextStyle.textStyleBoldBlack20,
              ),
            ),
            AppSizedBox.sizedH50,
            // Fade transition for the image
            FadeTransition(
              opacity: _fadeAnimationImage,
              child: Image.asset("assets/img/splash 3.png"),
            ),
            AppSizedBox.sizedH50,
            // Fade transition for the button
            FadeTransition(
              opacity: _fadeAnimationButton,
              child: DefaultButton(
                function: () {
                  navigateAndFinish(context, const CreateAccountView());
                },
                text: "Sign me up!",
                textColor: AppColors.white,
                bottonColor: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
