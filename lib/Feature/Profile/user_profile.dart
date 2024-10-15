// import 'package:client_project/Feature/Profile/cubit/profile_state.dart';
// import 'package:client_project/Feature/Profile/cubit/profilr_cubit.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:client_project/Feature/resources/styles/app_text_style.dart';

// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UserProfileView extends StatefulWidget {
//   const UserProfileView({super.key});

//   @override
//   State<UserProfileView> createState() => _UserProfileViewState();
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   @override
//   void initState() {
//     super.initState();
//     UserProfileCubit(FirebaseAuth.instance, FirebaseFirestore.instance)
//       ..fetchUserData();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.navigate_before_outlined),
//           onPressed: () {},
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               UserProfileCubit(
//                   FirebaseAuth.instance, FirebaseFirestore.instance)
//                 ..fetchUserData();
//             },
//             child: const Text(
//               "Edit Account ",
//               style: AppTextStyle.textStyleRegularBlack,
//             ),
//           )
//         ],
//         title: const Text(
//           "My Account ",
//           style: AppTextStyle.textStyleBoldBlack,
//         ),
//       ),
//       body: BlocBuilder<UserProfileCubit, UserProfileState>(
//         builder: (context, state) {
//           if (state is UserProfileLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is UserProfileLoaded) {
//             final userData = state.userData;
//             return Column(
//               children: [
//                 Center(
//                   child: Image.asset("assets/img/Group 1.png"),
//                 ),
//                 AppSizedBox.sizedH15,
//                 AccountBuildContainer(
//                   netWorkText: userData['firstName'] ?? '',
//                   text: "Name : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['phoneNumber'] ?? '',
//                   text: "Phone number : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['email'] ?? '',
//                   text: "Email : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['dateOfBirth'] ?? '',
//                   text: "Date of birth : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['gender'] ?? '',
//                   text: "Sex : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['address'] ?? '',
//                   text: "Address: ",
//                 ),
//               ],
//             );
//           } else if (state is UserProfileError) {
//             return Center(child: Text(state.errorMessage));
//           } else {
//             return const Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
// }

// class AccountBuildContainer extends StatelessWidget {
//   final String text;
//   final String netWorkText;

//   const AccountBuildContainer(
//       {super.key, required this.text, required this.netWorkText});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: const Color(0xffEEEDED),
//         ),
//         height: 60,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Text(
//                 text,
//                 style: AppTextStyle.textStyleMediumGray18,
//               ),
//               const Spacer(),
//               Text(
//                 netWorkText,
//                 style: AppTextStyle.textStyleMediumBlack,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Feature/Profile/cubit/profile_state.dart';
import 'package:client_project/Feature/Profile/cubit/profilr_cubit.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // Fetching user data when the screen loads
    context.read<UserProfileCubit>().fetchUserData();
  }

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
            onPressed: () {
              context.read<UserProfileCubit>().fetchUserData();
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
                Skeletonizer(
                    child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.grey,
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
                              color: AppColors.grey,
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
                  netWorkText: userData['phoneNumber'] ?? '',
                  text: "Phone number : ",
                ),
                AccountBuildContainer(
                  netWorkText: userData['email'] ?? '',
                  text: "Email : ",
                ),
                AccountBuildContainer(
                  netWorkText: userData['dateOfBirth'] ?? '',
                  text: "Date of birth : ",
                ),
                AccountBuildContainer(
                  netWorkText: userData['gender'] ?? '',
                  text: "Sex : ",
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:client_project/Feature/Profile/cubit/profile_state.dart';
// import 'package:client_project/Feature/Profile/cubit/profilr_cubit.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:client_project/Feature/resources/styles/app_text_style.dart';

// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:flutter/material.dart';

// class UserProfileView extends StatefulWidget {
//   const UserProfileView({super.key});

//   @override
//   State<UserProfileView> createState() => _UserProfileViewState();
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   @override
//   void initState() {
//     super.initState();
//     UserProfileCubit(FirebaseAuth.instance, FirebaseFirestore.instance)
//       ..fetchUserData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.navigate_before_outlined),
//           onPressed: () {},
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               UserProfileCubit(
//                   FirebaseAuth.instance, FirebaseFirestore.instance)
//                 ..fetchUserData();
//             },
//             child: const Text(
//               "Edit Account",
//               style: AppTextStyle.textStyleRegularBlack,
//             ),
//           )
//         ],
//         title: const Text(
//           "My Account",
//           style: AppTextStyle.textStyleBoldBlack,
//         ),
//       ),
//       body: BlocBuilder<UserProfileCubit, UserProfileState>(
//         builder: (context, state) {
//           if (state is UserProfileLoading) {
//             // استخدم Skeletonizer لعرض هياكل تحميل وهمية
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                   Skeletonizer(
//                       child: SizedBox(
//                     height: 20,
//                     width: MediaQuery.of(context).size.width,
//                   )),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             );
//           } else if (state is UserProfileLoaded) {
//             final userData = state.userData;
//             return Column(
//               children: [
//                 Center(
//                   child: Image.asset("assets/img/Group 1.png"),
//                 ),
//                 AppSizedBox.sizedH15,
//                 AccountBuildContainer(
//                   netWorkText: userData['firstName'] ?? '',
//                   text: "Name : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['phoneNumber'] ?? '',
//                   text: "Phone number : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['email'] ?? '',
//                   text: "Email : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['dateOfBirth'] ?? '',
//                   text: "Date of birth : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['gender'] ?? '',
//                   text: "Sex : ",
//                 ),
//                 AccountBuildContainer(
//                   netWorkText: userData['address'] ?? '',
//                   text: "Address: ",
//                 ),
//               ],
//             );
//           } else if (state is UserProfileError) {
//             return Center(child: Text(""));
//           } else {
//             return const Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
// }

// class AccountBuildContainer extends StatelessWidget {
//   final String text;
//   final String netWorkText;

//   const AccountBuildContainer(
//       {super.key, required this.text, required this.netWorkText});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: const Color(0xffEEEDED),
//         ),
//         height: 60,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Text(
//                 text,
//                 style: AppTextStyle.textStyleMediumGray18,
//               ),
//               const Spacer(),
//               Text(
//                 netWorkText,
//                 style: AppTextStyle.textStyleMediumBlack,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }