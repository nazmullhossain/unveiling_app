import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:video_app/pages/chapter_pages.dart';
import 'package:video_app/pages/login_pages.dart';
import 'package:video_app/pages/stripe_payment_pages.dart';
import 'package:video_app/widget/drawer_widget.dart';

import '../controller/database_controller.dart';
import '../controller/theme_controller.dart';
import '../widget/slider_widget.dart';
import '../widget/utilss.dart';
import 'acknowledge_pages.dart';
import 'content_table_pages.dart';
import 'intro_pages.dart';
import 'linear_home_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PackageInfo packageInfo = PackageInfo(
  //   appName: 'Unknown',
  //   packageName: 'Unknown',
  //   version: 'Unknown',
  //   buildNumber: 'Unknown',
  // );
  var _osVersion = "";
  var _deviceName = "";
  var _model = "";
  bool dark=false;
  final darkController=Get.put(ThemeController());
  Stream? book;
  DatabaseService databaseService = DatabaseService();
  getBook() async {
    book = await databaseService.getData("book");
    setState(() {});
  }
  getDark()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dark=(await prefs.getBool("dark"))!;
    setState(() {

    });

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    darkController.getDark();
    getBook();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:darkController.isDark==false?Colors.black :Color(0xFFF4F4F4),
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 40, //change size on your need
          color: Colors.white, //change color on your need
        ),
        backgroundColor:  Color(0xff003300),
        // backgroundColor: const Color.fromRGBO(26, 164, 131, 1),
        title: Text("Home",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      color:  Color(0xff003300),
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image: AssetImage("images/ti.png")),
                        // gradient: GlobalVariable.appBarGradiant,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Image.asset(
                        //       "images/Menu (1).png",
                        //       height: 42,
                        //       width: 40,
                        //     ),
                        //     Text(
                        //       "ourney",
                        //       style: GoogleFonts.poppins(
                        //           textStyle: TextStyle(
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 20,
                        //               color: Colors.white)),
                        //     ),
                        //     Image.asset(
                        //       "images/Search 1.png",
                        //       width: 42,
                        //       height: 42,
                        //     )
                        //   ],
                        // ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/image 3 (Traced).png"))),
                            child: SliderScreen()),
                        // Text(
                        //   "“A slave [of Allah] may utter a word without giving it \n much thought by which he slips into the fire a \n distance further than that between east and west.”",
                        //   style: GoogleFonts.hind(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w500,
                        //       color: Colors.white),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Text(
                        //   "[ Bukhari and Muslim ]",
                        //   style: GoogleFonts.hindSiliguri(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 14,
                        //     color: Colors.white,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    child: Container(
                      alignment: Alignment.center,
                      width: 336,
                      height: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: darkController.isDark==false?Color(0xFF261A02) :Colors.white,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: GlobalVariable.imagesList.length,
                          itemBuilder: (context, index) {
                            final data = GlobalVariable.imagesList[index];
                            return InkWell(
                              onTap: (){
                                if(index==3){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AcknolodgePage()));
                                }
                                if(index==0){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>IntroPage()));
                                }
                                if(index==2){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>    ContentTablePage()));
                                }


                                if(index==1){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>StripePaymentPage()));
                                }
                              },
                              child: Container(
                                // color: darkController.isDark==false?Colors.black.withOpacity(0.5) :Colors.white,
                                child: Column(
                                  children: [
                                    Image.asset(data["image"]),
                                    Text(
                                      data["name"],
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff5D646F),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Journey of Our Life Book..",
                          style: GoogleFonts.poppins(
                            
                            color:darkController.isDark?Colors.black:Colors.white.withOpacity(0.7),

                              fontStyle: FontStyle.italic,

                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        StreamBuilder(
                          stream: book,
                          builder: (context, AsyncSnapshot snapshot) {
                            return snapshot.hasData? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                               itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot ds =
                                    snapshot.data.docs[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearHomePage(img: ds["img"], des: ds["des"],)));
                                      },
                                      child: Container(
                                        width: 336,
                                        height: 150,
                                        padding: EdgeInsets.all(4),
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color:  darkController.isDark==false?Color(0xffFFC0CB) :Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          leading: Image.asset(
                                            "images/ti.png",
                                            height: 46,
                                            width: 46,
                                          ),
                                          title: Text(
                                            "${ds["month"]}",
                                            style: GoogleFonts.poppins(
                                                color: darkController.isDark?Colors.black:Colors.white.withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          subtitle: Text(
                                            "${ds["month_title"]}",
                                            style: GoogleFonts.inter(

                                                color: darkController.isDark?Colors.black:Colors.white.withOpacity(0.7),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          // trailing: Column(
                                          //   children: [
                                          //     Text(
                                          //       "First Quarter of the year _______",
                                          //       style: GoogleFonts.poppins(
                                          //           color: Color(0xFF101010),
                                          //           fontWeight:
                                          //               FontWeight.w500),
                                          //     ),
                                          //     // Text(
                                          //     //   "Book",
                                          //     //   style: GoogleFonts.inter(
                                          //     //       color: Color(0xFF101010)
                                          //     //           .withOpacity(0.5),
                                          //     //       fontWeight: FontWeight.w400,
                                          //     //       fontSize: 12),
                                          //     // )
                                          //   ],
                                          // ),
                                        ),
                                      ),
                                    );
                                  }),
                            ):
                            Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        )
                      ],
                    )


              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          // Add more ListTile widgets for other items
        ],
      ),
    );
  }
}
