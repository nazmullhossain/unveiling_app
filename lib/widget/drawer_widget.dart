import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_app/pages/about_author_pages.dart';
import 'package:video_app/pages/signup_pages.dart';
import 'package:video_app/widget/bottom_bar_widget.dart';

import '../controller/theme_controller.dart';
import '../pages/login_pages.dart';
import '../pages/navigation_page.dart';
import '../pages/profile_pages.dart';
import '../pages/web_view_pages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String token = "";
  bool dark=false;
  final darkController = Get.put(ThemeController());

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
    getDark();
  }


  getDark()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dark=await prefs.getBool("dark")??false;
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:dark==false? Color(0xff48043F): Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/na.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Unveiling Our Journey',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(
                            0xff48043F,
                          ),
                          textBaseline: TextBaseline.alphabetic,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
          ),
          token.isNotEmpty
              ? ListTile(

                  dense: true,
                  leading: Icon(Icons.person,size: 30,color: dark==true?Colors.black:Colors.white,),
                  title: Text('Profile',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                )
              : Container(),

          ListTile(
            dense: true,

            leading: Icon(  dark==false?Icons.dark_mode: Icons.light,size: 30,color: dark==true?Colors.black:Colors.white),
            title: Text(   dark==false?"Light Theme": 'Change Theme',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white)),

            onTap: () {
              darkController.changeTheme();
              darkController.getDark();

             Navigator.push(context, MaterialPageRoute(builder: (_)=>NavigationWidget()));

              // launchUrl(Uri.parse(mailing.toString()));
              // _launchURL(
              //     'mailto:alatafpharma@gmail.com?subject=Feedback%20to%20Al-Ataf%20Pharma%20(${packageInfo.version})&body=\n\n\nOS Version: $_osVersion \nBrand:$_deviceName \nModel: $_model');
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.web,size: 30,color: dark==true?Colors.black:Colors.white),
            title: Text('Our Website',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white)),
            onTap: () {
              Navigator.pop(context);

              launchUrl(Uri.parse("http://unveilingourjourney.com"));
              // _launchURL(
              //     'mailto:alatafpharma@gmail.com?subject=Feedback%20to%20Al-Ataf%20Pharma%20(${packageInfo.version})&body=\n\n\nOS Version: $_osVersion \nBrand:$_deviceName \nModel: $_model');
            },
          ),
          ListTile(
              dense: true,
              leading: Icon(Icons.web_asset,size: 30,color: dark==true?Colors.black:Colors.white),
              title: Text('Buy from Amazon',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>WebViewApp()));

                launchUrl(Uri.parse(
                    "https://www.amazon.com/dp/B0CQ42CP5N?fbclid=IwAR1wf-ix6Br7A0qFFAS9EgIdppDLI0SzRI35qYeD2J4nEPaSHifqqDT9Q5I&nodl=1"));
              }),
          ListTile(
              dense: true,
              title: Text('Author: Terri Colon',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white),),
              leading: Icon(Icons.person_2,size: 30,color: dark==true?Colors.black:Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AboutAuthorPage()));

                // launchUrl(Uri.parse("https://www.amazon.com/dp/B0CQ42CP5N?fbclid=IwAR1wf-ix6Br7A0qFFAS9EgIdppDLI0SzRI35qYeD2J4nEPaSHifqqDT9Q5I&nodl=1"));
              }),

          // ListTile(
          //   dense: true,
          //   title: Text('Report or Complain'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Uri mailing = Uri(
          //         scheme: "mailto",
          //         path: "alc041214@gmail.com",
          //         queryParameters: {
          //           'subject': "App complain",
          //           'body':
          //           "Note:%20The%20below%20information%20helps%20us%20to%20understand%20your%20problem%20better.\n\n\n\nVersion: ${packageInfo.version}"
          //         });
          //     launch(mailing.toString());
          //     // _launchURL(
          //     //     'mailto:alc041214@gmail.com?subject=App complain&body=Note:%20The%20below%20information%20helps%20us%20to%20understand%20your%20problem%20better.'
          //     //     ''
          //     //     ''
          //     //     ''
          //     //     '\n'
          //     //     '\n'
          //     //     '\n'
          //     //     'Version: ${packageInfo.version}');
          //   },
          // ),
          ListTile(
            dense: true,
            leading: Icon(Icons.login,size: 30,color: dark==true?Colors.black:Colors.white),
            title: token.isEmpty ? Text('Sign In',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white),) : Text('Sign out',style: TextStyle(fontSize: 20,color: dark==true?Colors.black:Colors.white),),
            onTap: () async {
              if (token.isEmpty) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
                setState(() {});
              }
              if (token.isNotEmpty) {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => NavigationWidget()));
                // Obtain shared preferences.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                // Remove data for the 'counter' key.
                await prefs.remove('token');
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
