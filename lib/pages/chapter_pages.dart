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
import 'package:video_app/pages/test_pages.dart';

import '../controller/database_controller.dart';
import '../controller/signup_controller.dart';
import 'details_pages.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  DatabaseService databaseService = DatabaseService();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xff48043F),
  centerTitle: true,
  title:   Text(
    "Unveiling Our Journey",
    style: GoogleFonts.poppins(
        fontSize: 20,
        fontStyle:FontStyle.italic,
        fontWeight: FontWeight.w600,
        color: Colors.white),
  ),
),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
              color:   Color(0xff48043F),
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
              //                 "Unveiling Our Journey...",
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
                    color: const Color(0xFFF4F4F4),
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
                                    height:
                                        MediaQuery.of(context).size.height * 0.8,
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: snapshot.data.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot ds =
                                              snapshot.data.docs[index];
                                          // print("dataaaaa${ds.id}");
                                          return Container(
                                            width: 336,
                                            height: 68,
                                            margin: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection(
                                                      'users') // Replace 'your_collection_name' with your actual collection name
                                                  .where('id',
                                                      isEqualTo:
                                                          "${token}") // Assuming 'uid' is the field name in your documents
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
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

                                                if (snapshot.data == null ||
                                                    snapshot.data!.docs.isEmpty) {
                                                  return Center(
                                                    child: Text(
                                                        'Please first login'),
                                                  );
                                                }

                                                return ListView(
                                                  children: snapshot.data!.docs
                                                      .map((doc) {
                                                    // Assuming your documents have a 'title' field
                                                    bool title = doc['ispayment'];
                                                    return ListTile(
                                                      onTap: () {
                                                        if (token.isEmpty) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      LoginPage()));
                                                        }
                                                        if (title == false) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Your need a payment",
                                                              toastLength: Toast
                                                                  .LENGTH_LONG,
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
                                                          makePayment();
                                                        } else if (title ==
                                                            true) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      DeatilsPage(
                                                                        day1:
                                                                            '${ds["day1"]}',
                                                                      )));
                                                        }
                                                      },
                                                      subtitle:
                                                          Text("${ds["month_title"]}"),
                                                      title:
                                                          Text("${ds["month"]}"),
                                                      trailing: title == false
                                                          ? Icon(
                                                              CupertinoIcons.lock)
                                                          : Icon(CupertinoIcons
                                                              .lock_open),
                                                    );
                                                    // You can add more widgets to display other fields of the document
                                                  }).toList(),
                                                );
                                              },
                                            ),
                                            // Text(
                                            //   "Unveiling Our Journey",
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
