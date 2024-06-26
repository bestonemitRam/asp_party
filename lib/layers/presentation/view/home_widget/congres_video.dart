import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/domain/controller/video_controller.dart';
import 'package:aps_party/layers/presentation/view/home_widget/video_widget.dart';
import 'package:aps_party/layers/presentation/view/video_player/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CongresVideo extends StatefulWidget {
  const CongresVideo({super.key});

  @override
  State<CongresVideo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CongresVideo> {
  final VideoController myController = Get.put(VideoController());

  final seachkController = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
    myController.fetchData('congressvideo');
   return Obx(() => myController.videoList.isNotEmpty
        ? SizedBox(
            child: ListView.builder(
                itemCount: myController.videoList.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 700),
                          child: VideoPlyerScreens(
                              video: myController.videoList.value[index]),
                        ),
                      );
                    },
                    child:
                        VideoWidget(video: myController.videoList.value[index]),
                  );
                }),
          )
        : Center());
  }
}
