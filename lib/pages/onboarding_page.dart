import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/pages/home_pages.dart';
import 'package:video_app/pages/splash_pages.dart';

import 'package:video_app/widget/bottom_bar_widget.dart';

import '../model/content_model.dart';
import 'navigation_page.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController? _controller;
  SharedPreferences? _prefs;
  bool _isFirstLaunch = false;
  @override
  void initState() {

    super.initState();
    _controller = PageController(initialPage: 0);
    _checkFirstLaunch();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }
  Future<void> _checkFirstLaunch() async {
    _prefs = await SharedPreferences.getInstance();
    _isFirstLaunch = _prefs!.getBool('first_launch') ??true;
    if (!_isFirstLaunch==true) {
      // If not first launch, navigate away from onboarding page
      _navigateToHome();
    }
  }
  void _completeOnboarding()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_launch', true);
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image.toString(),
                        height: 200,
                      ),
                      Text(

                        contents[i].title.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        contents[i].discription.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            // height: 60,
            margin: EdgeInsets.all(20),
            // width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff003300),
                padding: EdgeInsets.symmetric(horizontal: 100),
              ),
              child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",style: TextStyle(color: Colors.white),),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  _completeOnboarding();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NavigationWidget(),
                    ),
                  );
                }
                _controller!.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );

              },

            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff003300),
      ),
    );
  }
}