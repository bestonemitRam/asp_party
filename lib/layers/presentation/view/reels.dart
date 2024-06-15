import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/bjp_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/bsp_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/congres_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Reels extends StatefulWidget {
  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50), // To add some space at the top
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Leader'),
              Tab(text: 'BSP'),
              Tab(text: 'BJP'),
              Tab(text: 'Congres'),
            ],
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [AllVideo(), BSPVideo(), BJPVideo(), CongresVideo()],
            ),
          ),
        ],
      ),
    );
  }
}
