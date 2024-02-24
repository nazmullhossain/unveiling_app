import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/controller/theme_controller.dart';
import 'package:video_app/pages/add_new_pages.dart';
import 'package:video_app/pages/chapter_pages.dart';
import 'package:video_app/pages/home_pages.dart';
import 'package:video_app/pages/review_pages.dart';

import 'add_slider_pages.dart';
import 'content_table_pages.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int index=1;
  final darkController=Get.put(ThemeController());
  final items=<Widget>[

    Icon(Icons.book,size: 30,),
    Icon(Icons.home,size: 30,),
    Icon(Icons.reviews,size: 30,),



  ];
  final sceren=[
    ChapterPage(),

    // AddNewPage(),
    HomePage(),
    ReviewPage(),
    // AddNewPage()


  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey,

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            color: Color(0xff48043F),
            buttonBackgroundColor: darkController.isDark==false?Colors.purple.withOpacity(0.8) :Colors.grey,
            backgroundColor: Colors.transparent,
            height: 60,
            items: items,
            index: index,
            onTap: (index)=>setState(() {
              this.index=index;
            }),
          ),
        ),
        body: sceren[index]
      ),
    );
  }
}
