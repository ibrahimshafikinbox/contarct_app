import 'package:client_project/Core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  int discount = 0; // Store discount percentage

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to check coupon validity
  Future<void> checkCoupon(String code) async {
    emit(PaymentLoading());

    try {
      var querySnapshot = await firestore
          .collection('coupons')
          .where('code', isEqualTo: code)
          .where('isActive', isEqualTo: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var couponData = querySnapshot.docs.first.data();
        Timestamp expiryTimestamp = couponData['expiryDate'];

        if (expiryTimestamp.toDate().isAfter(DateTime.now())) {
          discount = couponData['discount'];
          emit(PaymentCouponValid(discount: discount));
        } else {
          emit(PaymentCouponInvalid());
        }
      } else {
        emit(PaymentCouponInvalid());
      }
    } catch (e) {
      emit(PaymentFailure("Error checking coupon: $e"));
    }
  }

  // Function to process payment
  Future<void> processPayment(
      {required int amount, required String currency}) async {
    emit(PaymentLoading());
    print("🟡 Processing payment of $amount $currency...");

    try {
      // Apply discount if available
      int finalAmount = amount - (amount * discount ~/ 100);
      print("💰 Final amount after discount: $finalAmount");

      // Step 1: Get the payment intent from Stripe
      final paymentIntent = await _createPaymentIntent(finalAmount, currency);
      if (paymentIntent == null) {
        print("🔴 Failed to create payment intent.");
        emit(PaymentFailure("Failed to create payment intent."));
        return;
      }

      print("🟢 Payment Intent Created: ${paymentIntent['id']}");

      // Step 2: Initialize Stripe Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: "Ryc App",
        ),
      );

      print("🟡 Showing Stripe Payment Sheet...");
      await Stripe.instance.presentPaymentSheet();

      // Step 3: Save payment status to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('payment_successful', true);
      await prefs.setString('transaction_id', paymentIntent['id']);

      print("✅ Payment Successful! ID: ${paymentIntent['id']}");
      emit(PaymentSuccess(paymentIntent['id']));
    } catch (e) {
      print("❌ Payment Failed: $e");
      emit(PaymentFailure("Payment failed: $e"));
    }
  }

  // Function to create Stripe payment intent
  Future<Map<String, dynamic>?> _createPaymentIntent(
      int amount, String currency) async {
    try {
      print("🟡 Creating payment intent...");
      var response = await Dio().post(
        "https://api.stripe.com/v1/payment_intents",
        data: {
          "amount": amount * 100, // Convert to cents
          "currency": currency,
          "payment_method_types[]": "card",
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppConstants.strip_secret}",

            // "Bearer sk_test_51QrfjURburLuZYWYTswmqFpfH926GOXnkdDuLoMJyyf2OVxJ0GTAwknSz6PCr2b88NSr6tHe2x2V03hpoJqL4MU800w5w48qHw",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      print("🟢 Payment Intent Response: ${response.data}");
      return response.data;
    } catch (e) {
      print("🔴 Error creating payment intent: $e");
      return null;
    }
  }
}
// convert to lawer acc 
// how send notification
// how change price

// firebase acount 
// Stripe acount
// soource code
//apk file
// aab file 
