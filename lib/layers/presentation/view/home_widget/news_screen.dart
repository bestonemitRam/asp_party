import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/controller/news_controller.dart';
import 'package:aps_party/layers/domain/controller/video_controller.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/news.dart';
import 'package:aps_party/layers/presentation/view/home_widget/full_news.dart';
import 'package:aps_party/layers/presentation/view/home_widget/member_description.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_Organizations.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_agenda_screen.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_description.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_foundations.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_history.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_president.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}
//AddPage(),

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  final NewsController controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.newsList.value.isNotEmpty
            ? SizedBox(
                child: ListView.builder(
                    itemCount: controller.newsList.length,
                    itemBuilder: (BuildContext context, index) {
                      var list = controller.newsList!.value[index];
                      return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                elevation: 0,
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: FullNews(
                                      list: list,
                                    ),
                                  );
                                });
                          },
                          child: widget_ui(list));
                    }),
              )
            : Center()));
  }

  Widget widget_ui(NewsModel list) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  list.title,
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
      ),
    );
  }
}
