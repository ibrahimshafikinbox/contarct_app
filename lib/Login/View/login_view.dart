import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Forgot_Password/view/forgot_view.dart';
import 'package:client_project/Login/cubit/login_cubit.dart';
import 'package:client_project/Login/cubit/login_state.dart';
import 'package:client_project/Login/widget/app_button.dart';
import 'package:client_project/Login/widget/default_form_filed.dart';
import 'package:client_project/pages/understand_contaract._1.dart';
import 'package:client_project/resources/colors/colors.dart';
import 'package:client_project/resources/styles/app_sized_box.dart';
import 'package:client_project/resources/styles/app_text_style.dart';
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
              navigateTo(context, ScreenSplash_1());
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
                          Image.asset("assets/img/contract_logo.jpg"),
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
                      AppSizedBox.sizedH20,
                      TextButton(
                        onPressed: () {
                          navigateTo(context, ForgotPassView());
                        },
                        child: Text("Forgot Password ?"),
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
                          text: isRegisterMode ? "Register" : "Login",
                          textColor: AppColors.white,
                          bottonColor: AppColors.green,
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      AppSizedBox.sizedH20,
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isRegisterMode = !isRegisterMode;
                            });
                          },
                          child: Text(
                            isRegisterMode
                                ? 'Already have an account? Login'
                                : 'Create a new account',
                            style: AppTextStyle.textStyleBoldBlack
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
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
