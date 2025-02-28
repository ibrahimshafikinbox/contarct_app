import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Contracts/view/order_submited.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class ReviewContract extends StatefulWidget {
  final String contractName;
  final String otherParties;
  final String concerns;
  final String goals;
  final String questions;
  final String additionalInfo;
  final String? contractType;
  final String contractUrl;
  final int filePageCount;
  final int amount;
  const ReviewContract({
    Key? key,
    required this.contractName,
    required this.otherParties,
    required this.concerns,
    required this.goals,
    required this.questions,
    required this.amount,
    required this.additionalInfo,
    this.contractType,
    required this.contractUrl,
    required this.filePageCount,
  }) : super(key: key);

  @override
  State<ReviewContract> createState() => _ReviewContractState();
}

class _ReviewContractState extends State<ReviewContract> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContractCubit(),
      child: BlocConsumer<ContractCubit, ContractState>(
        listener: (context, state) {
          if (state is ContractSuccess) {
            navigateAndFinish(context, const OrderSubmitedView());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  AppSizedBox.sizedH40,
                  Row(
                    children: [
                      const Text(
                        "Review Contract",
                        style: AppTextStyle.textStyleBoldBlack20,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                        ),
                      ),
                    ],
                  ),
                  AppSizedBox.sizedH25,
                  Row(children: [
                    const Text(
                      "Contract Document :   ",
                      style: AppTextStyle.textStyleBoldBlackW400,
                    ),
                    Icon(
                      Icons.description,
                      color: Colors.blue,
                    ),
                    Text(
                      "( ${widget.contractName}.docx )",
                      style: AppTextStyle.textStyleBoldBlackW400,
                    ),
                  ]),

                  AppSizedBox.sizedH10,
                  Row(
                    children: [
                      const Text(
                        "Contract Name :   ",
                        style: AppTextStyle.textStyleBoldBlackW400,
                      ),
                      Text(
                        "( ${widget.contractName} )",
                        style: AppTextStyle.textStyleBoldBlackW400,
                      )
                    ],
                  ),
                  AppSizedBox.sizedH10,
                  Row(
                    children: [
                      const Text(
                        "Contract Type :  ",
                        style: AppTextStyle.textStyleBoldBlackW400,
                      ),
                      Text(
                        "( ${widget.contractType} )",
                        style: AppTextStyle.textStyleBoldBlackW400,
                      )
                    ],
                  ),
                  AppSizedBox.sizedH50,

                  // Other parties in the contract
                  const Text(
                    "1- Who are the other parties in the contract and how are they connected to you?",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  Text(
                    " ( ${widget.otherParties})",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  // Goals
                  const Text(
                    "2 - What are your goals of the contract?",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  Text(
                    " ( ${widget.goals})",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  AppSizedBox.sizedH20,
                  // Questions about the contract
                  const Text(
                    "3 -  What questions do you have about the contract?",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  Text(
                    " ( ${widget.questions})",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  AppSizedBox.sizedH20,
                  const Text(
                    "3 - What are your biggest concerns with the contract?",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  Text(
                    " ( ${widget.concerns})",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  AppSizedBox.sizedH20,
                  // Additional information
                  const Text(
                    "3 - Any additional information you want to add?",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),
                  Text(
                    " ( ${widget.additionalInfo})",
                    style: AppTextStyle.textStyleBoldBlackW400,
                  ),

                  AppSizedBox.sizedH50,

                  BlocConsumer<ContractCubit, ContractState>(
                    listener: (context, state) {
                      if (state is ContractSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Contract submitted successfully!')),
                        );
                      } else if (state is ContractFailure) {
                        print(state.error);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${state.error}')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Material(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0XFFFFFFFF),
                        elevation: 3,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppSizedBox.sizedW20,
                              ConditionalBuilder(
                                condition: state is ContractLoading,
                                builder: (context) =>
                                    const CircularProgressIndicator(),
                                fallback: (context) => DefaultButton(
                                  function: () {
                                    BlocProvider.of<ContractCubit>(context)
                                        .submitContractWithInvoice(
                                      contractName: widget.contractName,
                                      otherParties: widget.otherParties,
                                      concerns: widget.concerns,
                                      goals: widget.goals,
                                      questions: widget.questions,
                                      additionalInfo: widget.additionalInfo,
                                      contractUrl: widget.contractUrl,
                                      contractType: widget.contractType,
                                      pageNumber: widget.filePageCount,
                                      amount: widget.amount,
                                    );
                                  },
                                  text: "  Review My Contract  ",
                                  textColor: AppColors.white,
                                  bottonColor: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
