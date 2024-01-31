import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:video_app/pages/home_pages.dart';
import 'package:video_app/pages/navigation_page.dart';
import 'package:video_app/pages/onboarding_page.dart';
import 'package:video_app/widget/bottom_bar_widget.dart';
import 'package:video_app/widget/general_binding_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey="pk_live_51OcEtSHJHeEC92YEE743ZaWXGJIj5yCWO0bzvzvUrEn9scFGgy7JHKUqMymry2Nu6uasFIgZFzmALwsWmEtot1t700g0orYkZY";

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:Color(0xff48043F),
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindigs(),
      debugShowCheckedModeBanner: false,
      home: NavigationWidget(),
    );
  }
}
