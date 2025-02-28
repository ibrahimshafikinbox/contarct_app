import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Create_account/Cubit/create_cubit.dart';
import 'package:client_project/Feature/Create_account/Cubit/create_state.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/pages/Privacy_1.dart';
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

  String? selectedRole;
  List<String> usStates = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming',
  ];
  void _showStateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          TextEditingController searchController = TextEditingController();
          List<String> filteredStates = usStates;

          return Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search states...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredStates = usStates
                          .where((state) =>
                              state.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStates.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(filteredStates[index]),
                      onTap: () {
                        locationController.text = filteredStates[index];
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateAccountCubit(),
      child: Scaffold(
        body: BlocListener<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Account created successfully!"),
                backgroundColor: Colors.green,
              ));
              navigateAndFinish(context, Privacy_1());
            } else if (state is CreateAccountFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("error ,check data "),
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
                    AppSizedBox.sizedH40,
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
                      "Your Last Name",
                      style: AppTextStyle.textStyleBoldBlack,
                    ),
                    AppSizedBox.sizedH10,
                    DefaultFormField(
                      controller: secondNameController,
                      type: TextInputType.text,
                      hint: 'Last Name',
                      isPassword: false,
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      label: 'Last Name',
                      maxlines: 1,
                    ),
                    AppSizedBox.sizedH15,
                    Text(
                      " what state do you reside in ?",
                      style: AppTextStyle.textStyleBoldBlack,
                    ),
                    AppSizedBox.sizedH10,
                    GestureDetector(
                      onTap: () => _showStateBottomSheet(context),
                      child: AbsorbPointer(
                        child: DefaultFormField(
                          controller: locationController,
                          type: TextInputType.text,
                          hint: 'your state',
                          isPassword: false,
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your state';
                            }
                            return null;
                          },
                          label: 'your state',
                          maxlines: 1,
                        ),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? ",
                            style: AppTextStyle.textStyleBoldBlack),
                        AppSizedBox.sizedW15,
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(context, LoginView());
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
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
