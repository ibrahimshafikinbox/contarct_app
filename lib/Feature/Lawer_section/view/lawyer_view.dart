import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Core/widget/drawer.dart';
import 'package:client_project/Feature/Lawer_section/view/new_order_details.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LawyerView extends StatefulWidget {
  const LawyerView({Key? key}) : super(key: key);

  @override
  State<LawyerView> createState() => _LawyerViewState();
}

class _LawyerViewState extends State<LawyerView> {
  Future<Map<String, dynamic>?> _getLawyerData() async {
    try {
      // Get the current user's UID from FirebaseAuth
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'User not logged in';
      }

      // Fetch the lawyer data from Firestore based on UID
      DocumentSnapshot lawyerDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (lawyerDoc.exists) {
        return lawyerDoc.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Error fetching lawyer data: $e');
    }
    return null;
  }

  Stream<QuerySnapshot> _getContractsUnderReview() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw 'User not logged in';
    }
    // Assuming contracts have a field 'lawyerId' and 'status'
    return FirebaseFirestore.instance
        .collection('contracts')
        .where('status',
            isEqualTo: 'Under Review') // Filter by status 'under review'
        .snapshots();
  }

  Stream<QuerySnapshot> _getFinishedContract() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw 'User not logged in';
    }
    // Assuming contracts have a field 'lawyerId' and 'status'
    return FirebaseFirestore.instance
        .collection('contracts')
        .where('status',
            isEqualTo: 'finished') // Filter by status 'under review'
        .snapshots();
  }

  @override
  void initState() {
    super.initState();
    _getLawyerData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        title:
            Text('    lawyer Section', style: AppTextStyle.textStyleBoldBlack),
      ),
      drawer: CustomDrawer(
        lawername: '',
        image: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: _getLawyerData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.green,
                  ));
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading lawyer data'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  var lawyerData = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, ${lawyerData['firstName']}  ${lawyerData['secondName']} \n\n Please review the contracts thoroughly to ensure all terms meet legal standards and compliance requirements.",
                        style: AppTextStyle.textStyleBoldBlack,
                      ),
                      AppSizedBox.sizedH20,
                      const Divider(),
                      const Text(
                        'Contracts Need Your Review :',
                        style: AppTextStyle.textStyleBoldBlack,
                      ),
                      const SizedBox(height: 10),
                      StreamBuilder<QuerySnapshot>(
                        stream: _getContractsUnderReview(),
                        builder: (context, contractSnapshot) {
                          if (contractSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (contractSnapshot.hasError) {
                            return const Center(
                                child: Text('Error loading contracts'));
                          } else if (!contractSnapshot.hasData ||
                              contractSnapshot.data!.docs.isEmpty) {
                            return const Center(
                                child: Text(
                              'No contracts under review',
                              style: AppTextStyle.textStyleSemiBoldRed,
                            ));
                          } else {
                            var contracts = contractSnapshot.data!.docs;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: contracts.length,
                              itemBuilder: (context, index) {
                                var contractData = contracts[index].data()
                                    as Map<String, dynamic>;
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: appButtonWithIcon(
                                      function: () {
                                        navigateTo(
                                          context,
                                          LawyerContractDetails(
                                              contract: contractData),
                                        );
                                      },
                                      text: contractData['contract_name'] ??
                                          'Unnamed Contract',
                                      textColor: AppColors.black,
                                      bottonColor: AppColors.white,
                                      icon: Icons.navigate_next),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
            AppSizedBox.sizedH25,
            const Text("Finished Contract : ",
                style: AppTextStyle.textStyleBoldBlack),
            StreamBuilder<QuerySnapshot>(
              stream: _getFinishedContract(),
              builder: (context, contractSnapshot) {
                if (contractSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (contractSnapshot.hasError) {
                  return const Center(child: Text('Error loading contracts'));
                } else if (!contractSnapshot.hasData ||
                    contractSnapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text(
                    'No finished contract yet',
                    style: AppTextStyle.textStyleSemiBoldRed,
                  ));
                } else {
                  var contracts = contractSnapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: contracts.length,
                    itemBuilder: (context, index) {
                      var contractData =
                          contracts[index].data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FinishedConractButton(
                          function: () {
                            navigateTo(
                              context,
                              LawyerContractDetails(contract: contractData),
                            );
                          },
                          text: contractData['contract_name'] ??
                              'Unnamed Contract',
                          textColor: AppColors.black,
                          bottonColor: AppColors.white,
                          icon: Icons.navigate_next,
                          condition: contractData["status"] == "finished",
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
