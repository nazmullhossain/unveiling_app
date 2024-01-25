import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
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
      child: Column(children: [
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
                      (item) => Column(
                        children: [
                          Text(
                            "“Walking by Faith: Family Journey Journal Diary \n Family Journey Journal Diary \n distance further than that between east and west.”",
                            style: GoogleFonts.hind(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
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


      ]),
    );

  }
}