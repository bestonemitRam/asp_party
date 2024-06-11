// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/layers/domain/entity/model/profiledata.dart';
import 'package:aps_party/layers/presentation/view/home_widget/treanding%20_photos.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
            child: SizedBox(
          height: 2000, // Adjust height as needed
          child: Stack(
            children: [
              Positioned(
                top: 0,
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
                              margin: EdgeInsets.only(left: 10.0, right: 10),
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
                top: 37.h,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 15.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: UsersData.users.length,
                    itemBuilder: (context, index) {
                      return ShowItem(
                        userStory: UsersData.users[index],
                      );
                    },
                  ),
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
                              onTap: () {},
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
           
           
            ],
          ),
        )));
  }
}

class ShowItem extends StatelessWidget {
  final UserProfile userStory;

  const ShowItem({super.key, required this.userStory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(userStory.url),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: Text(
            userStory.name,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}

class ShowItemValue extends StatelessWidget {
  final UserProfile userStory;
  const ShowItemValue({super.key, required this.userStory});

  // Widget testimon(TestimonialVideo testimonials) {

  //   return Container(
  //     width: 195,
  //     height: 121.18,
  //     child:
  //     Stack(
  //       children: [
  //         Positioned(
  //           left: 0,
  //           top: 0,
  //           child: Container(
  //             width: 195,
  //             height: 121,
  //             child: Stack(
  //               children: [
  //                 Positioned(
  //                     left: 0,
  //                     top: 0,
  //                     child: Container(
  //                       width: 195,
  //                       height: 121,
  //                       //  width: MediaQuery.of(context).size.width,
  //                       margin: EdgeInsets.only(left: 0.0.w, right: 0.w),
  //                       decoration: ShapeDecoration(
  //                           color: const Color(0xFFD9D9D9),
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(10)),
  //                           image: testimonials.status != null
  //                               ? DecorationImage(
  //                                   image: NetworkImage(testimonials
  //                                       .thumbnail_image
  //                                       .toString()),
  //                                   fit: BoxFit.cover)
  //                               : DecorationImage(
  //                                   image: AssetImage(
  //                                       'assets/images/clients.jpeg'))),
  //                     ))
  //               ],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           left: 0,
  //           top: 0,
  //           child: Container(
  //             width: 194.52,
  //             height: 121.18,
  //             decoration: ShapeDecoration(
  //               gradient: LinearGradient(
  //                 begin: const Alignment(-0.00, -1.00),
  //                 end: const Alignment(0, 1),
  //                 colors: [Colors.black.withOpacity(0), Colors.black],
  //               ),
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(9)),
  //               shadows: [
  //                 BoxShadow(
  //                   color: Color(0x3F000000),
  //                   blurRadius: 4,
  //                   offset: Offset(0, 4),
  //                   spreadRadius: 0,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           left: 9.57,
  //           top: 88.49,
  //           child: Container(
  //             width: 165.02,
  //             height: 27.11,
  //             child: Stack(
  //               children: [
  //                 Positioned(
  //                   left: -0,
  //                   top: 12.76,
  //                   child: SizedBox(
  //                     // width: 165.02,
  //                     height: 14.35,
  //                     child: Text(
  //                       testimonials.title.toString(),
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 8,
  //                         fontFamily: 'Segoe UI',
  //                         fontWeight: FontWeight.w600,
  //                         height: 0,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   left: 0,
  //                   top: 0,
  //                   child: SizedBox(
  //                     width: 22.74,
  //                     height: 14.76,
  //                     child: Text(
  //                       '',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 9,
  //                         fontFamily: 'Segoe UI',
  //                         fontWeight: FontWeight.w600,
  //                         height: 0,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           left: 70.95,
  //           top: 34.28,
  //           child: Container(
  //             width: 52.62,
  //             height: 52.62,
  //             child: SvgPicture.asset("assets/images/play.svg"),
  //           ),
  //         ),
  //       ],
  //     ),

  //   );
  // }

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

class ShowPosts extends StatefulWidget {
  final UserProfile userPost;

  const ShowPosts({super.key, required this.userPost});

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  bool isClicked = false;
  void fav() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.userPost.url),
                  ),
                ),
                Text(
                  widget.userPost.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.share,
                                                size: 28,
                                              )),
                                        ),
                                        Text(
                                          "Link",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/link.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Link",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/save.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Save",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/qr-code.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "QR Code",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: ImageIcon(AssetImage('assets/images/menu.png')))
              ],
            )
          ],
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(widget.userPost.url),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: fav,
                    child: isClicked
                        ? Icon(
                            Icons.favorite_border_outlined,
                            size: 35,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 35,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageIcon(
                    AssetImage(
                      'assets/images/coment.png',
                    ),
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageIcon(
                    AssetImage(
                      'assets/images/send.png',
                    ),
                    size: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  ImageIcon(
                    AssetImage(
                      'assets/images/save.png',
                    ),
                    size: 35,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
