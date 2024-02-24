import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app/controller/theme_controller.dart';

class LinearDayPage extends StatefulWidget {
  LinearDayPage({super.key, required this.day});
  String day;

  @override
  State<LinearDayPage> createState() => _LinearDayPageState();
}

class _LinearDayPageState extends State<LinearDayPage> {
  double _fontSize = 14.0;
  // Initial font size

  final darkController = Get.put(ThemeController());
  void _increaseFontSize() {
    setState(() {
      _fontSize += 1.0; // Increase font size by 2.0
    });
  }

  void _decreaseFontSize() {
    if (_fontSize >= 14.0) {
      setState(() {
        _fontSize -= 1.0; // Increase font size by 2.0
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff48043F),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          //change size on your need
          color: Colors.white, //change color on your need
        ),
        centerTitle: true,
        title: Text(
          "${widget.day}",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff48043F),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.9,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: darkController.isDark == false
                        ? Colors.black
                        : Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Text(
                    "${widget.day}",
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: darkController.isDark == false
                          ? Color(0xFFF4F4F4).withOpacity(0.8)
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              _increaseFontSize();
              print(_fontSize);
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: .5,
          ),
          InkWell(
            onTap: () {
              _decreaseFontSize();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Icon(
                CupertinoIcons.minus,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
