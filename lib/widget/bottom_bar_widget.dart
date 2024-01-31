//
// import 'package:flutter/material.dart';
// import 'package:video_app/widget/utilss.dart';
//
// import '../pages/add_new_pages.dart';
// import '../pages/chapter_pages.dart';
// import '../pages/home_pages.dart';
// import '../pages/login_pages.dart';
// import '../pages/signup_pages.dart';
// import '../pages/stripe_payment_pages.dart';
//
//
//
// class BottomBarWidget extends StatefulWidget {
//   const BottomBarWidget({Key? key}) : super(key: key);
//   static const String routeName = "/actual-home";
//   @override
//   State<BottomBarWidget> createState() => _BottomBarWidgetState();
// }
//
// class _BottomBarWidgetState extends State<BottomBarWidget> {
//   int _page = 0;
//   double bottomBarWidth = 42;
//   double bottomBarBorderWidth = 5;
//   List<Widget> pageMain = [
//     HomePage(),
//     ChapterPage(),
//
//
//     SignUpPage(),
//     StripePaymentPage(),
//     AddNewPage(),
//
//   ];
//   void updatePage(int page) {
//     setState(() {
//       _page = page;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         width: 336,
//         height: 63,
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
//         // color: Color(0xff48043F)
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _page,
//             onTap: updatePage,
//             selectedItemColor: GlobalVariable.selectedNavBarColor,
//             unselectedItemColor: GlobalVariable.unSelectedNavBarColor,
//             backgroundColor:Color(0xff48043F),
//             iconSize: 28,
//             items: [
//               BottomNavigationBarItem(
//                 backgroundColor: Color(0xff48043F),
//                   icon: Column(
//                     children: [
//                      Image.asset("images/Vector.png",width: 20,height: 20,
//                        color: _page==0?GlobalVariable.selectedNavBarColor:GlobalVariable.backMenuColor,),
//
//
//                       Container(
//
//
//                         width: bottomBarWidth,
//                         decoration: BoxDecoration(
//                           // color: Color(0xff48043F),
//
//                             border: Border(
//                                 top: BorderSide(
//                           color: _page == 0
//                               ? Colors.white
//                               : Color(0xff48043F),
//                           width: bottomBarBorderWidth,
//
//                         ))),
//
//                       ),
//                     ],
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Image.asset("images/book-alt (1) 1.png",width: 20,height: 20,
//                         color: _page==1?GlobalVariable.selectedNavBarColor:GlobalVariable.backMenuColor,
//                       ),
//
//
//                       Container(
//
//
//                         width: bottomBarWidth,
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(
//                                   color: _page == 1
//                                       ? Colors.white
//                                       : Color(0xff48043F),
//                           width: bottomBarBorderWidth,
//
//                         ))),
//
//                       ),
//                     ],
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Image.asset("images/Note.png",width: 20,height: 20,
//                         color: _page==2?GlobalVariable.selectedNavBarColor:GlobalVariable.backMenuColor,
//                       ),
//
//
//                       Container(
//
//
//                         width: bottomBarWidth,
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(
//                                   color: _page == 2
//                                       ? Colors.white
//                                       : Color(0xff48043F),
//                           width: bottomBarBorderWidth,
//
//                         ))),
//
//                       ),
//                     ],
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Image.asset("images/Save.png",width: 20,height: 20,
//                         color: _page==3?GlobalVariable.selectedNavBarColor:GlobalVariable.backMenuColor,
//                       ),
//
//
//                       Container(
//
//
//                         width: bottomBarWidth,
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(
//                                   color: _page == 3
//                                       ? Colors.white
//                                       : Color(0xff48043F),
//                           width: bottomBarBorderWidth,
//
//                         ))),
//
//                       ),
//                     ],
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Image.asset("images/User.png",width: 20,height: 20,
//                         color: _page==4?GlobalVariable.selectedNavBarColor:GlobalVariable.backMenuColor,
//                       ),
//
//
//                       Container(
//
//
//                         width: bottomBarWidth,
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(
//                                   color: _page == 4
//                                       ? Colors.white
//                                       : Color(0xff48043F),
//                           width: bottomBarBorderWidth,
//
//                         ))),
//
//                       ),
//                     ],
//                   ),
//                   label: ""),
//
//
//
//             ],
//           ),
//         ),
//       ),
//       body: pageMain[_page],
//     );
//   }
// }
