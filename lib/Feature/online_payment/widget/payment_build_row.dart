import 'dart:ffi';

import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class paymentBuildRow extends StatefulWidget {
  const paymentBuildRow({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);
  final String text;
  final String value;

  @override
  State<paymentBuildRow> createState() => _paymentBuildRowState();
}

class _paymentBuildRowState extends State<paymentBuildRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style: AppTextStyle.textStyleMediumAppBlack,
        ),
        Spacer(),
        Text(
          widget.value,
          style: AppTextStyle.textStyleMediumGray,
        ),
      ],
    );
  }
}
