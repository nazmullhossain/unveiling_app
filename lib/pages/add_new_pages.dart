import 'package:flutter/material.dart';

import '../controller/database_controller.dart';
import '../widget/text_filed.dart';
class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  DatabaseService databaseService=DatabaseService();
  TextEditingController month=TextEditingController();
  TextEditingController month_title=TextEditingController();
  TextEditingController weak1=TextEditingController();
  TextEditingController weak2=TextEditingController();
  TextEditingController weak3=TextEditingController();
  TextEditingController weak4=TextEditingController();
  TextEditingController day1=TextEditingController();
  TextEditingController day2=TextEditingController();
  TextEditingController day3=TextEditingController();
  TextEditingController day4=TextEditingController();
  TextEditingController day5=TextEditingController();
  TextEditingController day6=TextEditingController();
  TextEditingController day7=TextEditingController();
  TextEditingController day8=TextEditingController();
  TextEditingController day9=TextEditingController();
  TextEditingController day10=TextEditingController();
  TextEditingController day11=TextEditingController();
  TextEditingController day12=TextEditingController();
  TextEditingController day13=TextEditingController();
  TextEditingController day14=TextEditingController();
  TextEditingController day15=TextEditingController();
  TextEditingController day16=TextEditingController();
  TextEditingController day17=TextEditingController();
  TextEditingController day18=TextEditingController();
  TextEditingController day19=TextEditingController();
  TextEditingController day20=TextEditingController();
  TextEditingController day21=TextEditingController();
  TextEditingController day22=TextEditingController();
  TextEditingController day23=TextEditingController();
  TextEditingController day24=TextEditingController();
  TextEditingController day25=TextEditingController();
  TextEditingController day26=TextEditingController();
  TextEditingController day27=TextEditingController();
  TextEditingController day28=TextEditingController();
  TextEditingController day29=TextEditingController();
  TextEditingController day30=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 40, //change size on your need
          color: Colors.white, //change color on your need
        ),
        backgroundColor: Color(0xff003300),
        // backgroundColor: const Color.fromRGBO(26, 164, 131, 1),
        title: Text("Add New",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomField(controller: month, hintText: 'month',),
                SizedBox(height: 10,),
                CustomField(controller: month_title, hintText: 'month_title',),
                SizedBox(height: 10,),
                CustomField(controller: weak1, hintText: 'weak1',),
                SizedBox(height: 10,),
                CustomField(controller: weak2, hintText: 'weak2',),
                SizedBox(height: 10,),
                CustomField(controller: weak3, hintText: 'weak3',),
                SizedBox(height: 10,),
                CustomField(controller: weak4, hintText: 'weak4',),
                SizedBox(height: 10,),
                CustomField(controller: day1, hintText: 'day1',),
                SizedBox(height: 10,),
                CustomField(controller: day2, hintText: 'day2',),
                SizedBox(height: 10,),
                CustomField(controller: day3, hintText: 'day3',),
                SizedBox(height: 10,),
                CustomField(controller: day4, hintText: 'day4',),
                SizedBox(height: 10,),
                CustomField(controller: day5, hintText: 'day5',),
                SizedBox(height: 10,),
                CustomField(controller: day6, hintText: 'day6',),
                SizedBox(height: 10,),
                CustomField(controller: day7, hintText: 'day7',),
                SizedBox(height: 10,),
                CustomField(controller: day8, hintText: 'day8',),
                SizedBox(height: 10,),
                CustomField(controller: day9, hintText: 'day9',),
                SizedBox(height: 10,),
                CustomField(controller: day10, hintText: 'day10',),
                SizedBox(height: 10,),
                CustomField(controller: day11, hintText: 'day11',),
                SizedBox(height: 10,),
                CustomField(controller: day12, hintText: 'day12',),
                SizedBox(height: 10,),
                CustomField(controller: day13, hintText: 'day13',),
                SizedBox(height: 10,),
                CustomField(controller: day14, hintText: 'day14',),
                SizedBox(height: 10,),
                CustomField(controller: day15, hintText: 'day15',),
                SizedBox(height: 10,),
                CustomField(controller: day16, hintText: 'day16',),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                CustomField(controller: day17, hintText: 'day17',),
                SizedBox(height: 10,),
                CustomField(controller: day18, hintText: 'day18',),
                SizedBox(height: 10,),
                CustomField(controller: day19, hintText: 'day19',),
                SizedBox(height: 10,),
                CustomField(controller: day20, hintText: 'day20',),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                CustomField(controller: day21, hintText: 'day21',),
                SizedBox(height: 10,),
                CustomField(controller: day22, hintText: 'day22',),
                SizedBox(height: 10,),
                CustomField(controller: day23, hintText: 'day23',),
                SizedBox(height: 10,),
                CustomField(controller: day24, hintText: 'day24',),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                CustomField(controller: day25, hintText: 'day25',),
                SizedBox(height: 10,),
                CustomField(controller: day26, hintText: 'day26',),
                SizedBox(height: 10,),
                CustomField(controller: day27, hintText: 'day27',),
                SizedBox(height: 10,),
                CustomField(controller: day28, hintText: 'day28',),

                SizedBox(height: 10,),
                CustomField(controller: day29, hintText: 'day29',),
                SizedBox(height: 10,),
                CustomField(controller: day30, hintText: 'day30',),
                SizedBox(height: 10,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xff003300),
                      padding: EdgeInsets.symmetric(horizontal: 100),
                    ),
                    onPressed: (){
                      send();
                    }, child: Text("Submit ",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 80,),

              ],
            ),
          ),
        ),
      ),
    );
  }
  send()async{
    Map<String,dynamic>data={
      "month":month.text,
      "month_title":month_title.text,
      "weak1":weak1.text,
      "weak2":weak2.text,
      "weak3":weak3.text,
      "weak4":weak4.text,
      "day1":day1.text,
      "day2":day2.text,
      "day3":day3.text,
      "day4":day4.text,
      "day5":day5.text,
      "day6":day6.text,
      "day7":day7.text,
      "day8":day8.text,
      "day9":day9.text,
      "day11":day10.text,
      "day12":day11.text,
      "day13":day12.text,
      "day14":day13.text,
      "day15":day14.text,
      "day16":day15.text,
      "day17":day17.text,
      "day18":day18.text,
      "day19":day19.text,
      "day20":day20.text,
      "day21":day21.text,
      "day22":day22.text,
      "day23":day23.text,
      "day24":day24.text,
      "day25":day25.text,
      "day26":day26.text,
      "day27":day27.text,
      "day28":day28.text,
      "day29":day29.text,
      "day30":day30.text,

    };
  await  databaseService.addData(data, "book");
  }
}
