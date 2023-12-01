import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/video_model.dart';

class VideoPlayPage extends StatefulWidget {
  final Results videoModel;
  VideoPlayPage({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.videoModel.manifest.toString())
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset("images/Frame (1).png"),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 211,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // image: DecorationImage(image: AssetImage("images/Frame (1).png"))
                        ),
                    child: CustomVideoPlayer(
                        customVideoPlayerController:
                            _customVideoPlayerController),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.videoModel.title}",
                      style: GoogleFonts.hindSiliguri(
                          color: Color(0xFF1A202C),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.videoModel.viewers} views",
                          style: GoogleFonts.inter(
                              color: Color(0xFF718096),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${widget.videoModel.channelId} days ago",
                          style: GoogleFonts.inter(
                              color: Color(0xFF718096),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 125,
                          height: 56,
                          // padding:EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Image.asset(
                                  "images/love.png",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Mash Allah ${widget.videoModel.channelSubscriber}k",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 56,
                          width: 73,
                          padding: const EdgeInsets.only(top: 5),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/like.png",
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Like ${widget.videoModel.channelSubscriber}k",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 59,
                          height: 56,
                          padding: const EdgeInsets.only(top: 5),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/share.png",
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Share",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 64,
                          height: 56,
                          padding: const EdgeInsets.only(top: 5),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/flag.png",
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Report",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  "${widget.videoModel.channelImage}",
                                  height: 40,
                                  width: 40,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.videoModel.channelName}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, bottom: 2),
                                    child: Text(
                                      "${widget.videoModel.channelSubscriber} Subscribers",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff718096),
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 109,
                          height: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF3898FC)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/plus.png",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Subscribe",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE2E8F0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Comments ${widget.videoModel.channelSubscriber}k",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF718096)),
                        ),
                        Image.asset(
                          "images/arrow.png",
                          height: 24,
                          width: 24,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 47,
                      width: 346,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFE2E8F0))),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Add Comment",
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCBD5E0),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.send,
                              color: Color(0xFFA0AEC0),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              widget.videoModel.channelImage.toString(),
                              height: 32,
                              width: 32,
                            )),
                        RichText(
                            text: TextSpan(
                                text: "  ${widget.videoModel.channelName}",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                children: [
                              TextSpan(
                                text: "  ${widget.videoModel.viewers} days ago",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF718096),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400),
                              )
                            ]))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "${widget.videoModel.title}",
                        style: GoogleFonts.hindSiliguri(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE2E8F0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
