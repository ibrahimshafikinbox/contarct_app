import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Create_account/View/create_acc_view.dart';
import 'package:client_project/Feature/Forgot_Password/view/forgot_view.dart';
import 'package:client_project/Feature/Login/cubit/login_cubit.dart';
import 'package:client_project/Feature/Login/cubit/login_state.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:client_project/main.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
  void initState() {
    super.initState();
    String? uid = CachePrfHelper.getUid();
    debugPrint("🚀UID: $uid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Fluttertoast.showToast(
                  msg: "correct user data ", backgroundColor: AppColors.green);
              navigateTo(
                  context,
                  RoleBasedScreen(
                    uid: CachePrfHelper.getUid(),
                  ));
            } else if (state is LoginError) {
              // Show error message
              Fluttertoast.showToast(
                  msg: "please check you login data ",
                  backgroundColor: AppColors.red);
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
                      AppSizedBox.sizedH10,
                      const Center(
                          child: Text(
                        "sign_in",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      )),
                      AppSizedBox.sizedH20,
                      const Text('Email'),
                      AppSizedBox.sizedH10,
                      DefaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hint: '',
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        label: '',
                        maxlines: 1,
                      ),
                      AppSizedBox.sizedH20,
                      const Text('Password'),
                      AppSizedBox.sizedH10,
                      passwordFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: "",
                        hint: "",
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        prefix: Icons.lock_outline,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return ' enter Your Password';
                          }
                          return null;
                        },
                      ),
                      AppSizedBox.sizedH20,
                      Center(
                        child: TextButton(
                          onPressed: () {
                            navigateTo(context, const ForgotPassView());
                          },
                          child: const Text(
                            "Forgot your password? ",
                            style: AppTextStyle.textStyleMediumGray18,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            navigateAndFinish(
                                context, const CreateAccountView());
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
                        fallback: (context) => const Center(
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
