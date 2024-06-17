import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApsMorcha extends StatefulWidget {
  const ApsMorcha({super.key});

  @override
  State<ApsMorcha> createState() => _ApsMorchaState();
}

class _ApsMorchaState extends State<ApsMorcha> {
  final VideoController myController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    myController.fetchData('congressvideo');
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() => myController.videoList.isNotEmpty
            ? SizedBox(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return widget_ui();
                    }),
              )
            : Center()));
  }

  Widget widget_ui() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(""), fit: BoxFit.fill)),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2.5,
                  top: MediaQuery.of(context).size.height / 10,
                  child: Container(
                    width: 40.62,
                    height: 40.62,
                    child: SvgPicture.asset(
                      "assets/images/play.svg",
                      color: Color.fromARGB(255, 246, 243, 243),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'description',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromARGB(255, 98, 98, 98),
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
