import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:client_project/Feature/Create_account/View/create_acc_view.dart';
import 'package:client_project/Feature/Forgot_Password/view/forgot_view.dart';
import 'package:client_project/Feature/Login/cubit/login_cubit.dart';
import 'package:client_project/Feature/Login/cubit/login_state.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController =
      TextEditingController(); // For registration
  bool isRegisterMode = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              navigateTo(context, ContractHomeView());
            } else if (state is LoginError) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizedBox.sizedH50,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/Group 1.png"),
                        ],
                      ),
                      AppSizedBox.sizedH20,
                      if (isRegisterMode) Text('Name'),
                      if (isRegisterMode) AppSizedBox.sizedH10,
                      if (isRegisterMode)
                        DefaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          hint: 'Your Name',
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
                      Text('Email'),
                      AppSizedBox.sizedH10,
                      DefaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hint: 'user@gmail.com',
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        label: 'Email',
                        maxlines: 1,
                      ),
                      AppSizedBox.sizedH20,
                      Text('Password'),
                      passwordFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: "password",
                        hint: '********************',
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        prefix: Icons.lock_outline,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '  enter Your Password';
                          }
                          return null;
                        },
                      ),
                      AppSizedBox.sizedH20,
                      Center(
                        child: TextButton(
                          onPressed: () {
                            navigateTo(context, ForgotPassView());
                          },
                          child: Text(
                            "Forgot your password? ",
                            style: AppTextStyle.textStyleMediumGray18,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            navigateAndFinish(context, CreateAccountView());
                          },
                          child: Text(
                            'Create a new account',
                            style: AppTextStyle.textStyleMediumGray18
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoading,
                        builder: (context) => DefaultButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().loginUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            }
                          },
                          text: isRegisterMode
                              ? "        Register        "
                              : "        Login        ",
                          textColor: AppColors.white,
                          bottonColor: AppColors.green,
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      AppSizedBox.sizedH20,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
