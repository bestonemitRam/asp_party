import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlyerScreens extends StatefulWidget {
  final VideoMode video;

  const VideoPlyerScreens({super.key, required this.video});

  @override
  State<VideoPlyerScreens> createState() => _VideoPlyerScreensState();
}

class _VideoPlyerScreensState extends State<VideoPlyerScreens> {
  late YoutubePlayerController _controller;
  bool _showProgressIndicator = true;
  bool _isFullScreen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.video.video_url).toString(),
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          //hideControls: true,
          showLiveFullscreenButton: false),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          setState(() {
            _showProgressIndicator = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Video")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.transparent,
                  onEnded: (metaData) {
                    _controller.load(_controller.metadata.videoId);
                    // switchToNextVideo();
                  },
                  onReady: () {},
                ),
              ),
              
             
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Text(
                  widget.video.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Text(
                  widget.video.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
