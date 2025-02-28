// import 'package:client_project/Core/Helper/navigation_helper.dart';
// import 'package:client_project/Feature/Contracts/view/contract_details.dart';
// import 'package:client_project/Feature/Login/widget/app_button.dart';
// import 'package:client_project/Feature/online_payment/widget/payment_build_row.dart';
// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:client_project/Feature/online_payment/cubit/payment_cubit.dart';
// import 'package:client_project/Feature/online_payment/cubit/payment_state.dart';

// class PaymentView extends StatelessWidget {
//   final int amount;
//   final int pageCount;

//   final String currency;

//   const PaymentView({
//     Key? key,
//     required this.amount,
//     required this.currency,
//     required this.pageCount,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PaymentCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.navigate_before),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: const Text("Payment"),
//           centerTitle: true,
//         ),
//         body: BlocConsumer<PaymentCubit, PaymentState>(
//           listener: (context, state) {
//             if (state is PaymentSuccess) {
//               // عرض نافذة منبثقة عند نجاح الدفع
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text("Payment Successful"),
//                   content: Text("Transaction ID: ${state.transactionId}"),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text("OK"),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is PaymentFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("Payment Failed: ${state.error}"),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             }
//           },
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 children: [
//                   const SizedBox(height: 15),
//                   const Text(
//                     "Coupon",
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: AppColors.black),
//                           borderRadius: BorderRadius.circular(12),
//                           color: AppColors.white,
//                         ),
//                         child: TextField(
//                           textAlign: TextAlign.center, // Center the text

//                           decoration: InputDecoration(
//                             hintStyle: TextStyle(color: AppColors.black),
//                             hintText: 'First Order',
//                             border: InputBorder.none,
//                             filled: false,
//                             isDense: true,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.green),
//                     onPressed: () {},
//                     child: const Text("تطبيق الكوبون"),
//                   ),
//                   const SizedBox(height: 15),
//                   const Text(
//                     "Payment method",
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
//                   ),
//                   const SizedBox(height: 10),
//                   PaymentButton(
//                     function: () {
//                       context.read<PaymentCubit>().processPayment(
//                             amount: amount,
//                             currency: currency,
//                           );
//                     },
//                     textColor: AppColors.black,
//                     bottonColor: AppColors.white,
//                     text: "Credit Card",
//                     icon: Icons.credit_card,
//                   ),
//                   const SizedBox(height: 15),
//                   const SizedBox(height: 20),
//                   paymentBuildRow(text: 'Subtotal', value: '$amount\$'),
//                   const SizedBox(height: 10),
//                   paymentBuildRow(text: 'Credit Card Fee', value: '5\$'),
//                   const SizedBox(height: 10),
//                   paymentBuildRow(text: 'Total', value: '${amount + 5}\$'),
//                   const SizedBox(height: 20),
//                   state is PaymentSuccess
//                       ? ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.green),
//                           onPressed: () {
//                             navigateAndFinish(
//                               context,
//                               ContractDetails(
//                                 filePageCount: pageCount,
//                                 amount: amount,
//                               ),
//                             );
//                           },
//                           child: Text("Confirm Payment"),
//                         )
//                       : SizedBox()
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_details.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/online_payment/cubit/payment_state.dart';
import 'package:client_project/Feature/online_payment/widget/payment_build_row.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client_project/Feature/online_payment/cubit/payment_cubit.dart';

class PaymentView extends StatelessWidget {
  final int amount;
  final int pageCount;
  final String currency;

  const PaymentView({
    Key? key,
    required this.amount,
    required this.currency,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final couponController = TextEditingController();

    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Payment"),
          centerTitle: true,
        ),
        body: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Payment Successful"),
                  content: Text("Transaction ID: ${state.transactionId}"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Payment Failed: ${state.error}"),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is PaymentCouponInvalid) {
              // Show invalid coupon SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Invalid or expired coupon code."),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is PaymentCouponValid) {
              // Show invalid coupon SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("cuppon apllied successfully"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<PaymentCubit>();
            final discount = cubit.discount;
            final finalAmount = amount - (amount * discount ~/ 100);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "Coupon",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white,
                        ),
                        child: TextField(
                          controller: couponController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.black),
                            hintText: 'Enter Coupon Code',
                            border: InputBorder.none,
                            filled: false,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green),
                    onPressed: () {
                      cubit.checkCoupon(couponController.text);
                    },
                    child: const Text("Apply Coupon"),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Payment method",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  PaymentButton(
                    function: () {
                      cubit.processPayment(
                        amount: finalAmount,
                        currency: currency,
                      );
                    },
                    textColor: AppColors.black,
                    bottonColor: AppColors.white,
                    text: "Credit Card",
                    icon: Icons.credit_card,
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 20),
                  paymentBuildRow(text: 'Subtotal', value: '$amount\$'),
                  const SizedBox(height: 10),
                  paymentBuildRow(text: 'Credit Card Fee', value: '5\$'),
                  const SizedBox(height: 10),
                  paymentBuildRow(text: 'Discount', value: '${discount}%'),
                  const SizedBox(height: 10),
                  paymentBuildRow(text: 'Total', value: '${finalAmount + 5}\$'),
                  const SizedBox(height: 20),
                  state is PaymentSuccess
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green),
                          onPressed: () {
                            navigateAndFinish(
                              context,
                              ContractDetails(
                                filePageCount: pageCount,
                                amount: finalAmount,
                              ),
                            );
                          },
                          child: Text("Confirm Payment"),
                        )
                      : SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
