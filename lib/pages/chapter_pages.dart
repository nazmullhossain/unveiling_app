import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/pages/login_pages.dart';
import 'package:video_app/pages/stripe_payment_pages.dart';
import 'package:video_app/pages/test_pages.dart';

import '../controller/database_controller.dart';
import '../controller/signup_controller.dart';
import '../controller/theme_controller.dart';
import 'weak/details_pages.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  DatabaseService databaseService = DatabaseService();
  final darkController = Get.put(ThemeController());
  // Timer? _timer;
  // int _timeoutDuration = 5;
  // void _startTimer() async{
  //   _timer = Timer.periodic(Duration(minutes: 1), (timer) async {
  //
  //       _timeoutDuration--;
  //
  //     if (_timeoutDuration == 0) {
  //       await controller.updateEm("${token}", data);
  //       _timer!.cancel();
  //     }
  //   });
  // }
  // void _resetTimer() {
  //   setState(() {
  //     _timeoutDuration = 5;
  //   });
  // }
  // Map<String, dynamic> data = {
  //   "ispayment": true,
  // };
  // void _logout() async {
  //
  //   // Navigate to login screen or wherever you need to navigate
  // }
  Stream? emp;
  Stream? book;

  getBook() async {
    book = await databaseService.getData("book");
    setState(() {});
  }

  String token = "";

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token') ?? "";
    setState(() {});
  }
  // getData() async {
  //   emp = await databaseService.certaindMedthod(token);
  //   setState(() {});
  // }
  // getUserData(){
  //    StreamBuilder(stream: emp, builder: (index,AsyncSnapshot snap){
  //    return  DocumentSnapshot ds=snap.data;
  //      print("checkkkkkkkkkk${ds}");
  //       // return Icon(Icons.lock)
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
    getBook();
    // _startTimer();
    // _resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkController.isDark == false
          ? Colors.black.withOpacity(0.5)
          : Color(0xFFF4F4F4),
      // backgroundColor:darkController.isDark==false?Colors.transparent :Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff003300),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Journey of Our Life",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: token.isEmpty
            ? Center(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: Text("Login"),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage("images/ti.png")),
                  color:Color(0xff003300),
                ),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Image.asset(
                    //           "images/Frame.png",
                    //           width: 24,
                    //           height: 24,
                    //         ),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(top: 10),
                    //           child: Column(
                    //             children: [
                    //               Text(
                    //                 "Journey of our life...",
                    //                 style: GoogleFonts.poppins(
                    //                     fontSize: 20,
                    //                     fontStyle:FontStyle.italic,
                    //                     fontWeight: FontWeight.w600,
                    //                     color: Colors.white),
                    //               ),
                    //               Text(
                    //                 "30 days",
                    //                 style: GoogleFonts.inter(
                    //                     fontSize: 15,
                    //                     fontStyle:FontStyle.italic,
                    //                     fontWeight: FontWeight.w500,
                    //                     color: Colors.white),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     Container(
                    //         margin: const EdgeInsets.only(right: 10),
                    //         child: Image.asset("images/Vector (1).png"))
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                          color: darkController.isDark == false
                              ? Colors.black.withOpacity(0.8)
                              : Color(0xFFF4F4F4),
                          // image: DecorationImage(image: AssetImage("images/ti.png")),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            StreamBuilder(
                                stream: book,
                                builder: (context, AsyncSnapshot snapshot) {
                                  return snapshot.hasData
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          child: ListView.builder(
                                              // scrollDirection: Axis.vertical,
                                              itemCount:
                                                  snapshot.data.docs.length,
                                              itemBuilder: (context, index) {
                                                DocumentSnapshot ds =
                                                    snapshot.data.docs[index];
                                                // print("dataaaaa${ds.id}");
                                                return Container(
                                                  width: double.infinity,
                                                  height: 150,
                                                  alignment: Alignment.center,

                                                  margin:
                                                      // EdgeInsets.all(15),
                                                      EdgeInsets.only(
                                                          bottom: 20),
                                                  decoration: BoxDecoration(
                                                    color: darkController
                                                                .isDark ==
                                                            false
                                                        ?Color(0xff003300)
                                                        : Colors.white,
                                                    // image: DecorationImage(image: AssetImage("images/ti.png")),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'users') // Replace 'your_collection_name' with your actual collection name
                                                        .where('id',
                                                            isEqualTo:
                                                                "${token}") // Assuming 'uid' is the field name in your documents
                                                        .snapshots(),
                                                    builder: (context,
                                                        AsyncSnapshot<
                                                                QuerySnapshot>
                                                            snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }

                                                      if (snapshot.hasError) {
                                                        return Center(
                                                          child: Text(
                                                              'Error: ${snapshot.error}'),
                                                        );
                                                      }

                                                      if (snapshot.data ==
                                                              null ||
                                                          snapshot.data!.docs
                                                              .isEmpty) {
                                                        return Center(
                                                          child: Text(
                                                              'Please first login'),
                                                        );
                                                      }

                                                      return Column(

                                                        children: snapshot
                                                            .data!.docs
                                                            .map((doc) {
                                                          // Assuming your documents have a 'title' field
                                                          bool title = doc['ispayment'];
                                                          print("is payment ${title}");
                                                          DateTime monthly = doc['monthTime'].toDate();
                                                          DateTime year = doc['yearTime'].toDate();
                                                          DateTime date1 = DateTime.now();
                                                          int differenceInMonth = date1.difference(monthly).inDays;
                                                          int differenceInYear = year.difference(date1).inDays;
                                                          return


                                                            ListTile(
                                                            onTap: () async {
                                                              print(
                                                                  "dfjkssssssssssss${differenceInMonth}");
                                                              if (token
                                                                  .isEmpty) {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (_) =>
                                                                            LoginPage()));
                                                              }
                                                              if (title ==
                                                                  false) {
                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        "Your need a payment",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_LONG,
                                                                    gravity: ToastGravity
                                                                        .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        16.0);
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (_) =>
                                                                            StripePaymentPage()));
                                                              } else if (title ==
                                                                  true) {
                                                                if (differenceInYear >
                                                                    365) {
                                                                  Fluttertoast.showToast(
                                                                      msg:
                                                                          "Your year payment is expired",
                                                                      toastLength:
                                                                          Toast
                                                                              .LENGTH_LONG,
                                                                      gravity:
                                                                          ToastGravity
                                                                              .BOTTOM,
                                                                      timeInSecForIosWeb:
                                                                          1,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      fontSize:
                                                                          16.0);
                                                                  Map<String,
                                                                          dynamic>
                                                                      data = {
                                                                    "ispayment":
                                                                        false,
                                                                  };
                                                                  await controller
                                                                      .updateEm(
                                                                          "${token}",
                                                                          data);
                                                                }
                                                                if (differenceInMonth >
                                                                        30 && differenceInYear>365 ) {
                                                                  Fluttertoast.showToast(
                                                                      msg:
                                                                          "Your month payment is expired",
                                                                      toastLength:
                                                                          Toast
                                                                              .LENGTH_SHORT,
                                                                      gravity:
                                                                          ToastGravity
                                                                              .BOTTOM,
                                                                      timeInSecForIosWeb:
                                                                          1,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      fontSize:
                                                                          16.0);
                                                                  Map<String,
                                                                          dynamic>
                                                                      data = {
                                                                    "ispayment":
                                                                        false,
                                                                  };
                                                                  await controller
                                                                      .updateEm(
                                                                          "${token}",
                                                                          data);
                                                                }
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (_) => DeatilsPage(
                                                                              weak1: '${ds["weak1"]}',
                                                                              day1: '${ds["day1"]}',
                                                                              day2: '${ds["day2"]}',
                                                                              day3: '${ds["day3"]}',
                                                                              day4: '${ds["day4"]}',
                                                                              day5: '${ds["day5"]}',
                                                                              day6: '${ds["day6"]}',
                                                                              day7: '${ds["day7"]}',
                                                                              day8: '${ds["day8"]}',
                                                                              day9: '${ds["day9"]}',
                                                                              day10: '${ds["day10"]}',
                                                                              day11: '${ds["day11"]}',
                                                                              day12: '${ds["day12"]}',
                                                                              day13: '${ds["day13"]}',
                                                                              day14: '${ds["day14"]}',
                                                                              day15: '${ds["day15"]}',
                                                                              day16: '${ds["day16"]}',
                                                                              day17: '${ds["day17"]}',
                                                                              day18: '${ds["day18"]}',
                                                                              day19: '${ds["day19"]}',
                                                                              day20: '${ds["day20"]}',
                                                                              day21: '${ds["day21"]}',
                                                                              day22: '${ds["day22"]}',
                                                                              day23: '${ds["day23"]}',
                                                                              day24: '${ds["day24"]}',
                                                                              day25: '${ds["day25"]}',
                                                                              day26: '${ds["day26"]}',
                                                                              day27: '${ds["day27"]}',
                                                                              day28: '${ds["day28"]}',
                                                                              day29: '${ds["day29"]}',
                                                                              day30: '${ds["day30"]}',
                                                                              weak2: '${ds["weak2"]}',
                                                                              weak3: '${ds["weak3"]}',
                                                                              weak4: '${ds["weak4"]}',
                                                                            )));
                                                              }
                                                            },
                                                            leading: Image.asset(
                                                                "images/ti.png"),
                                                            subtitle: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "${ds["month_title"]}",
                                                              style: TextStyle(
                                                                  color: darkController.isDark ==
                                                                          false
                                                                      ? Color(
                                                                          0xFFF4F4F4)
                                                                      : Colors
                                                                          .black
                                                                          .withOpacity(0.8)),
                                                            ),
                                                            title: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "${ds["month"]}",
                                                              style: TextStyle(
                                                                  color: darkController.isDark ==
                                                                          false
                                                                      ? Color(
                                                                          0xFFF4F4F4)
                                                                      : Colors
                                                                          .black
                                                                          .withOpacity(0.8)),
                                                            ),
                                                            // trailing:
                                                            //     title == false
                                                            //         ? Icon(
                                                            //             CupertinoIcons
                                                            //                 .lock,
                                                            //             color: darkController.isDark == false
                                                            //                 ? Color(0xFFF4F4F4)
                                                            //                 : Colors.black.withOpacity(0.8),
                                                            //           )
                                                            //         : Icon(
                                                            //             CupertinoIcons
                                                            //                 .lock_open,
                                                            //             color: darkController.isDark == false
                                                            //                 ? Color(0xFFF4F4F4)
                                                            //                 : Colors.black.withOpacity(0.8),
                                                            //           ),
                                                          );
                                                          // You can add more widgets to display other fields of the document
                                                        }).toList(),
                                                      );
                                                    },
                                                  ),
                                                  // Text(
                                                  //   "Journey of our life",
                                                  //   style: GoogleFonts.poppins(
                                                  //       color: Color(0xFF5D646F),
                                                  //       fontSize: 14,
                                                  //       fontWeight: FontWeight.w500),
                                                  // ),
                                                );
                                              }),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        );
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
      ),
    );
  }

  final controller = Get.put(SignUpController());
  Map<String, dynamic>? paymentIntent;

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

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Map<String, dynamic> data = {
        "ispayment": true,
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

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": "100", "currency": "USD"};
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
}
