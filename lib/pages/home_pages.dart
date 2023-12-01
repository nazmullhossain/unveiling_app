import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:video_app/pages/video_play_pages.dart';

import '../model/video_model.dart';
import '../service/video_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoServices videoServices = VideoServices();
  List<Results>? disListData;

  fetchDlistData() async {
    disListData = await videoServices.getVideoServices(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDlistData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: disListData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trending Video",
                        style: GoogleFonts.inter(
                            color: Color(0xFF1A202C),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                            itemCount: disListData!.length,
                            itemBuilder: (context, index) {
                              final data = disListData![index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => VideoPlayPage(
                                                videoModel: data,
                                              )));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      height: 192,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${data.thumbnail}"))),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.only(
                                              bottom: 10, right: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black),
                                          child: Text(
                                            "${data.duration}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.network(
                                                "${data.channelImage}",
                                                width: 40,
                                                height: 40,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                              maxLines: 1,
                                              "${data.title}",
                                              style: GoogleFonts.hindSiliguri(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(
                                            left: 80,
                                            bottom: 20
                                          ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${data.viewers} views",
                                            style: GoogleFonts.inter(
                                                color: Color(0xFF718096),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),

                                      Text(data.dateAndTime!.length > 10 ? '${data.dateAndTime!.substring(0, 10)}' : data.dateAndTime.toString(),
                                        style: GoogleFonts.inter(
                                                     color: Color(0xFF718096),
                                                     fontSize: 13,
                                                     fontWeight: FontWeight.w400),
                                      )
                                      // Text(
                                      //       "Feb 21, 2021",
                                      //       style: GoogleFonts.inter(
                                      //           color: Color(0xFF718096),
                                      //           fontSize: 13,
                                      //           fontWeight: FontWeight.w400),
                                      //     )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
