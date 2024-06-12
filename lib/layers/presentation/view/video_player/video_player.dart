import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:aps_party/layers/presentation/view/home_widget/agenda.dart';
import 'package:aps_party/layers/presentation/view/home_widget/member_description.dart';
import 'package:aps_party/layers/presentation/view/home_widget/treanding%20_photos.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:marquee/marquee.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  final MyController myController = Get.put(MyController());
  double xPosition = 0;
  double yPosition = 0;
  int currentVideoIndex = 0;
  var isOpenPlayer = false;
  bool _useRtlText = false;

  void clickTogglebutton() {
    switchToNextVideo();
    print("lfkjhkfjhgkl");
    setState(() {
      isOpenPlayer = !isOpenPlayer;
    });
  }

  var breakingNews = [
    "नगीना लोकसभा से प्रत्यासी चंद्रशेखर आज़ाद रावण ने अपना ब्यौरा प्रस्तुत किया",
    " : नगीना लोकसभा क्षेत्र में डोर टू डोर जनसंपर्क कर जनता से आशीर्वाद",
    " - २०२४ लोकसभा चुनाव",
    " : दलितों के 'रावण' की ये है कहानी, जेल से बाहर आते ही सरकार से ले लिया मोर्चा",
    " : भीम आर्मी के आजाद का नाम ‘TIME 100 नेक्स्ट’ लिस्ट में",
    " : Bhim Army chief Chandra Shekhar Aazad, 5 Indian-origin persons, feature in TIME magazine's list of 100 emerging leaders"
  ];

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
                        itemCount: BannerMemberData.member.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  elevation: 0,
                                  context: context,
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: MemberDescription(
                                        userStory:
                                            BannerMemberData.member[index],
                                      ),
                                    );
                                  });
                            },
                            child: TreandingPhotos(
                              userStory: BannerMemberData.member[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11.h,
                    left: 0,
                    right: 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 30.h,
                        aspectRatio: 16 / 9,
                        //  viewportFraction: 0.8,
                        initialPage: 0,
                        // enableInfiniteScroll: true,

                        disableCenter: true,
                        viewportFraction: 1.0,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        //  autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        //  enlargeFactor: 0.3,

                        scrollDirection: Axis.horizontal,
                      ),
                      items: UsersData.users
                          .map(
                            (item) => Column(
                              children: [
                                Container(
                                  height: 25.h,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(left: 1.0, right: 1),
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
                    top: 60.h,
                    left: 0,
                    right: 0,
                    // bottom: 1.h,
                    child: SizedBox(
                      height: 10000,
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
                    top: 38.h,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: AppColors.primarycolorYellow.withOpacity(0.6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "ANNOUNCEMENTS",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            MarqueeList(
                              scrollDirection: Axis.horizontal,
                              scrollDuration: const Duration(seconds: 3),
                              children: [
                                for (int i = 0; i < breakingNews.length; i++)
                                  Text(
                                    breakingNews[i],
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Obx(
                    () => myController.myData.isNotEmpty
                        ? Positioned(
                            top: 50.h,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height: 50.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: myController.myData.value.length,
                                itemBuilder: (context, index) {
                                  print("klfjghkjjkfg");
                                  var item = myController.myData[index];
                                  return PartyAgenda(
                                    myData: myController.myData[index],
                                  );
                                },
                              ),
                            ),
                          )
                        : Center(),
                  )
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
                          // height: 150,
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
  String getThumbnailUrl(String videoUrl) {
    final uri = Uri.parse(videoUrl);
    final videoId = uri.queryParameters['v'] ?? uri.pathSegments.last;
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: .3, vertical: 10),
          child: Container(
            height: 19.h,
            width: MediaQuery.of(context).size.width / 2,
            margin: EdgeInsets.only(left: 10.0, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                image: DecorationImage(
                    //  image: AssetImage(userStory.url),
                    image: NetworkImage(getThumbnailUrl(
                        'https://www.youtube.com/watch?v=umhl2hakkcY&t=23s')),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          left: 12.h,
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
