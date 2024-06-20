import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/presentation/view/hom.dart';
import 'package:aps_party/layers/presentation/view/home_widget/agenda.dart';
import 'package:aps_party/layers/presentation/view/home_widget/member_description.dart';
import 'package:aps_party/layers/presentation/view/home_widget/treanding%20_photos.dart';
import 'package:aps_party/layers/presentation/view/home_widget/videos.dart';
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

  void clickTogglebutton(video_url) {
    switchToNextVideo(video_url);
    print("lfkjhkfjhgkl");
    setState(() {
      isOpenPlayer = !isOpenPlayer;
    });
  }

  double newY = 0.0;

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

  void switchToNextVideo(video_url) {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video_url).toString(),
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
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          // backgroundColor: Colors.black,
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
            physics: BouncingScrollPhysics(),
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
                  Obx(() => myController.videoList.isNotEmpty
                      ? Positioned(
                          top: 67.5.h,
                          left: 0,
                          right: 0,
                          // bottom: 1.h,
                          child: SizedBox(
                            height: 1000.h,
                            child: GridView.count(
                                // scrollDirection: Axis.horizontal,
                                // itemCount: myController.videoList.value.length,

                                shrinkWrap: true,
                                primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 0),
                                // crossAxisSpacing: 1.5,
                                // mainAxisSpacing: 18,
                                crossAxisCount: 2,
                                children: List.generate(
                                    myController.videoList.value.length,
                                    (index) {
                                  return InkWell(
                                    onTap: () {
                                      clickTogglebutton(myController
                                          .videoList.value[index].video_url);
                                    },
                                    child: ShowItemValue(
                                        video: myController
                                            .videoList.value[index]),
                                  );
                                })),
                          ))
                      : Center()),
                  Positioned(
                    top: 37.h,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 11.h,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: AppColors.primarycolor.withOpacity(0.6),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "ANNOUNCEMENTS",
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ),
                            ),
                            MarqueeList(
                              scrollDirection: Axis.horizontal,
                              scrollDuration: const Duration(seconds: 3),
                              children: [
                                for (int i = 0; i < breakingNews.length; i++)
                                  Text(
                                    breakingNews[i],
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white),
                                  ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Obx(
                    () => myController.myData.isNotEmpty
                        ? Positioned(
                            top: 49.h,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height: 20.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: myController.myData.value.length,
                                itemBuilder: (context, index) {
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
                  newY = yPosition + details.delta.dy;
                  // yPosition += details.delta.dy;

                  print("djshfgkhjdfgj  ${newX}  ${newY}");

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
                  width: newY > 50
                      ? MediaQuery.of(context).size.width / 2
                      : MediaQuery.of(context).size.width,
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
                                    clickTogglebutton('');
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
