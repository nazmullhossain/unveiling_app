import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:video_app/pages/home_pages.dart';

void main() {
  Stripe.publishableKey="pk_test_51LP7zrF7MKpA2lzUANII8cZSGoZUNpFt3PUeQ0TbiqHUFJ41xQsR7y1w1H0kFwdDqsUD4eF9KeVuZVmpNLqnzkKP00Z4JbVza7";
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
