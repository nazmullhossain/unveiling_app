import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



import '../controller/signup_controller.dart';

class StripePaymentPage extends StatefulWidget {
  const StripePaymentPage({super.key});

  @override
  State<StripePaymentPage> createState() => _StripePaymentPageState();
}

class _StripePaymentPageState extends State<StripePaymentPage> {
  // var obj = PaymentController();
  final controller = Get.put(SignUpController());
  Map<String, dynamic>? paymentIntent;
  Map<String, dynamic>? paymentIntent2;

  void makePayment() async {
    // String id =randomAlphaNumeric(10);

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
      print("paymentIntent${paymentIntent!}");
    } catch (e) {
      print(e.toString());
    }
  }
  void makePayment2() async {
    // String id =randomAlphaNumeric(10);

    try {
      paymentIntent2 = await createPaymentIntent2();

      var gpay = PaymentSheetGooglePay(
        merchantCountryCode: "US",
        currencyCode: "US",
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent2!["client_secret"],
              style: ThemeMode.dark,
              merchantDisplayName: "nazmul",
              googlePay: gpay));
      displayPaymentSheet2();
      print("paymentIntent${paymentIntent2!}");
    } catch (e) {
      print(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Map<String, dynamic> data = {
        "ispayment": true,
        "monthTime":DateTime.now()
      };

      if (paymentIntent!["status"] == "requires_payment_method") {
        await controller.updateEm("${token}", data);
      }
      print("scusssssssss${paymentIntent!["payment_method_data"]}");
      print("done");
    } catch (e) {
      print("failed ${e.toString()}");
    }
  }
  displayPaymentSheet2() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Map<String, dynamic> data = {
        "ispayment": true,
        "yearTime":DateTime.now()
      };

      if (paymentIntent2!["status"] == "requires_payment_method") {
        await controller.updateEm("${token}", data);
      }
      print("scusssssssss${paymentIntent2!["payment_method_data"]}");
      print("done");
    } catch (e) {
      print("failed ${e.toString()}");
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": "700", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
            "Bearer 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",
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("resopnse data ${response.body}");

      print("data res ${response.body}");
      // Get.to(ResPage(body: response.body));

      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
  createPaymentIntent2() async {
    try {
      Map<String, dynamic> body = {"amount": "5000", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
            "Bearer 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",
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("resopnse data ${response.body}");

      print("data res ${response.body}");
      // Get.to(ResPage(body: response.body));

      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
  String token = "";

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token') ?? "";
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor:Color(0xff003300),
        centerTitle: true,
        title:   Text(
          "Payment",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle:FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: Container(
        color:Color(0xff003300),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(

              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textAlign: TextAlign.center,"which payment will you select? Please touch.",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        makePayment();
                        Fluttertoast.showToast(
                            msg:
                            "Wait few moment",
                            toastLength: Toast
                                .LENGTH_SHORT,
                            gravity:
                            ToastGravity
                                .CENTER,
                            timeInSecForIosWeb:
                            1,
                            backgroundColor:
                            Colors.red,
                            textColor:
                            Colors.white,
                            fontSize: 16.0);

              }
                  ,    child: Container(

                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color:Color(0xff003300),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Monthly",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("💲7",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Fluttertoast.showToast(
                            msg:
                            "Wait few moment",
                            toastLength: Toast
                                .LENGTH_SHORT,
                            gravity:
                            ToastGravity
                                .CENTER,
                            timeInSecForIosWeb:
                            1,
                            backgroundColor:
                            Colors.red,
                            textColor:
                            Colors.white,
                            fontSize: 16.0);
                        makePayment2();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color:Color(0xff003300),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("yearly",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("💲50",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(textAlign: TextAlign.center,"Get disscount for Yearly",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
