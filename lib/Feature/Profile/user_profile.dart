import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Profile/cubit/profile_state.dart';
import 'package:client_project/Feature/Profile/cubit/profile_cubit.dart';
import 'package:client_project/Feature/Profile/edit_profile.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileCubit>().fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<UserProfileCubit>().fetchUserData();
          },
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       navigateTo(context, CheckoutPage());
          //     },
          //     icon: Icon(Icons.payment)),
          TextButton(
            onPressed: () {
              navigateTo(context, const EditProfielView());
            },
            child: const Text(
              "Edit Account ",
              style: AppTextStyle.textStyleRegularBlack,
            ),
          )
        ],
        title: const Text(
          "My Account ",
          style: AppTextStyle.textStyleBoldBlack,
        ),
      ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return Column(
              children: [
                const Skeletonizer(
                    child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromARGB(255, 247, 245, 245),
                )),
                AppSizedBox.sizedH50,
                Skeletonizer(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 245, 245),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is UserProfileLoaded) {
            final userData = state.userData;

            return Column(
              children: [
                Center(
                  child: Image.asset("assets/img/Group 1.png"),
                ),
                AppSizedBox.sizedH15,
                AccountBuildContainer(
                  netWorkText: userData['firstName'] ?? '',
                  text: "Name : ",
                ),
                AccountBuildContainer(
                  netWorkText: userData['phone_number'] ?? '',
                  text: "Phone number : ",
                ),
                AccountBuildContainer(
                  netWorkText: userData['email'] ?? '',
                  text: "Email : ",
                ),
                // AccountBuildContainer(
                //   netWorkText: userData['dateOfBirth'] ?? '',
                //   text: "Date of birth : ",
                // ),
                // AccountBuildContainer(
                //   netWorkText: userData['gender'] ?? '',
                //   text: "Sex : ",
                // ),
                AccountBuildContainer(
                  netWorkText: userData['address'] ?? '',
                  text: "Address: ",
                ),
              ],
            );
          } else if (state is UserProfileError) {
            return Center(child: Text("There are error "));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

class AccountBuildContainer extends StatelessWidget {
  final String text;
  final String netWorkText;

  const AccountBuildContainer(
      {super.key, required this.text, required this.netWorkText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xffEEEDED),
        ),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                text,
                style: AppTextStyle.textStyleMediumGray18,
              ),
              const Spacer(),
              Text(
                netWorkText.isNotEmpty ? netWorkText : '',
                style: AppTextStyle.textStyleMediumBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
