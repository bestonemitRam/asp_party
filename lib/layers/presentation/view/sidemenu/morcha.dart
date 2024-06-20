import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/controller/morcha_c0ntroller.dart';
import 'package:aps_party/layers/domain/controller/video_controller.dart';
import 'package:aps_party/layers/domain/entity/morcha_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApsMorcha extends StatefulWidget {
  const ApsMorcha({super.key});

  @override
  State<ApsMorcha> createState() => _ApsMorchaState();
}

class _ApsMorchaState extends State<ApsMorcha> {
  final MorchaContoller myController = Get.put(MorchaContoller());

  @override
  Widget build(BuildContext context) {
    myController.fetchData();
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() => myController.videoList.isNotEmpty
            ? SizedBox(
                child: ListView.builder(
                    itemCount: myController.videoList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      var list = myController.videoList.value[index];
                      return widget_ui(list);
                    }),
              )
            : Center()));
  }

  Widget widget_ui(MorchaModel list) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(list.img_url), fit: BoxFit.fill)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                list.name,
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
                list.title,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromARGB(255, 98, 98, 98),
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                list.description,
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
