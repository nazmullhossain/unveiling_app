import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/theme_controller.dart';
import '../linear_day_pages.dart';

class Weak2Page extends StatefulWidget {
  Weak2Page(
      {super.key,
        this.day1,
        this.day2,
        this.day3,
        this.day4,
        this.day5,
        this.day6,
        this.day7,
        this.day8,
        this.day9,
        this.day10,
        this.day11,
        this.day12,
        this.day13,
        this.day14,
        this.day15,
        this.day16,
        this.day17,
        this.day18,
        this.day19,
        this.day20,
        this.day21,
        this.day22,
        this.day23,
        this.day24,
        this.day25,
        this.day26,
        this.day27,
        this.day28,
        this.day29,
        this.day30,



      });

  String? day1, day2, day3,day4,day5,day6,day7,day8,day9, day10, day11,day12,day13,day14,day15,day16,day17, day18, day19,day20,day21,day22,day23,day24,day25, day26, day27,day28,day29,day30;

  @override
  State<Weak2Page> createState() => _Weak2PageState();
}

class _Weak2PageState extends State<Weak2Page> {


  @override
  Widget build(BuildContext context) {
    final darkController=Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff003300),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          //change size on your need
          color: Colors.white, //change color on your need
        ),
        centerTitle: true,
        title: Text(
          "Day",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color:Color(0xff003300),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(

                color:  darkController.isDark==false?Colors.black:Color(0xFFF4F4F4).withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day8}",)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color:  darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text("${widget.day8}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day9}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day9}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day10}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day10}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day11}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day11}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),


                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day12}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day12}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day13}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day13}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LinearDayPage(day: "${widget.day14}",)));
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=>DayPage(day3: day3, day2: day2, day1: day1)));
                  },
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkController.isDark==false?Color(0xffFFC0CB) :Color(0xFFF4F4F4),),
                      child: Text(
                        "${widget.day14}",
                        style: TextStyle(color: darkController.isDark==false?Color(0xFFF4F4F4):Colors.black.withOpacity(0.8)),
                      )),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
