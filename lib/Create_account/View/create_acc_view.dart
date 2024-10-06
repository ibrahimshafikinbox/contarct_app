// import 'package:client_project/Login/widget/app_button.dart';
// import 'package:client_project/Login/widget/default_form_filed.dart';
// import 'package:client_project/resources/colors/colors.dart';
// import 'package:client_project/resources/styles/app_sized_box.dart';
// import 'package:client_project/resources/styles/app_text_style.dart';
// import 'package:flutter/material.dart';

// class CreateAccountView extends StatefulWidget {
//   const CreateAccountView({super.key});

//   @override
//   State<CreateAccountView> createState() => _CreateAccountViewState();
// }

// class _CreateAccountViewState extends State<CreateAccountView> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   final TextEditingController emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppSizedBox.sizedH20,
//               const Center(
//                 child: Text(
//                   "Create Account ",
//                   style: AppTextStyle.textStyleBoldBlack20,
//                 ),
//               ),
//               AppSizedBox.sizedH10,
//               Text(
//                 "Your First name",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'first name ',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your first name';
//                   }
//                   return null;
//                 },
//                 label: 'first name',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "Your Second name",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'second name',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your second name ';
//                   }
//                   return null;
//                 },
//                 label: 'second name ',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "where You live ? ",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'live loction',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your live loction ';
//                   }
//                   return null;
//                 },
//                 label: 'live loction',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "business name (optinal) ",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'Business Name',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your business name ';
//                   }
//                   return null;
//                 },
//                 label: 'business name',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "add Your Email",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'user@gmail.com',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email ';
//                   }
//                   return null;
//                 },
//                 label: 'email',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "add your password",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'password',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password ';
//                   }
//                   return null;
//                 },
//                 label: 'password',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH15,
//               Text(
//                 "confirm your password",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//               AppSizedBox.sizedH10,
//               DefaultFormField(
//                 controller: emailController,
//                 type: TextInputType.visiblePassword,
//                 hint: 'password',
//                 isPassword: true,
//                 onValidate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password confirmation ';
//                   }
//                   return null;
//                 },
//                 label: 'confirm password',
//                 maxlines: 1,
//               ),
//               AppSizedBox.sizedH20,
//               DefaultButton(
//                   function: () {},
//                   text: "sign Up",
//                   textColor: AppColors.white,
//                   bottonColor: AppColors.green)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Create_account/Cubit/create_cubit.dart';
import 'package:client_project/Create_account/Cubit/create_state.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/Login/widget/default_form_filed.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController businessNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateAccountCubit(),
      child: Scaffold(
        body: BlocListener<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountSuccess) {
              // Show a success message or navigate to another screen
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Account created successfully!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is CreateAccountFailure) {
              // Show an error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizedBox.sizedH20,
                  const Center(
                    child: Text(
                      "Create Account",
                      style: AppTextStyle.textStyleBoldBlack20,
                    ),
                  ),
                  AppSizedBox.sizedH10,
                  Text(
                    "Your First Name",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: firstNameController,
                    type: TextInputType.text,
                    hint: 'First name',
                    isPassword: false,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    label: 'First Name',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Your Second Name",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: secondNameController,
                    type: TextInputType.text,
                    hint: 'Second name',
                    isPassword: false,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your second name';
                      }
                      return null;
                    },
                    label: 'Second Name',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Where You Live?",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: locationController,
                    type: TextInputType.text,
                    hint: 'Location',
                    isPassword: false,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your location';
                      }
                      return null;
                    },
                    label: 'Location',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Business Name (optional)",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: businessNameController,
                    type: TextInputType.text,
                    hint: 'Business Name',
                    isPassword: false,
                    onValidate: (String? value) {
                      return null;
                    },
                    label: 'Business Name',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Add Your Email",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hint: 'user@gmail.com',
                    isPassword: false,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    label: 'Email',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Add Your Password",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    hint: 'Password',
                    isPassword: true,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    label: 'Password',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "Confirm Your Password",
                    style: AppTextStyle.textStyleBoldBlack,
                  ),
                  AppSizedBox.sizedH10,
                  DefaultFormField(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    hint: 'Password',
                    isPassword: true,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password confirmation';
                      }
                      return null;
                    },
                    label: 'Confirm Password',
                    maxlines: 1,
                  ),
                  AppSizedBox.sizedH20,
                  BlocBuilder<CreateAccountCubit, CreateAccountState>(
                    builder: (context, state) {
                      if (state is CreateAccountLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return DefaultButton(
                        function: () {
                          // Call create account when button is pressed
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Passwords do not match'),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }

                          context.read<CreateAccountCubit>().createAccount(
                                firstName: firstNameController.text,
                                secondName: secondNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                location: locationController.text,
                                businessName:
                                    businessNameController.text.isNotEmpty
                                        ? businessNameController.text
                                        : null,
                              );
                        },
                        text: "Sign Up",
                        textColor: AppColors.white,
                        bottonColor: AppColors.green,
                      );
                    },
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
