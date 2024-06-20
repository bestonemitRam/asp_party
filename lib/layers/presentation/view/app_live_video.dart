import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/asp_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/bab_saheb_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/bjp_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/bsp_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/congres_video.dart';
import 'package:aps_party/layers/presentation/view/home_widget/single_live_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/controller/video_controller.dart';

class AppLiveVideo extends StatefulWidget {
  @override
  State<AppLiveVideo> createState() => _AppLiveVideoState();
}

class _AppLiveVideoState extends State<AppLiveVideo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final VideoController controller = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    controller.fetchData("livevideo");

    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        toolbarHeight: 2,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primarycolor,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.greyColor,
              unselectedLabelColor: AppColors.whiteColor,
              isScrollable: true,
              tabs: [
                Tab(text: 'Baba'),
                Tab(text: 'Leader'),
                Tab(text: 'BSP'),
                Tab(text: 'BJP'),
                Tab(text: 'Congres'),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                BabaSaheb(),
                ASPVideo(),
                BSPVideo(),
                BJPVideo(),
                CongresVideo()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
