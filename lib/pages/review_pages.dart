import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/image_slider.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Thanks To These Couples",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Special Thanks To These Couples",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 20,),
              SliderScreen(),
              
              const SizedBox(height: 10,),
              const Text(textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,),"Thank you for joining me on this incredible journey. To learn more and become a part of a community that appreciates the significance of leaving a lasting legacy for generations, I invite you to visit our website at..Together, let's continue to explore and embrace the power of our shared experiences. visit:./")
              ,const SizedBox(height: 10,),
              Image.asset("images/c11.png")
              ,Center(child: Text("Terri C. Colon"),),
              SizedBox(height: 50,),
              
            ],
          ),
        ),
      ),
    );
  }
}
