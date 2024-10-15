import 'package:client_project/Feature/Login/widget/app_button.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';

import 'package:flutter/material.dart';

class FinishedOrderView extends StatelessWidget {
  const FinishedOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
              child: Text(
            "Finished Orders",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          )),
          Image.asset("assets/img/finished_order.png"),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 1)",
                textColor: AppColors.black,
                bottonColor: Colors.white,
                icon: Icons.navigate_next),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 2)",
                textColor: AppColors.black,
                bottonColor: Colors.white,
                icon: Icons.navigate_next),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Status: XXXXXX"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appButtonWithIcon(
                function: () {},
                text: "(Contract Name 4 )",
                textColor: AppColors.black,
                bottonColor: Colors.white,
                icon: Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
