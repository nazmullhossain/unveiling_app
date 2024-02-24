import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcknolodgePage extends StatelessWidget {
  const AcknolodgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xff48043F),
        centerTitle: true,
        title:   Text(
          "Acknowledgments",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle:FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff48043F),
          child: Container(
            height: 1200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(

                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: Column(
              children: [
                Text(textAlign: TextAlign.justify,
                    "As the author of this transformative project, I am deeply grateful to the entire community that brought it to life. This endeavor would not have been possible without the steadfast support and guidance of my family and friends. Their wisdom and love have been instrumental in shaping this book. I am thankful for everyone who has crossed my path, including those whose intentions might not have been aligned with mine. Each interaction has taught me valuable lessons and strengthened my resolve. These experiences have underscored the resilience within me. This project is a testament to the power of unity and collective effort. It reflects the intertwined journeys and contributions of those who supported me, embodying faith, family, and financial empowerment, aiming to uplift and guide future generations. I extend heartfelt gratitude to my community for their belief in me and their invaluable contributions. To My Husband and Pastor Special acknowledgment goes to my husband, Kevin. His unwavering support has been the cornerstone of this journey. From the initial concept to completion, Kevin has been a constant source of support, love, and belief in my potential. Kevin's faith, even during moments of doubt, has been a driving force. His insightful guidance and constructive feedback have significantly influenced this book. His belief in our mission has inspired me to surpass my limits and create something impactful. Beyond being my partner, Kevin has been a cheerleader, sounding board, and confidant. He has celebrated every milestone with enthusiasm, providing strength and motivation in challenging times. I am immensely grateful for Kevin's steadfast support and beliein both me and this project. Together, we embark on a remarkable journey with this transformative exploration for the black family. This book is a testament to our shared vision and commitment to positively impacting others' lives. With all my love and appreciation,"),
             SizedBox(height: 10,),
                Text(" Terri Colon.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
