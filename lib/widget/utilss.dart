import 'package:flutter/material.dart';

class GlobalVariable {


  static const secondaryColor=Color.fromRGBO(255, 153, 0, 1);
  static const backGroundColor=Colors.white;
  static const backMenuColor=Color(0xFF101010);
  static const Color greyBackgroundColor=Color(0xffebecee);
  static var selectedNavBarColor=Colors.white;
  static const unSelectedNavBarColor=Colors.amber;


  static const appBarGradiant = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(26, 164, 131, 1),
        Color.fromRGBO(14, 132, 104, 1),
        Color.fromRGBO(43, 185, 151, 1),
      ],
      stops: [
        0.5,
        1.0,
        0.5
      ]);

 static List <Map<String,dynamic>> imagesList=[
    {
      "image": "images/Frame 22.png",
      "name":"Last"
    },
    {
      "image": "images/Frame 22 (1).png",
      "name":"Go to"
    },
    {
      "image": "images/Frame 22 (2).png",
      "name":"Books"
    },
    {
      "image": "images/Frame 22 (3).png",
      "name":"About"
    },
  ];
 static List <Map<String,dynamic>> bookList=[
    {
      "image": "images/Frame 69.png",
      "name":"Sahih Muslim",
      "num": "7563",
      "sub":"Imam Bukhari"
    },
    {
      "image": "images/Frame 69 (1).png",
      "name":"Sahih Muslim",
      "num": "3033",
      "sub":"Imam Bukhari"
    },
    {
      "image": "images/Frame 69 (2).png",
      "name":"Sunan an-Nasai",
      "num": "5758",
      "sub":"Imam Nasai"
    },

  ];
}
