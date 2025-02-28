import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:client_project/Feature/Contracts/view/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class OrderInReview extends StatefulWidget {
  const OrderInReview({super.key});

  @override
  _OrderInReviewState createState() => _OrderInReviewState();
}

class _OrderInReviewState extends State<OrderInReview> {
  @override
  void initState() {
    super.initState();
    // Fetch contracts when the screen is initialized
    context.read<ContractCubit>().getReviewdOeder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigateAndFinish(context, ContractHomeView());
              },
              icon: const Icon(Icons.navigate_before_outlined))),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Contracts in Review",
              style: AppTextStyle.textStyleBoldBlack25,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset("assets/img/in_review.png"),
          AppSizedBox.sizedH20,
          BlocBuilder<ContractCubit, ContractState>(
            builder: (context, state) {
              if (state is GetReviewdContractLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetReviewedContractSuccess) {
                final contracts = state.contracts;
                if (contracts.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("No contracts under review at the moment."),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: contracts.length,
                    itemBuilder: (context, index) {
                      var contract = contracts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Status: ${contract['status'] ?? 'Unknown'}"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: appButtonWithIcon(
                                function: () {
                                  navigateTo(context,
                                      ContractDetails(contract: contract));
                                },
                                text: contract['contract_name'] ?? "Unknown",
                                textColor: AppColors.black,
                                bottonColor: AppColors.white,
                                icon: Icons.navigate_next,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is GetReviewedContractFailure) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error: ${state.error}'),
                );
              } else {
                return TextButton(
                    onPressed: () {
                      context.read<ContractCubit>().getReviewdOeder();
                    },
                    child: Text("Try again  ! "));
              }
            },
          ),
        ],
      ),
    );
  }
}
