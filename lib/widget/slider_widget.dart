import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/database_controller.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  DatabaseService databaseService = DatabaseService();
  Stream?emp;
  getData()async{
    emp=await databaseService.getSlider("slider");
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  List imageList = [
    {"id": 1, "image_path": '“As the author of this transformative project, I am deeply grateful \nto the entire community that brought it to life. This endeavor \n been instrumental in shaping this book..”'},
    {"id": 2, "image_path": 'images/welcome banner.png'},
    {"id": 3, "image_path": 'images/welcome banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: StreamBuilder(
        stream: emp,
        builder: (context, AsyncSnapshot sn) {

          return sn.hasData? Column(children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => ListView.builder(
                            // scrollDirection: Axis.horizontal,

                            itemCount: sn.data.docs.length,
                            itemBuilder: (context,index){
                              DocumentSnapshot ds=sn.data.docs[index];
                            return Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(textAlign: TextAlign.justify,"${ds["slider"]}", style: GoogleFonts.hind(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),)  ,
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "[ Terri C. Colon ]",
                                    style: GoogleFonts.hindSiliguri(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  )


                                ],
                              ),
                            );
                          },)
                    )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 144,

                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: imageList.asMap().entries.map((entry) {
                //       return GestureDetector(
                //         onTap: () => carouselController.animateToPage(entry.key),
                //         child: Container(
                //           width: currentIndex == entry.key ? 17 : 7,
                //           height: 7.0,
                //           margin: const EdgeInsets.symmetric(
                //             horizontal: 3.0,
                //           ),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               color:
                //               currentIndex == entry.key ? Color(0xff29B0B0) : Color(0xffB4C7DE)),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),


          ]): Container();
        }
      ),
    );

  }
}