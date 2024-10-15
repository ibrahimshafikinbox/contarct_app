// import 'package:client_project/Core/navigation_helper.dart';
// import 'package:client_project/Feature/Create_account/Cubit/create_cubit.dart';
// import 'package:client_project/Feature/Create_account/Cubit/create_state.dart';
// import 'package:client_project/Feature/Login/widget/app_button.dart';
// import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:client_project/Feature/resources/styles/app_text_style.dart';
// import 'package:client_project/Feature/Login/View/login_view.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class CreateAccountView extends StatefulWidget {
//   const CreateAccountView({super.key});

//   @override
//   State<CreateAccountView> createState() => _CreateAccountViewState();
// }

// class _CreateAccountViewState extends State<CreateAccountView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController secondNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController businessNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CreateAccountCubit(),
//       child: Scaffold(
//         body: BlocListener<CreateAccountCubit, CreateAccountState>(
//           listener: (context, state) {
//             if (state is CreateAccountSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text("Account created successfully!"),
//                 backgroundColor: Colors.green,
//               ));
//             } else if (state is CreateAccountFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text(state.errorMessage),
//                 backgroundColor: Colors.red,
//               ));
//             }
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formKey, // Add the form key
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppSizedBox.sizedH20,
//                     const Center(
//                       child: Text(
//                         "Create Account",
//                         style: AppTextStyle.textStyleBoldBlack20,
//                       ),
//                     ),
//                     AppSizedBox.sizedH10,
//                     Text(
//                       "Your First Name",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: firstNameController,
//                       type: TextInputType.text,
//                       hint: 'First name',
//                       isPassword: false,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your first name';
//                         }
//                         return null;
//                       },
//                       label: 'First Name',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Your Second Name",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: secondNameController,
//                       type: TextInputType.text,
//                       hint: 'Second name',
//                       isPassword: false,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your second name';
//                         }
//                         return null;
//                       },
//                       label: 'Second Name',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Where You Live?",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: locationController,
//                       type: TextInputType.text,
//                       hint: 'Location',
//                       isPassword: false,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your location';
//                         }
//                         return null;
//                       },
//                       label: 'Location',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Business Name (optional)",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: businessNameController,
//                       type: TextInputType.text,
//                       hint: 'Business Name',
//                       isPassword: false,
//                       onValidate: (String? value) {
//                         return null;
//                       },
//                       label: 'Business Name',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Add Your Email",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: emailController,
//                       type: TextInputType.emailAddress,
//                       hint: 'user@gmail.com',
//                       isPassword: false,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                       label: 'Email',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Add Your Password",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: passwordController,
//                       type: TextInputType.visiblePassword,
//                       hint: 'Password',
//                       isPassword: true,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                       label: 'Password',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH15,
//                     Text(
//                       "Confirm Your Password",
//                       style: AppTextStyle.textStyleBoldBlack,
//                     ),
//                     AppSizedBox.sizedH10,
//                     DefaultFormField(
//                       controller: confirmPasswordController,
//                       type: TextInputType.visiblePassword,
//                       hint: 'Password',
//                       isPassword: true,
//                       onValidate: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password confirmation';
//                         }
//                         return null;
//                       },
//                       label: 'Confirm Password',
//                       maxlines: 1,
//                     ),
//                     AppSizedBox.sizedH20,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("have acccount ? "),
//                         AppSizedBox.sizedW15,
//                         TextButton(
//                           onPressed: () {
//                             navigateAndFinish(context, LoginView());
//                           },
//                           child: Text("Login"),
//                         )
//                       ],
//                     ),
//                     AppSizedBox.sizedH15,
//                     BlocBuilder<CreateAccountCubit, CreateAccountState>(
//                       builder: (context, state) {
//                         if (state is CreateAccountLoading) {
//                           return Center(child: CircularProgressIndicator());
//                         }
//                         return DefaultButton(
//                           function: () {
//                             // Validate the form before sending the request
//                             if (_formKey.currentState!.validate()) {
//                               // Ensure passwords match
//                               if (passwordController.text !=
//                                   confirmPasswordController.text) {
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(SnackBar(
//                                   content: Text('Passwords do not match'),
//                                   backgroundColor: Colors.red,
//                                 ));
//                                 return;
//                               }

//                               // Proceed with account creation
//                               context.read<CreateAccountCubit>().createAccount(
//                                     firstName: firstNameController.text,
//                                     secondName: secondNameController.text,
//                                     email: emailController.text,
//                                     password: passwordController.text,
//                                     location: locationController.text,
//                                     businessName:
//                                         businessNameController.text.isNotEmpty
//                                             ? businessNameController.text
//                                             : null,
//                                   );
//                             }
//                           },
//                           text: "              Sign Up              ",
//                           textColor: AppColors.white,
//                           bottonColor: AppColors.green,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Create_account/Cubit/create_cubit.dart';
import 'package:client_project/Feature/Create_account/Cubit/create_state.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:client_project/Feature/Login/View/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController businessNameController = TextEditingController();

  String? selectedRole; // متغير لتخزين الدور المحدد

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateAccountCubit(),
      child: Scaffold(
        body: BlocListener<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Account created successfully!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is CreateAccountFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
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

                    // خيارات تحديد الدور
                    // Text(
                    //   "Choose your role:",
                    //   style: AppTextStyle.textStyleBoldBlack,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Radio<String>(
                    //       value: 'lawyer',
                    //       groupValue: selectedRole,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           selectedRole = value;
                    //         });
                    //       },
                    //     ),
                    //     Text("Lawyer"),
                    //     Radio<String>(
                    //       value: 'user',
                    //       groupValue: selectedRole,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           selectedRole = value;
                    //         });
                    //       },
                    //     ),
                    //     Text("User"),
                    //   ],
                    // ),

                    // AppSizedBox.sizedH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? "),
                        AppSizedBox.sizedW15,
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(context, LoginView());
                          },
                          child: Text("Login"),
                        )
                      ],
                    ),
                    AppSizedBox.sizedH15,
                    BlocBuilder<CreateAccountCubit, CreateAccountState>(
                      builder: (context, state) {
                        if (state is CreateAccountLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return DefaultButton(
                          function: () {
                            // Validate the form before sending the request
                            if (_formKey.currentState!.validate()) {
                              // Ensure passwords match
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Passwords do not match'),
                                  backgroundColor: Colors.red,
                                ));
                                return;
                              }

                              // Proceed with account creation
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
                                    isLawyer:
                                        selectedRole == 'lawyer', // إضافة الدور
                                  );
                            }
                          },
                          text: "              Sign Up              ",
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
      ),
    );
  }
}
