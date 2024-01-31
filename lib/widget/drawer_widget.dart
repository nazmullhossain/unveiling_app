import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_app/pages/signup_pages.dart';
import 'package:video_app/widget/bottom_bar_widget.dart';

import '../pages/about_page.dart';
import '../pages/login_pages.dart';
import '../pages/navigation_page.dart';
import '../pages/profile_pages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String token="";

  getPrefs()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   token =await prefs.getString('token')??"";
   setState(() {

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Colors.white,
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
                          image: AssetImage('images/na.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Books',
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
            title: Text('Profile'),
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


          // ListTile(
          //   dense: true,
          //   title: Text('Feedback'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Uri mailing = Uri(
          //         scheme: "mailto",
          //         path: "alatafpharma@gmail.com",
          //         queryParameters: {
          //           'subject':
          //           "Feedback%20to%20Al-Ataf%20Pharma%20(${packageInfo.version})",
          //           'body':
          //           "\n\n\nOS Version: $_osVersion \nBrand:$_deviceName \nModel: $_model"
          //         });
          //     launchUrl(Uri.parse(mailing.toString()));
          //     // _launchURL(
          //     //     'mailto:alatafpharma@gmail.com?subject=Feedback%20to%20Al-Ataf%20Pharma%20(${packageInfo.version})&body=\n\n\nOS Version: $_osVersion \nBrand:$_deviceName \nModel: $_model');
          //   },
          // ),
          ListTile(
              dense: true,
              title: Text('Services'),
              onTap: () {
                Navigator.pop(context);

                Fluttertoast.showToast(
                    msg: "Coming soon",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    );



              }),
          ListTile(
              dense: true,
              title: Text('Author Whatapp'),
              onTap: () {
                _launchURL("");
                Navigator.pop(context);

                // Fluttertoast.showToast(
                //     msg: "Coming soon",
                //     backgroundColor: Colors.green,
                //     textColor: Colors.white,
                //     );



              }),
          ListTile(
            dense: true,
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ));
            },
          ),
          ListTile(
            dense: true,
            title: Text('Like us on facebook'),
            onTap: () {
              Navigator.pop(context);
              _launchURL('https://m.facebook.com');
            },
          ),
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
            title: token.isEmpty ? Text('Sign In') : Text('Sign out'),
            onTap: () async{
              if(token.isEmpty){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                setState(() {

                });
              }
              if(token.isNotEmpty){
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavigationWidget()));
                // Obtain shared preferences.
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                // Remove data for the 'counter' key.
                await prefs.remove('token');
                setState(() {

                });
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
