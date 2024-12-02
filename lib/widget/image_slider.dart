import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [

    {"id": 2, "image_path": 'images/c1.png'},
    {"id": 3, "image_path": 'images/c2.png'},
    {"id": 4, "image_path": 'images/c3.png'},
    {"id": 5, "image_path": 'images/c5.png'},
    {"id": 6, "image_path": 'images/c6.png'},
  ];
  final CarouselSliderController  carouselController = CarouselSliderController ();
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
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                                            item['image_path'],
                                            fit: BoxFit.cover,
                                            height: 144,
                                            width: double.infinity,
                        
                        
                                          ),
                      ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 250,

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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                          currentIndex == entry.key ? Color(0xff1479FF) : Color(0xffB4C7DE)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),


      ]),
    );

  }
}