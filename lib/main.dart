import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/pages/home_pages.dart';
import 'package:video_app/pages/navigation_page.dart';
import 'package:video_app/pages/onboarding_page.dart';
import 'package:video_app/pages/splash_pages.dart';
import 'package:video_app/widget/bottom_bar_widget.dart';
import 'package:video_app/widget/general_binding_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey="pk_live_51OcEtSHJHeEC92YEE743ZaWXGJIj5yCWO0bzvzvUrEn9scFGgy7JHKUqMymry2Nu6uasFIgZFzmALwsWmEtot1t700g0orYkZY";

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:Color(0xff003300),
  ));
  runApp( MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Define two dates for comparison
//     DateTime date1 = DateTime.now();
//     DateTime date2 = DateTime(2026, 2, 1);
//
//     // Calculate the difference in days
//     int differenceInDays = date2.difference(date1).inDays;
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Date Comparison'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Date 1: ${date1.toString()}',
//               ),
//               Text(
//                 'Date 2: ${date2.toString()}',
//               ),
//               Text(
//                 'Difference in days: $differenceInDays',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int? difference;
//   DateTime date1 = DateTime(2024, 5, 15);
//   DateTime date2 = DateTime(2024, 6, 1);
//   // DateTime date1 = DateTime(2024, 1, 1);
//   // DateTime date2 = DateTime(2023, 10, 10);
//   int differenceInMonths(DateTime date1, DateTime date2) {
//     int yearDiff = date2.year - date1.year;
//     int monthDiff = date2.month - date1.month;
//     return yearDiff * 12 + monthDiff;
//   }
//   differ(){
//      difference = differenceInMonths(date1, date2);
//     setState(() {
//
//     });
//     print("Difference in months: $difference");
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     differ();
//   }
//   @override
//   Widget build(BuildContext context) {
//     // Define two DateTime objects
//
//
//     // Compare the two dates
//
//     // Convert the comparison result to a readable string
//     String comparisonString;
//
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Date Comparison'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//        ElevatedButton(onPressed: (){
//          if(difference! <=1){
//            print("month");
//          }else{
//            print("year");
//          }
//        }, child: Text("chekc"))
//               // Text(comparisonString),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return WillPopScope(
      onWillPop: () async{
        // Intercept back button press and close the app
        SystemNavigator.pop();
        return false;
      },
      child: GetMaterialApp(
        initialBinding: GeneralBindigs(),
        debugShowCheckedModeBanner: false,
        home:token.isEmpty? Onbording():NavigationWidget(),
      ),
    );
  }
}
