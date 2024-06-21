import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/domain/controller/video_controller.dart';
import 'package:aps_party/layers/presentation/view/home_widget/video_widget.dart';
import 'package:aps_party/layers/presentation/view/video_player/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BabaSaheb extends StatefulWidget {
  const BabaSaheb({super.key});

  @override
  State<BabaSaheb> createState() => _BJPVideoState();
}

class _BJPVideoState extends State<BabaSaheb> {
  final VideoController myController = Get.put(VideoController());

  final seachkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myController.fetchData('babasahab');
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
