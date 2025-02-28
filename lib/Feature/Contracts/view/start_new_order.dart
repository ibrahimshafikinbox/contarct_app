import 'package:client_project/Core/Helper/navigation_helper.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/online_payment/view/payment_view.dart';
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
  int _pageCount = 0;
  int _price = 0;

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizedBox.sizedW50,
                      Text(
                        "Start a New Order",
                        style: AppTextStyle.textStyleBoldBlack25,
                      ),
                      AppSizedBox.sizedW50,
                    ],
                  ),
                  AppSizedBox.sizedH10,
                  const Text(
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
                  const Text(
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
                                    _updatePrice(); // Update price after decrement
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
                                  _updatePrice(); // Update price after increment
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppSizedBox.sizedW10,
                        Column(
                          children: [
                            Text(
                              "\$200 ",
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            AppSizedBox.sizedH10,
                            Text("1-5 Pages")
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "\$350 ",
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            AppSizedBox.sizedH10,
                            Text("5-20 Pages ")
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "\$500 ",
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            AppSizedBox.sizedH10,
                            Text("20+ Pages")
                          ],
                        ),
                        AppSizedBox.sizedW10,
                      ]),
                  AppSizedBox.sizedH30,
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0XFFFFFFFF),
                    elevation: 3,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultButton(
                            function: () {
                              if (_pageCount >= 1) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Your contract Number is :  $_pageCount',
                                          style:
                                              AppTextStyle.textStyleBoldBlack,
                                        ),
                                        content: Text(
                                          ' your amount is : $_price \$',
                                          style:
                                              AppTextStyle.textStyleBoldBlack,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                PaymentView(
                                                  amount: _price,
                                                  currency: 'usd',
                                                  pageCount: _pageCount,
                                                ),
                                              );
                                            },
                                            child: const Center(
                                                child: Text('Continue')),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('File number required'),
                                      content: const Text(
                                          'Please select a valid number of pages.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            text: "Next",
                            textColor: AppColors.white,
                            bottonColor: AppColors.green,
                          )
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
