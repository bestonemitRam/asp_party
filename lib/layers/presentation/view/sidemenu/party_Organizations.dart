import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartyOrganization extends StatefulWidget {
  const PartyOrganization({super.key});

  @override
  State<PartyOrganization> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PartyOrganization> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                          image: AssetImage(AppImages.chandra),
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
                                    color:
                                        AppColors.primarycolor.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: const Text(
                                      "National Team",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Text(
                              "Advocate Chandrashekhar Azad",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Text(
                              // widget.userStory.description,
                              'Advocate Chandrashekhar Azad, (born 3 December 1986) is an Indian Ambedkarite lawyer turned activist. He is the co-founder and national president of Bhim Army. In February 2021, the TIME magazine featured him in it’s Annual list of “100 emerging leaders who are shaping the future”',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
