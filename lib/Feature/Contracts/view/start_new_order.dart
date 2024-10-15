// import 'package:client_project/Core/navigation_helper.dart';
// import 'package:client_project/Feature/Contracts/view/contract_details.dart';

// import 'package:client_project/Feature/Login/widget/app_button.dart';

// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:client_project/Feature/resources/styles/app_text_style.dart';
// import 'package:flutter/material.dart';

// class StartNewOrrderView extends StatelessWidget {
//   const StartNewOrrderView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFDFFFD7),
//       body: ListView(
//         children: [
//           AppSizedBox.sizedH10,
//           Center(
//               child: Image.asset(
//             "assets/img/Group 12.png",
//             height: 300,
//           )),
//           AppSizedBox.sizedH15,
//           Container(
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: AppColors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   AppSizedBox.sizedH10,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       AppSizedBox.sizedW50,
//                       const Text(
//                         "Start a New Order",
//                         style: AppTextStyle.textStyleBoldBlack25,
//                       ),
//                       AppSizedBox.sizedW50,
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Color(0XFFFFFFFF),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.share_outlined)),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     "Start a new order to review your contract, give you redline suggestions for edits, answer your questions and help you achieve your goals.",
//                     style: TextStyle(color: Color(0XFF707070)),
//                   ),
//                   AppSizedBox.sizedH10,
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Order description",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: AppColors.green,
//                           )),
//                       Text("Details",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                           )),
//                       Text("Review",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                           ))
//                     ],
//                   ),
//                   AppSizedBox.sizedH15,
//                   Text(
//                     "A legal professional (a real person) will review the contract and get it back to you.",
//                     style: TextStyle(color: Color(0XFF707070)),
//                   ),
//                   AppSizedBox.sizedH15,
//                   Row(
//                     children: [
//                       const Text(
//                         "Contract Number of Pages",
//                         style: AppTextStyle.textStyleBoldBlack,
//                       ),
//                       AppSizedBox.sizedW50,
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Color(0XFFF4F4F4),
//                             borderRadius: BorderRadius.circular(25)),
//                         child: Center(
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.minimize)),
//                         ),
//                       ),
//                       AppSizedBox.sizedW15,
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Color(0XFFF4F4F4),
//                             borderRadius: BorderRadius.circular(25)),
//                         child: Center(
//                           child: IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.add)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         AppSizedBox.sizedW20,
//                         Column(
//                           children: [
//                             Text(
//                               "\$200 ",
//                               style: TextStyle(
//                                   color: AppColors.green,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             AppSizedBox.sizedH10,
//                             Text("1-5 Pages")
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               "\$350 ",
//                               style: TextStyle(
//                                   color: AppColors.green,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             AppSizedBox.sizedH10,
//                             Text("5-20 Pages ")
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               "\$500 ",
//                               style: TextStyle(
//                                   color: AppColors.green,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             AppSizedBox.sizedH10,
//                             Text("20+ Pages")
//                           ],
//                         ),
//                         AppSizedBox.sizedW20,
//                       ]),
//                   AppSizedBox.sizedH30,
//                   Material(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Color(0XFFFFFFFF),
//                     elevation: 3,
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: 60,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: AppColors.gray)),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.shopping_cart_outlined,
//                                   color: AppColors.green,
//                                 ),
//                               )),
//                           AppSizedBox.sizedW20,
//                           DefaultButton(
//                               function: () {
//                                 navigateTo(context, ContractDetails());
//                               },
//                               text: "Next",
//                               textColor: AppColors.white,
//                               bottonColor: AppColors.green),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:client_project/Core/navigation_helper.dart';
import 'package:client_project/Feature/Contracts/view/contract_details.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class StartNewOrderView extends StatefulWidget {
  const StartNewOrderView({super.key});

  @override
  _StartNewOrderViewState createState() => _StartNewOrderViewState();
}

class _StartNewOrderViewState extends State<StartNewOrderView> {
  int _pageCount = 1;
  double _price = 200;

  // Method to update the price based on the number of pages
  void _updatePrice() {
    setState(() {
      if (_pageCount <= 5) {
        _price = 200;
      } else if (_pageCount <= 20) {
        _price = 350;
      } else {
        _price = 500;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFDFFFD7),
      body: ListView(
        children: [
          AppSizedBox.sizedH10,
          Center(
              child: Image.asset(
            "assets/img/Group 12.png",
            height: 300,
          )),
          AppSizedBox.sizedH15,
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  AppSizedBox.sizedH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizedBox.sizedW50,
                      const Text(
                        "Start a New Order",
                        style: AppTextStyle.textStyleBoldBlack25,
                      ),
                      AppSizedBox.sizedW50,
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined)),
                      ),
                    ],
                  ),
                  Text(
                    "Start a new order to review your contract, give you redline suggestions for edits, answer your questions and help you achieve your goals.",
                    style: TextStyle(color: Color(0XFF707070)),
                  ),
                  AppSizedBox.sizedH10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order description",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.green,
                          )),
                      Text("Details",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      Text("Review",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    ],
                  ),
                  AppSizedBox.sizedH15,
                  Text(
                    "A legal professional (a real person) will review the contract and get it back to you.",
                    style: TextStyle(color: Color(0XFF707070)),
                  ),
                  AppSizedBox.sizedH15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Contract Number of Pages",
                        style: AppTextStyle.textStyleBoldBlack,
                      ),
                      AppSizedBox.sizedW15,
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFF4F4F4),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_pageCount > 1) {
                                    _pageCount--;
                                    _updatePrice();
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              _pageCount.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFF4F4F4),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _pageCount++;
                                  _updatePrice();
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSizedBox.sizedH20,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("1-5 Pages"),
                      Text("5-20 Pages"),
                      Text("20+ Pages"),
                    ],
                  ),
                  AppSizedBox.sizedH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${_price}",
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  AppSizedBox.sizedH30,
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFFFFFFF),
                    elevation: 3,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.gray),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                          AppSizedBox.sizedW20,
                          DefaultButton(
                            function: () {
                              navigateTo(context, ContractDetails());
                            },
                            text: "Next",
                            textColor: AppColors.white,
                            bottonColor: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
