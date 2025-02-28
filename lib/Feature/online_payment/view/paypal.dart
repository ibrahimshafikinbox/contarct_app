// // import 'package:client_project/Core/constants/constants.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

// // class CheckoutPage extends StatefulWidget {
// //   const CheckoutPage({super.key});

// //   @override
// //   State<CheckoutPage> createState() => _CheckoutPageState();
// // }

// // class _CheckoutPageState extends State<CheckoutPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "PayPal Checkout",
// //           style: TextStyle(fontSize: 20),
// //         ),
// //       ),
// //       body: Center(
// //         child: TextButton(
// //           onPressed: () async {
// //             // Ensure the note does not exceed 165 characters
// //             String note = "Contact us for any questions on your order.";
// //             if (note.length > 165) {
// //               note = note.substring(0, 165);
// //             }

// //             Navigator.of(context).push(MaterialPageRoute(
// //               builder: (BuildContext context) => PaypalCheckout(
// //                 sandboxMode: true,
// //                 clientId: AppConstants.client_id,
// //                 secretKey: AppConstants.secret_key,
// //                 returnURL: "success.snippetcoder.com",
// //                 cancelURL: "cancel.snippetcoder.com",
// //                 transactions: const [
// //                   {
// //                     "amount": {
// //                       "total": '70',
// //                       "currency": "USD",
// //                       "details": {
// //                         "subtotal": '70',
// //                         "shipping": '0',
// //                         "shipping_discount": 0
// //                       }
// //                     },
// //                     "description": "The payment transaction description.",
// //                     "item_list": {
// //                       "items": [
// //                         {
// //                           "name": "Apple",
// //                           "quantity": 4,
// //                           "price": '5',
// //                           "currency": "USD"
// //                         },
// //                         {
// //                           "name": "Pineapple",
// //                           "quantity": 5,
// //                           "price": '10',
// //                           "currency": "USD"
// //                         }
// //                       ],
// //                     }
// //                   }
// //                 ],
// //                 note: note, // Use the validated note
// //                 onSuccess: (Map params) async {
// //                   print("onSuccess: $params");
// //                 },
// //                 onError: (error) {
// //                   print("onError: $error");
// //                   if (error is Map) {
// //                     print("Error Details: $error");
// //                   }
// //                   Navigator.pop(context);
// //                 },
// //                 onCancel: () {
// //                   print('cancelled:');
// //                 },
// //               ),
// //             ));
// //           },
// //           style: TextButton.styleFrom(
// //             backgroundColor: Colors.teal,
// //             foregroundColor: Colors.white,
// //             shape: const BeveledRectangleBorder(
// //               borderRadius: BorderRadius.all(
// //                 Radius.circular(1),
// //               ),
// //             ),
// //           ),
// //           child: const Text('Checkout'),
// //         ),
// //       ),
// //     );
// //   }

// import 'package:client_project/Feature/online_payment/cubit/payment_cubit.dart';
// import 'package:client_project/Feature/online_payment/cubit/payment_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
// import 'package:pay/pay.dart';
// import 'package:client_project/Core/constants/constants.dart';

// class CheckoutPage extends StatelessWidget {
//   const CheckoutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CheckoutCubit(),
//       child: const _CheckoutView(),
//     );
//   }
// }

// class _CheckoutView extends StatelessWidget {
//   const _CheckoutView();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout Options", style: TextStyle(fontSize: 20)),
//       ),
//       body: BlocListener<CheckoutCubit, CheckoutState>(
//         listener: (context, state) {
//           if (state is PaymentSuccess) {
//             _showPaymentSuccess(context, state.method);
//           } else if (state is PaymentError) {
//             _showPaymentError(context, state.message);
//           }
//         },
//         child: const _PaymentButtons(),
//       ),
//     );
//   }

//   void _showPaymentSuccess(BuildContext context, String method) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Payment Successful'),
//         content: Text('$method payment completed successfully!'),
//         actions: [
//           TextButton(
//             onPressed: Navigator.of(context).pop,
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showPaymentError(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Payment Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: Navigator.of(context).pop,
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _PaymentButtons extends StatelessWidget {
//   const _PaymentButtons();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           _GooglePayButton(),
//           SizedBox(height: 20),
//           _PayPalButton(),
//         ],
//       ),
//     );
//   }
// }

// class _GooglePayButton extends StatelessWidget {
//   const _GooglePayButton();

//   @override
//   Widget build(BuildContext context) {
//     final paymentConfig = PaymentConfiguration.fromJsonString('''
//       {
//         "provider": "google_pay",
//         "data": {
//           "environment": "TEST",
//           "apiKey": "${AppConstants.google_pay_api_key}",
//           "merchantId": "${AppConstants.google_pay_merchant_id}",
//           "merchantName": "Your Store Name",
//           "countryCode": "US",
//           "currencyCode": "USD"
//         }
//       }
//     ''');

//     return GooglePayButton(
//       paymentConfiguration: paymentConfig,
//       paymentItems: const [
//         PaymentItem(
//           label: 'Total',
//           amount: '70',
//           status: PaymentItemStatus.final_price,
//         )
//       ],
//       type: GooglePayButtonType.pay,
//       onPaymentResult: (result) =>
//           context.read<CheckoutCubit>().handleGooglePayResult(result),
//       loadingIndicator: const CircularProgressIndicator(),
//     );
//   }
// }

// class _PayPalButton extends StatelessWidget {
//   const _PayPalButton();

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       icon: const Icon(Icons.payment, size: 24),
//       label: const Text('Checkout with PayPal'),
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.teal,
//       ),
//       onPressed: () => _initiatePayPalPayment(context),
//     );
//   }

//   void _initiatePayPalPayment(BuildContext context) {
//     final cubit = context.read<CheckoutCubit>();

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PaypalCheckout(
//           sandboxMode: true,
//           clientId: AppConstants.client_id,
//           secretKey: AppConstants.secret_key,
//           returnURL: "https://your-return-url.com",
//           cancelURL: "https://your-cancel-url.com",
//           transactions: const [
//             {
//               "amount": {
//                 "total": '70',
//                 "currency": "USD",
//                 "details": {
//                   "subtotal": '70',
//                   "shipping": '0',
//                   "shipping_discount": 0
//                 }
//               },
//               "description": "Payment transaction description",
//               "item_list": {
//                 "items": [
//                   {
//                     "name": "Apple",
//                     "quantity": 4,
//                     "price": '5',
//                     "currency": "USD"
//                   },
//                   {
//                     "name": "Pineapple",
//                     "quantity": 5,
//                     "price": '10',
//                     "currency": "USD"
//                   }
//                 ],
//               }
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (params) {
//              Navigator.pop(context);
//           },
//           onError: (error) {
//             cubit.handlePayPalError(error.toString());
//             Navigator.pop(context);
//           },
//           onCancel: () {
//             cubit.handlePayPalError('Payment cancelled');
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
