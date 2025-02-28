// import 'package:client_project/Core/Helper/navigation_helper.dart';
// import 'package:client_project/Feature/Login/widget/app_button.dart';
// import 'package:client_project/Feature/pages/privacy_4.dart';
// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:flutter/material.dart';

// class Privacy_3 extends StatefulWidget {
//   const Privacy_3({Key? key}) : super(key: key);

//   @override
//   _Privacy_3State createState() => _Privacy_3State();
// }

// class _Privacy_3State extends State<Privacy_3> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late List<Animation<double>> _fadeAnimations;

//   final List<String> _textLines = [
//     "(2) Like other legal services, there is no guarantee of a result. \n",
//     "Whether it is good results, bad results, or helping you grow gills and breath underwater, this app only guarantees that your contract is reviewed by a legal professional. \n",
//     "For the unbundled service of reviewing your contract, any confidential information you provide will only be used and shared with our team to deliver this service.",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5), // Total duration for all animations
//     );

//     // Create fade-in animations for each line, staggering them with intervals
//     _fadeAnimations = [
//       for (int i = 0; i < _textLines.length; i++)
//         Tween<double>(begin: 0, end: 1).animate(
//           CurvedAnimation(
//             parent: _controller,
//             curve: Interval(i * 0.2, (i + 1) * 0.2, curve: Curves.easeIn),
//           ),
//         ),
//     ];

//     _controller.forward(); // Start the animations
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSizedBox.sizedH40,

//             // Headline text with fade animation
//             FadeTransition(
//               opacity: _fadeAnimations[0],
//               child: const Text(
//                 "Here are the important \nthings for you to know.",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//             ),
//             AppSizedBox.sizedH25,

//             // Detailed description text, split into individual fade transitions for each line
//             ..._textLines.asMap().entries.map((entry) {
//               int index = entry.key;
//               String line = entry.value;
//               return FadeTransition(
//                 opacity: _fadeAnimations[index],
//                 child: Text(
//                   line,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.black87,
//                     height: 1.5,
//                   ),
//                 ),
//               );
//             }).toList(),

//             Spacer(),

//             // Animated button that appears last
//             FadeTransition(
//               opacity: _fadeAnimations.last,
//               child: DefaultButton(
//                 function: () {
//                   navigateTo(context, Privacy_4());
//                 },
//                 text: "I Understand",
//                 textColor: AppColors.white,
//                 bottonColor: AppColors.green,
//               ),
//             ),
//             AppSizedBox.sizedH45,
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/privacy_4.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class Privacy_3 extends StatefulWidget {
  const Privacy_3({Key? key}) : super(key: key);

  @override
  _Privacy_3State createState() => _Privacy_3State();
}

class _Privacy_3State extends State<Privacy_3> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<String> _textLines = [
    "(2) Like other legal services, there is no guarantee of a result. \n",
    "Whether it is good results, bad results, or helping you grow gills and breathe underwater, this app only guarantees that your contract is reviewed by a legal professional. \n",
    "For the unbundled service of reviewing your contract, any confidential information you provide will only be used and shared with our team to deliver this service.",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Total duration for all animations
    );

    // Create fade-in animations for each line, staggering them with intervals
    _fadeAnimations = [
      for (int i = 0; i < _textLines.length; i++)
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(i * 0.2, (i + 1) * 0.2, curve: Curves.easeIn),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedH40,

            // Headline text with fade animation
            FadeTransition(
              opacity: _fadeAnimations[0],
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

            // Animated button that appears last
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: DefaultButton(
                function: () {
                  navigateTo(context, Privacy_4());
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
