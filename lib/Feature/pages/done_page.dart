// import 'package:client_project/Core/Helper/navigation_helper.dart';
// import 'package:client_project/Feature/Contracts/view/contract_home.dart';
// import 'package:client_project/Feature/Login/View/login_view.dart';

// import 'package:client_project/Feature/Login/widget/app_button.dart';

// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';

// import 'package:flutter/material.dart';

// class DonePage extends StatelessWidget {
//   const DonePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             AppSizedBox.sizedH50,
//             const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Done!",
//                   style: TextStyle(
//                     fontSize: 28.0, // Adjust the font size as needed
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "Now you can start uploading your contract.",
//                   style: TextStyle(
//                     fontSize: 28.0, // Adjust the font size as needed
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             AppSizedBox.sizedH50,
//             Image.asset("assets/img/Rectangle 1.png"),
//             AppSizedBox.sizedH50,
//             DefaultButton(
//                 function: () {
//                   navigateAndFinish(context, LoginView());
//                 },
//                 text: "Let's go!",
//                 textColor: AppColors.white,
//                 bottonColor: AppColors.green)
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:flutter/material.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:client_project/Feature/Login/View/login_view.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimationTitle;
  late Animation<double> _fadeAnimationMessage;
  late Animation<double> _fadeAnimationButton;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimationTitle = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationMessage = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _fadeAnimationButton = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
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
            // Fade transition for the title
            FadeTransition(
              opacity: _fadeAnimationTitle,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Done!",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            AppSizedBox.sizedH20,
            // Fade transition for the message
            FadeTransition(
              opacity: _fadeAnimationMessage,
              child: const Text(
                "Now you can start uploading your contract.",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppSizedBox.sizedH50,
            FadeTransition(
              opacity: _fadeAnimationButton,
              child: Image.asset("assets/img/Rectangle 1.png"),
            ),

            AppSizedBox.sizedH50,
            // Fade transition for the button
            FadeTransition(
              opacity: _fadeAnimationButton,
              child: DefaultButton(
                function: () async {
                  await CachePrfHelper.getUid() == null
                      ? navigateAndFinish(context, LoginView())
                      : Fluttertoast.showToast(
                          msg: "you are already logged in !",
                          backgroundColor: AppColors.red);
                },
                text: "Let's go!",
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
