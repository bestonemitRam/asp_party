import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberDescription extends StatefulWidget {
  final BannerMember userStory;
  const MemberDescription({super.key, required this.userStory});

  @override
  State<MemberDescription> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MemberDescription> {
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
              padding: EdgeInsets.all(10),
              // height: h * 0.45,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 40,
                    height: 7,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.04,
                      ),
                      SizedBox(
                        width: 2.h,
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 35.h,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 1.0, right: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(widget.userStory.url),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Positioned(
                            // top: 2.h,
                            left: 1.h,
                            // right: 0,
                            bottom: 2.h,
                            child: SizedBox(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: AppColors.primarycolor.withOpacity(0.6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  widget.userStory.name,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 04, vertical: 10),
                        child: Text(
                          widget.userStory.description,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
    ;
  }
}
