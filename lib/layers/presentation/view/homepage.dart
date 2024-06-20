// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/layers/presentation/view/addpage.dart';
import 'package:aps_party/layers/presentation/view/hom.dart';
import 'package:aps_party/layers/presentation/view/home_widget/news_screen.dart';
import 'package:aps_party/layers/presentation/view/app_live_video.dart';
import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/about_party.dart';
import 'package:aps_party/layers/presentation/view/userprofile.dart';
import 'package:aps_party/layers/presentation/view/video_player/video_player.dart';
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
  void selindex(int index) {
    if (index == 4) {
      shareApp();
    } else {
      setState(() {
        pgindex = index;
      });
    }
  }

  final List<Widget> pages = [
    DraggableWidget(),
    AllVideo(),
    NewsScreen(),
    AppLiveVideo(),

  ];
  void shareApp() {
    Share.share('Check out this awesome Flutter package!',
        subject: 'Flutter Sharing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.amber),
          unselectedItemColor: Colors.black,
          iconSize: 30,
          onTap: selindex,
          currentIndex: pgindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: iconcolor,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.videocam_outlined,
                  color: iconcolor,
                ),
                label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: iconcolor,
                ),
                label: "News"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  color: iconcolor,
                  AssetImage('assets/images/live.png'),
                  // size: 50,
                ),
                label: "ASP Live"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.share,
                  color: iconcolor,
                ),
                label: "Share")
          ]),
      body: pages[pgindex],
    );
  }
}
