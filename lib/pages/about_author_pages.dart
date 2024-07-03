import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAuthorPage extends StatelessWidget {
  const AboutAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff48043F),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Terri Colon",
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
            children: [

              CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: Image.asset("images/au.png")),
              SizedBox(height: 20,),

//text
              Text(
                "Terri C. Colon, author of “Unveiling our Journey: A Family’s Guide to Leaving a Legacy,” is a woman of passion, purpose, and profound insight. Her remarkable journal is more than just a book; it is a call to action, a guide for leaving a legacy, and a celebration of the family. Through her own experiences and deep understanding of the value of knowledge and preserving traditions, Terri invites families to embark on a transformative journey. With each page, she empowers families to strengthen bonds, ignite conversations, and leave a lasting legacy that will inspire future generations. Join Terri C. Colon on this powerful journey of self-discovery and the power of your own story in ‘Unveiling Our Journey.",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "In this book you will discover how to",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Column(
                children: [
                  Text(
                    "**Experience the Unparalleled Fusion**",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "images/bo.png",
                    height: 100,
                  ),
                  Text(
                      "Unlike any other journal, this book seamlessly blends faith, family, and financial empowerment. It offers a comprehensive and holistic approach to creating a lasting family legacy that transcends generations."),
                ],
              ),
              Divider(),
              SizedBox(height: 10,),
              Column(
                children: [
                  Text(
                    "**Elevate Your Family's Journey**",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "images/bo.png",
                    height: 100,
                  ),
                  Text(
                      "Step beyond the boundaries of traditional family journals. This book provides a transformative platform for exploring and strengthening your spiritual beliefs, infusing your family's journey with a higher purpose and deeper meaning."),
                ],
              ),

              Divider(),


              Column(
                children: [
                  Text(
                    "**Unleash the Legacy-Building Potential:**",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "images/bo.png",
                    height: 100,
                  ),
                  Text(
                      "Unlike any other journal, this book seamlessly blends faith, family, and financial empowerment. It offers a comprehensive and holistic approach to creating a lasting family legacy that transcends generations."),
                ],
              ),

              Divider(),
              Column(
                children: [
                  Text(
                    "**Secure a Prosperous Future:**",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "images/bo.png",
                    height: 100,
                  ),
                  Text(
                      "Gain the knowledge and tools to make informed financial decisions. This book equips your family with the insights needed to secure a prosperous future, ensuring financial well-being for yourselves and the generations that follow."),
                ],
              ),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
