import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/news.dart';
import 'package:aps_party/layers/presentation/view/home_widget/WebviewWidgetUIScreen.dart';
import 'package:aps_party/layers/presentation/view/home_widget/loaderscreennew.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FullNews extends StatefulWidget {
  final NewsModel list;
  const FullNews({super.key, required this.list});

  @override
  State<FullNews> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FullNews> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.3,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 7,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(height: h * 0.04),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.list.img_url.toString(),
                    // height: 200,
                    width: double.infinity,
                    placeholder: (context, url) =>  Center(child: LoaderScreennew()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),

              
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.list.description,
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.rightToLeft,
                                  //     duration: Duration(milliseconds: 700),
                                  //     child: WebviewWidgetUIScreen(
                                  //       title: widget.list.name,
                                  //       url: widget.list.web_url,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 10),
                                  child: Text(
                                    "Read more...",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
