import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Contracts/view/details.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedOrderView extends StatefulWidget {
  const FinishedOrderView({super.key});

  @override
  State<FinishedOrderView> createState() => _FinishedOrderViewState();
}

class _FinishedOrderViewState extends State<FinishedOrderView> {
  @override
  void initState() {
    super.initState();
    context.read<ContractCubit>().getFinishedOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before_outlined))),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Finished Orders",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Image.asset("assets/img/finished_order.png"),

          // Use BlocBuilder to display contracts dynamically
          BlocBuilder<ContractCubit, ContractState>(
            builder: (context, state) {
              if (state is GetFinisedContractLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetFinisedContractSuccess) {
                final contracts = state.contracts;

                if (contracts.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("No finished contracts at the moment."),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: contracts.length,
                    itemBuilder: (context, index) {
                      var contract = contracts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    "Status: ${contract['status'] ?? 'Unknown'}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: appButtonWithIcon(
                              function: () {
                                // Pass contract details to the InReviewDetails screen
                                navigateTo(context,
                                    ContractDetails(contract: contract));
                              },
                              text: contract['contract_name'] ?? "No Name",
                              textColor: AppColors.black,
                              bottonColor: Colors.white,
                              icon: Icons.navigate_next,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else if (state is GetFinisedContractFailure) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error: ${state.error}'),
                );
              } else {
                return TextButton(
                  onPressed: () {
                    context.read<ContractCubit>().getFinishedOrder();
                  },
                  child: const Text("Try again ! "),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
