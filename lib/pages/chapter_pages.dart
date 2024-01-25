import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1AA483),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "images/Frame.png",
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Text(
                              "Books Name",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              "30 days",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset("images/Vector (1).png"))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search y Chapter",
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon:
                                  Image.asset("images/Search 1 (2).png"),
                              hintStyle: GoogleFonts.poppins(
                                  color: Color(0xFF5C768D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 336,
                                height: 68,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Unveiling Our Journey",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF5D646F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    "Unveiling Our Journey",
                                    style: GoogleFonts.inter(
                                        color:
                                            Color(0xFF353535).withOpacity(0.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  leading: Container(
                                    alignment: Alignment.center,
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1AA483),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      "Unveiling Our Journey",
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
