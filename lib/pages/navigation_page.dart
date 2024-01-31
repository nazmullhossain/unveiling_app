import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_app/pages/add_new_pages.dart';
import 'package:video_app/pages/chapter_pages.dart';
import 'package:video_app/pages/home_pages.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int index=1;
  final items=<Widget>[
    Icon(Icons.book,size: 30,),
    Icon(Icons.home,size: 30,),

    Icon(Icons.favorite,size: 30,),

  ];
  final sceren=[

    ChapterPage(),
    HomePage(),
    AddNewPage(),

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

            iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            color: Color(0xff48043F),
            buttonBackgroundColor: Colors.grey,
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
