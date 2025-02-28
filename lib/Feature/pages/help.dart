import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Help & Support",
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How can we help?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "For any issues or questions regarding our Terms of Use, please contact our support team:\n\n"
              "Email: support@lcounsel.com\n\n"
              "Phone: (305) 762-9680\n\n"
              "Business Address: 382 NE 191st St. #36766 Miami, FL 33179, USA",
              style: AppTextStyle.textStyleBoldBlack,
            ),
          ],
        ),
      ),
    );
  }
}
