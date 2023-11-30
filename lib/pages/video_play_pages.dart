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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
