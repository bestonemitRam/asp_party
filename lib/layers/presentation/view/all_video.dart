// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:aps_party/layers/presentation/view/home_widget/videos.dart';
import 'package:aps_party/layers/presentation/view/video_player/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllVideo extends StatefulWidget {
  @override
  State<AllVideo> createState() => _AllVideoState();
}

class _AllVideoState extends State<AllVideo> {
  final MyController myController = Get.put(MyController());

  final seachkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => myController.videoList.isNotEmpty
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: seachkController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0),
                            // crossAxisSpacing: 1.5,
                            // mainAxisSpacing: 18,
                            crossAxisCount: 2,
                            children: List.generate(
                                myController.videoList.value.length, (index) {
                              return myController.videoList.value[index].title!
                                      .toLowerCase()
                                      .contains(seachkController.text)
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 700),
                                            child: VideoPlyerScreens(
                                                video: myController
                                                    .videoList.value[index]),
                                          ),
                                        );
                                      },
                                      child: ShowItemValue(
                                          video: myController
                                              .videoList.value[index]),
                                    )
                                  : Center();
                            })),
                      ),
                    ],
                  ),
                ),
              )
            : Center()));
 

  }
}

