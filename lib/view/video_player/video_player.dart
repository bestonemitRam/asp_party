import 'package:aps_party/model/profiledata.dart';
import 'package:aps_party/view/home_widget/treanding%20_photos.dart';
import 'package:aps_party/view/sidemenu/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double xPosition = 0;
  double yPosition = 0;
  int currentVideoIndex = 0;
  var isOpenPlayer = false;

  void clickTogglebutton() {
    switchToNextVideo();
    print("lfkjhkfjhgkl");
    setState(() {
      isOpenPlayer = !isOpenPlayer;
    });
  }

  bool _showProgressIndicator = true;

  late YoutubePlayerController _controller;

  void switchToNextVideo() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=umhl2hakkcY&t=23s')
          .toString(),
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
    ;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: MenuBarScreen(),
        //drawerScrimColor: Colors.white,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "ASP  ",
            style: TextStyle(
                fontFamily: 'Fontspring-DEMO-blue_vinyl_regular_ps_ot',
                fontSize: 30),
          ),
          actions: [
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage('assets/images/chat.png'),
                    size: 20,
                  ),
                )
              ],
            )
          ],
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 2000,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 15.h,
                      width: 15.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: UsersData.users.length,
                        itemBuilder: (context, index) {
                          return TreandingPhotos(
                            userStory: UsersData.users[index],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16.h,
                    left: 0,
                    right: 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 20.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: UsersData.users
                          .map(
                            (item) => Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      EdgeInsets.only(left: 10.0, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(item.url),
                                          fit: BoxFit.fill)),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Positioned(
                    top: 53.h,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 1000,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: UsersData.users.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 15.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: UsersData.users.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    clickTogglebutton();
                                  },
                                  child: ShowItemValue(
                                    userStory: UsersData.users[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 37.h,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 15.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: UsersData.users.length,
                        itemBuilder: (context, index) {
                          return TreandingPhotos(
                            userStory: UsersData.users[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isOpenPlayer)
            Positioned(
              left: xPosition,
              top: yPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  //xPosition += details.delta.dx;
                  double newX = xPosition + details.delta.dx;
                  double newY = yPosition + details.delta.dy;
                  // yPosition += details.delta.dy;

                  if (newX >= 0 &&
                      newX <= screenWidth - 50 &&
                      newY >= 0 &&
                      newY <= screenHeight - 80) {
                    setState(() {
                      xPosition = newX;
                      yPosition = newY;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 250,
                  color: Colors.amber,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
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
                      ),
                      Positioned(
                          top: 1,
                          right: 10,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    clickTogglebutton();
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    weight: Device.width,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _controller.toggleFullScreenMode();
                                  },
                                  icon: Icon(
                                    Icons.fullscreen,
                                    weight: Device.width,
                                    size: 40,
                                    color: Colors.white,
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
        ]));
  }
}

class ShowItemValue extends StatelessWidget {
  final UserProfile userStory;
  const ShowItemValue({super.key, required this.userStory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width / 2,
            margin: EdgeInsets.only(left: 10.0, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(userStory.url), fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          left: 10.h,
          top: 3.5.h,
          child: Container(
            width: 52.62,
            height: 52.62,
            child: SvgPicture.asset("assets/images/play.svg"),
          ),
        ),
      ],
    );
  }
}
