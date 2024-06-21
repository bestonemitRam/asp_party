// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/layers/presentation/view/addpage.dart';

import 'package:aps_party/layers/presentation/view/home_widget/news_screen.dart';
import 'package:aps_party/layers/presentation/view/app_live_video.dart';
import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/about_party.dart';

import 'package:aps_party/layers/presentation/view/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/utils/mytheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pgindex = 0;
  int _page = 0;

  // void selindex(int index) {
  //   if (index == 4) {
  //     shareApp();
  //   } else {
  //     setState(() {
  //       _page = index;
  //     });
  //   }
  // }


  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = 
  [
    Home(),
    AllVideo(),
    NewsScreen(),
    AppLiveVideo(),
  ];

  void shareApp() 
  {
    Share.share(
        'Check out this awesome Flutter package!',
        subject: 'Flutter Sharing'
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>
        [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_filled, size: 20),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.videocam_outlined, size: 20),
                Text(
                  "Video",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.newspaper, size: 20),
                Text(
                  "News",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  color: iconcolor,
                  AssetImage('assets/images/live.png'),
                  // size: 50,
                ),
                Text(
                  "ASP Live",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share, size: 20),
                Text(
                  "Share",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
       
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 4) {
            shareApp();
          } else {
            setState(() {
              _page = index;
            });
          }
        },
        letIndexChange: (index) => true,
      ),

      body: _pages[_page],
    );
  }
}
