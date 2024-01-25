import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;


class StripePaymentPage extends StatefulWidget {
  const StripePaymentPage({super.key});

  @override
  State<StripePaymentPage> createState() => _StripePaymentPageState();
}

class _StripePaymentPageState extends State<StripePaymentPage> {
  // var obj = PaymentController();

  Map<String, dynamic>? paymentIntent;

  void makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      var gpay = PaymentSheetGooglePay(
        merchantCountryCode: "US",
        currencyCode: "US",
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!["client_secret"],
              style: ThemeMode.dark,
              merchantDisplayName: "nazmul",
              googlePay: gpay));
      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("done");
    } catch (e) {
      print("failed ${e.toString()}");
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": "400", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
            "Bearer sk_test_51LP7zrF7MKpA2lzU31v4X6AAxgqxkBEx4RaR8Brey5eUqCM6mf2NpklFuNwwQ4rH9D0MwDt64UZQyJHZYcYzb4PP00D7MCcFuw",
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("resopnse data ${response.body}");
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            makePayment();
          },
          child: Text("Pay"),
        ),
      ),
    );
  }
}