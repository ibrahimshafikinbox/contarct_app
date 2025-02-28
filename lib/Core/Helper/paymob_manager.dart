import 'package:client_project/Core/Helper/constants.dart';
import 'package:dio/dio.dart';

class PaymobManager {
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authanticationToken = await _getAuthanticationToken();

      int orderId = await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await _getPaymentKey(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      return paymentKey;
    } catch (e) {
      print("Exc==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getAuthanticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key": Constants.apiKey,
    });
    print("==========================================");
    print(response.data);

    print(response.data["token"]);
    print("==========================================");

    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authanticationToken,
      "amount_cents": amount, //  >>(STRING)<<
      "currency": currency, //Not Req
      "delivery_needed": "false",
      "items": [],
    });
    return response.data["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "expiration": 3600,
          "auth_token": authanticationToken,
          "order_id": orderId,
          "integration_id": 4893950,
          "amount_cents": amount,
          "currency": currency,
          "billing_data": {
            "first_name": "Clifford",
            "last_name": "Nicolas",
            "email": "claudette09@exa.com",
            "phone_number": "+86(8)9135210487",
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA"
          },
        },
      );
      print("Payment Key Response: ${response.data}");
      return response.data["token"];
    } catch (e) {
      print("Error in _getPaymentKey: $e");
      if (e is DioError && e.response != null) {
        print("Dio Error Response: ${e.response?.data}");
      }
      rethrow;
    }
  }
}
