import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/Profile/cubit/profile_state.dart';
import 'package:client_project/Feature/Profile/cubit/profile_cubit.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfielView extends StatefulWidget {
  const EditProfielView({super.key});

  @override
  State<EditProfielView> createState() => _EditProfielViewState();
}

class _EditProfielViewState extends State<EditProfielView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Edit Account",
                style: AppTextStyle.textStyleRegularBlack,
              ))
        ],
        title: const Text(
          "My Account",
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: BlocListener<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is EditUserProfileSuccess) {
            // Show success message and navigate back
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully')),
            );
            Navigator.pop(context);
          } else if (state is EditUserProfileError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error ")),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    type: TextInputType.text,
                    hint: 'Name',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    label: 'Name',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH20,
                  DefaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    hint: 'Phone',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                    label: 'Phone',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH20,
                  DefaultFormField(
                    controller: addressController,
                    type: TextInputType.text,
                    hint: 'Address',
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    label: 'Address',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH20,
                  // DropdownButtonFormField<String>(
                  //   focusColor: AppColors.white,
                  //   decoration: const InputDecoration(
                  //       enabledBorder: InputBorder.none,
                  //       border: InputBorder.none),
                  //   borderRadius: BorderRadius.circular(20),
                  //   dropdownColor: AppColors.white,
                  //   value: selectedGender,
                  //   items: const [
                  //     DropdownMenuItem(
                  //       value: "Male",
                  //       child: Text("Male"),
                  //     ),
                  //     DropdownMenuItem(
                  //       value: "Female",
                  //       child: Text("Female"),
                  //     ),
                  //   ],
                  //   hint: const Text("Select Gender"),
                  //   onChanged: (String? value) {
                  //     setState(() {
                  //       selectedGender = value;
                  //     });
                  //   },
                  //   validator: (value) {
                  //     if (value == null) {
                  //       return 'Please select a gender';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  AppSizedBox.sizedH50,
                  DefaultButton(
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UserProfileCubit>().updateUserProfile(
                              firstName: nameController.text,
                              phone: phoneController.text,
                              address: addressController.text,
                              gender: selectedGender.toString(),
                            );
                      }
                    },
                    text: "Confirm and Add New Name",
                    textColor: AppColors.white,
                    bottonColor: AppColors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
