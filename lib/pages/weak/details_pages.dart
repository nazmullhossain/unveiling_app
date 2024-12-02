import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app/pages/day_pages.dart';
import 'package:video_app/pages/weak/weak_2_pages.dart';
import 'package:video_app/pages/weak/weak_3_page.dart';
import 'package:video_app/pages/weak/weak_4_pages.dart';

import '../../controller/theme_controller.dart';

class DeatilsPage extends StatelessWidget {
  DeatilsPage({
    super.key,
    required this.day1,
    required this.day2,
    required this.day3,
    required this.weak1,
    required this.weak2,
    required this.weak3,
    required this.weak4,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.day8,
    required this.day9,
    required this.day10,
    required this.day11,
    required this.day12,
    required this.day13,
    required this.day14,
    required this.day15,
    required this.day16,
    required this.day17,
    required this.day18,
    required this.day19,
    required this.day20,
    required this.day21,
    required this.day22,
    required this.day23,
    required this.day24,
    required this.day25,
    required this.day26,
    required this.day27,
    required this.day28,
    required this.day29,
    required this.day30,
  });
  String weak1,
      weak2,
      weak3,
      weak4,
      day1,
      day2,
      day3,
      day4,
      day5,
      day6,
      day7,
      day8,
      day9,
      day10,
      day11,
      day12,
      day13,
      day14,
      day15,
      day16,
      day17,
      day18,
      day19,
      day20,
      day21,
      day22,
      day23,
      day24,
      day25,
      day26,
      day27,
      day28,
      day29,
      day30;

  @override
  Widget build(BuildContext context) {
    final darkController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.pink,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          //change size on your need
          color: Colors.white, //change color on your need
        ),
        centerTitle: true,
        title: Text(
          "Weak",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/ti.png")),
            color: darkController.isDark == false
                ? Colors.black
                : Color(0xFFF4F4F4).withOpacity(0.8),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(

                    // color: darkController.isDark==false?Color(0xFFF4F4F4).withOpacity(0.8):Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DayPage(
                                      day1: day1,
                                      day2: day2,
                                      day3: day3,
                                      day4: day4,
                                      day5: day5,
                                      day6: day6,
                                      day7: day7,
                                    )));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/ti.png")),
                            borderRadius: BorderRadius.circular(10),
                            color: darkController.isDark == false
                                ?Colors.pink
                                : Colors.white,
                          ),
                          child: Text(
                            "${weak1}",
                            style: TextStyle(
                                color: darkController.isDark == false
                                    ? Color(0xFFF4F4F4)
                                    : Colors.black.withOpacity(0.8)),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Weak2Page(
                                      day8: day8,
                                      day9: day9,
                                      day10: day10,
                                      day11: day11,
                                      day12: day12,
                                      day13: day13,
                                      day14: day14,
                                    )));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("images/ti.png")),
                            color: darkController.isDark == false
                                ?Colors.pink
                                : Colors.white,
                          ),
                          child: Text(
                            "${weak2}",
                            style: TextStyle(
                                color: darkController.isDark == false
                                    ? Color(0xFFF4F4F4)
                                    : Colors.black.withOpacity(0.8)),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Weak3Page(
                                      day15: day15,
                                      day16: day16,
                                      day17: day17,
                                      day18: day18,
                                      day19: day19,
                                      day20: day20,
                                      day21: day21,
                                    )));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/ti.png")),
                            borderRadius: BorderRadius.circular(10),
                            color: darkController.isDark == false
                                ?Colors.pink
                                : Colors.white,
                          ),
                          child: Text(
                            "${weak3}",
                            style: TextStyle(
                                color: darkController.isDark == false
                                    ? Color(0xFFF4F4F4)
                                    : Colors.black.withOpacity(0.8)),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Weak4Page(
                                      day22: day22,
                                      day23: day23,
                                      day24: day24,
                                      day25: day25,
                                      day26: day26,
                                      day27: day27,
                                      day28: day28,
                                    )));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/ti.png")),
                            borderRadius: BorderRadius.circular(10),
                            color: darkController.isDark == false
                                ?Colors.pink
                                : Colors.white,
                          ),
                          child: Text(
                            "${weak4}",
                            style: TextStyle(
                                color: darkController.isDark == false
                                    ? Color(0xFFF4F4F4)
                                    : Colors.black.withOpacity(0.8)),
                          )),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
