import 'package:aps_party/layers/domain/controller/home_controller.dart';
import 'package:aps_party/layers/presentation/view/home_widget/video_widget.dart';
import 'package:aps_party/layers/presentation/view/video_player/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BJPVideo extends StatefulWidget {
  const BJPVideo({super.key});

  @override
  State<BJPVideo> createState() => _BJPVideoState();
}

class _BJPVideoState extends State<BJPVideo> {
  final MyController myController = Get.put(MyController());

  final seachkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => myController.videoList.isNotEmpty
        ? SizedBox(
            child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 1,
                children:
                    List.generate(myController.videoList.value.length, (index) {
                  return myController.videoList.value[index].title!
                          .toLowerCase()
                          .contains(seachkController.text)
                      ? InkWell(
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
                          child: VideoWidget(
                              video: myController.videoList.value[index]),
                        )
                      : Center();
                })),
          )
        : Center());
  }
}
