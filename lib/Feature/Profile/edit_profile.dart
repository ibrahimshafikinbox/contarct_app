import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

class EditProfielView extends StatefulWidget {
  const EditProfielView({super.key});

  @override
  State<EditProfielView> createState() => _EditProfielViewState();
}

class _EditProfielViewState extends State<EditProfielView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined),
          onPressed: () {},
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Edit Account ",
                style: AppTextStyle.textStyleRegularBlack,
              ))
        ],
        title: Text(
          "My Account",
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              "Add New Name",
              style: AppTextStyle.textStyleBoldBlack,
            )),
            const Center(
              child: Text(
                "This new name can be used for orders \n       and appear on an invoice",
                style: AppTextStyle.textStyleMediumGray18,
              ),
            ),
            AppSizedBox.sizedH20,
            DefaultFormField(
              controller: nameController,
              type: TextInputType.emailAddress,
              hint: 'name',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a name ';
                }
                return null;
              },
              label: 'name ',
              maxlines: 1,
            ),
            AppSizedBox.sizedH20,
            DefaultFormField(
              controller: phoneController,
              type: TextInputType.emailAddress,
              hint: 'phone ',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid phone ';
                }
                return null;
              },
              label: 'phone',
              maxlines: 1,
            ),
            AppSizedBox.sizedH20,
            DefaultFormField(
              controller: addressController,
              type: TextInputType.emailAddress,
              hint: 'address',
              onValidate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid address';
                }
                return null;
              },
              label: 'address',
              maxlines: 1,
            ),
            AppSizedBox.sizedH50,
            DefaultButton(
                function: () {},
                text: "Confirm and Add New Name",
                textColor: AppColors.white,
                bottonColor: AppColors.green)
          ],
        ),
      ),
    );
  }
}
