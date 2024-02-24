
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentTablePage extends StatelessWidget {
  const ContentTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xff48043F),
        centerTitle: true,
        title:   Text(
          "Table of Contents ",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle:FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Color(0xff48043F),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(

                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   Text("Month 1: Faith...............................",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   Text("Walking in Faith: Family Diary Journal\nWeek 1: Reflecting on Faith in Family History \nWeek 2: Personal Experiences and Challenges\nWeek 3: Impact of Faith on Family Values\nWeek 4: Decision-Making and Future Goals...",style: TextStyle(fontSize: 15),),
              
                     SizedBox(height: 10,),
                      Text("Month 2:Family...............................",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Roots of Strength: Family Journal Diary\nWeek 1: Celebrating Family Milestones and Traditions\nWeek 2: Wisdom from Older Generations\nWeek 3: Exploring Family Bond and Resilience\nWeek 4: Personal Experiences and Reflections.",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 10,),
                      Text("Month 3: Finance............................",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Building Generational Wealth: Family Financial Journal Diary\n Week 1: Understanding Wealth and Financial Challenges.\nWeek 2: Inspiring Entrepreneurs and Success Stories\nWeek 3: Strategies for Financial Success and Empowerment\nWeek 4: Family Financial Values and Goals....",style: TextStyle(fontSize: 15),),
              
                      SizedBox(height: 10,),
                      Text("Month 4: Reflection Time............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("The Power of Reflection.",style: TextStyle(fontSize: 15),),
              
              
                      SizedBox(height: 10,),
                      Text("Month 5: Faith............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Walking by Faith: Family Journey Journal Diary\nWeek 1: Family Journey Journal Diary\nWeek 2: Overcoming Challenges Through Faith\nWeek 3: Personal Stories of Faith and Spiritual Growth\nWeek 4: Passing Down Faith to Future Generations..",style: TextStyle(fontSize: 15),),


                      SizedBox(height: 10,),
                      Text("Month 6: Family............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Our Legacy Unveiled: Family Heritage Journal Diary\nWeek 1: Our Legacy Unveiled: Family Heritage Journal Diary\nWeek 2: Notable Family Members and Their Contributions\nWeek 3: Preserving Family Traditions and Cultural Legacy\nWeek 4: Reflection and Future Preservation...",style: TextStyle(fontSize: 15),),
                      Text("Month 7: Finance............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Financial Pathways: Family Journey to Prosperity Journal Diary\nWeek 1: Assessing Current Financial Situation\nWeek 2: Strategies for Financial Growth and Stability\nWeek 3: Personal Stories of Financial Achievements andSetbacksWeek 4: Financial Literacy and Education",style: TextStyle(fontSize: 15),),

                      SizedBox(height: 10,),
                      Text("Month 8: Reevaluating............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("The Importance of Reevaluating.",style: TextStyle(fontSize: 15),),



                      SizedBox(height: 10,),
                      Text("Month 9: Family............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text( " Title: Chosen Family: Embracing Non-Biological Connections\nWeek 1: Understanding the Concept of Chosen Family\nWeek 2: Importance of Community and Support Systems\nWeek 3: Stories of Mentorship and Influential Individuals\nWeek 4: Reflecting on Values and Lessons Learned",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 10,),
                      Text("Month 10: Faith.............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Journey of Faith: Embracing Our Beliefs as a Family\nWeek 1: Exploring the Role of Faith in Family History\nWeek 2: Personal Stories of Faith and Transformation\nWeek 3: Cultivating a Faith-Filled Lifestyle\nWeek 4: Reflection on Faith's Impact and Future Growth",style: TextStyle(fontSize: 15),),


                      SizedBox(height: 10,),
                      Text("Month 11: Finance.............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Building Generational Wealth: Family Finance Journey Journal Diary\nWeek 1: Reviewing Financial Goals and Progress\nWeek 2: Exploring New Financial Strategies andOpportunities\nWeek 3: Personal Stories of Triumphs and Challenges\nWeek 4: Reflecting on Financial Stability and Overall WellBeingDecember Embracing Rejuvenation\nWhy Embracing Rejuvenation Matters",style: TextStyle(fontSize: 15),),


                      SizedBox(height: 10,),
                      Text("Month 12: Family (Bonus)............",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Journey of Identity, Heritage, and Growth: Celebrating our Family's Achievements\nWeek 1: Reflecting on the 11-Month Journey\nWeek 2: Celebrating Family Achievements\nWeek 3: Mapping the Path Forward\nWeek 4: Reflection and Moving Forward Conclusion\nThe Legacy Unveiled: A Journey of Faith, Family, and Finance",style: TextStyle(fontSize: 15),),
                      Text(" Terri Colon.")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
