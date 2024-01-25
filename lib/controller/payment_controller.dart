import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
class PaymentController{
  Map<String,dynamic>?paymentIntentData;
  Future<void>makePayment({
    required String amount,required String currency
})async{


    try{
      paymentIntentData=await createPaymentIntent(amount,currency);
      if(paymentIntentData !=null){
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters:  SetupPaymentSheetParameters(
              applePay: const PaymentSheetApplePay(merchantCountryCode: ""),
              googlePay: const PaymentSheetGooglePay(merchantCountryCode: ""),
              merchantDisplayName: "Prospects",
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralkey'],

            ));
      }
    }catch(e){
      print(e.toString());
    }

  }

  displayPaymentSheet()async{
    try{
      await Stripe.instance.presentPaymentSheet(

      );
      print("payment sucessfully");
    }on Exception catch(e){
      if(e is StripeException){
        print("error from stripe: ${e.error.localizedMessage}");
      }else{
        print("unforeseen error ${e}");
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  createPaymentIntent(String amoount,String currencry)async{
    try{
      Map<String,dynamic>body={
        'amount':calculateAmount(amoount),
        "currency":currencry,
        "payment_method_types[]":'card',

      };
      var response=await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          'Authorization':"sk_test_51LP7zrF7MKpA2lzU31v4X6AAxgqxkBEx4RaR8Brey5eUqCM6mf2NpklFuNwwQ4rH9D0MwDt64UZQyJHZYcYzb4PP00D7MCcFuw",
          'Content-Type':'application/x-www-form-urlencoded'
        }
      );
      return jsonDecode(response.body);

    }catch(e){
print("err charing user: ${e.toString()}");
    }
  }
  calculateAmount(String amount)async{
    final a=(int.parse(amount)*100);
    return a.toString();
  }
}