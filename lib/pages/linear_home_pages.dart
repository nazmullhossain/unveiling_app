import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app/pages/chapter_pages.dart';

class LinearHomePage extends StatefulWidget {
   LinearHomePage({super.key,required this.img,required this.des});
  String img,des;

  @override
  State<LinearHomePage> createState() => _LinearHomePageState();
}

class _LinearHomePageState extends State<LinearHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xff003300),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Journey of our life",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        widget. img.isNotEmpty?   Image.network(widget.img):Center(child: CircularProgressIndicator()),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(20),child: Text(textAlign: TextAlign.justify,widget.des,style: TextStyle(fontWeight: FontWeight.bold),),),


            SizedBox(height: 0,),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ChapterPage()));
            }, child: Text("Read More")),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
