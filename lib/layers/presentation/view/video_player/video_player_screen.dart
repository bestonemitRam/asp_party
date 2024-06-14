import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.transparent,
                onEnded: (metaData) {
                  _controller.load(_controller.metadata.videoId);
                  // switchToNextVideo();
                },
                onReady: () {
                  // videoIds.add('');
                  //switchToNextVideo();
                },
              ),
            ),
            // Positioned(
            //     top: 1,
            //     left: 10,
            //     child: InkWell(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         child: Icon(
            //           Icons.clear,
            //           weight: Device.width,
            //           size: 40,
            //           color: Colors.white,
            //         )))
          ],
        ),
      ),
    );
  }
}
