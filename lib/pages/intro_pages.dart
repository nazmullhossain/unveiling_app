import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xff48043F),
        centerTitle: true,
        title: Text(
          "Introduction",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff48043F),
          child: Container(
            height: 1000,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              children: [
                Text(
                  "Welcome to Unveiling Our Journey: A 12-Month Journal for Creating our Family Legacy. This book is designed to guide and inspire families on a transformative journey of self-discovery, faith exploration, and financial empowerment. Over the course of 12 months, this journal will serve as a daily companion, providing prompts, reflections, and activities that encourage families to dive deep into their faith, strengthen family bonds, and navigate their financial landscape. In today's fast-paced world, it is essential for families to find moments of connection and reflection amidst the chaos. This journal offers a structured yet flexible approach, allowing families to create a daily ritual that fosters meaningful conversations, deepens their understanding of their heritage and faith, and strengthens their financial literacy. By engaging in these practices together, families can strengthen their bond, nurture their spirituality, and lay a foundation of financial stability for generations to come. This journal is more than just a book; it is a keepsake that will serve as a tangible reminder of the family's journey and growth. As each page is filled with thoughts, stories, and dreams, it becomes a treasure trove of memories and lessons that can be shared with future generations. It is a living testament to the family's values, experiences, and aspirations, creating a lasting legacy that will inspire and guide future family members. So, let us embark on this journey together, unveiling the beauty of our faith, family, and finances, and sowing the seeds of prosperity for generations to come.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(" Terri Colon.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
