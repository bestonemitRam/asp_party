import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AboutApp> {
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
                                      "About The application",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                              ),
                              Positioned(
                                top: 4.h,
                                left: 1.h,
                                // right: 0,
                                // bottom: 2.h,
                                child: SizedBox(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color:
                                        const Color.fromARGB(255, 181, 181, 189)
                                            .withOpacity(0.6),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_back)),
                                )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Text(
                              'This mobile application designed to support and amplify the mission of Bhim Army. Given your dedication to social justice and empowering marginalized communities, I believe a mobile app can significantly enhance your efforts by providing a digital platform to reach a wider audience, mobilize supporters, and deliver essential services',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Text(
                              "The primary objectives of the Bhim Army mobile application",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Community Engagement :',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '        Foster a sense of community among supporters  \n        Facilitate communication and collaboration.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2. Information Dissemination: :',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'i- Provide updates on Bhim Army'
                                    "s activities and initiatives.  \n ii- Share educational content related to social justice, legal rights, and empowerment.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '3. Support Services:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "i- Offer legal aid and support resources.  \n ii- Connect individuals with local Bhim Army chapters and support networks.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4. Event Management:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "i- Promote and manage events, rallies, and meetings.  \n ii- Allow users to RSVP and receive reminders.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '5. Fundraising and Donations:',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "i- Enable secure donations to support Bhim Army's initiatives.  \n ii- Track and manage fundraising campaigns.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),

                                
                              ],
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
