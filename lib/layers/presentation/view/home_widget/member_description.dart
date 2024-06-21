import 'dart:ui';
import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/presentation/view/home_widget/WebviewWidgetUIScreen.dart';
import 'package:aps_party/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberDescription extends StatefulWidget {
  final BannerMember userStory;
  const MemberDescription({super.key, required this.userStory});

  @override
  State<MemberDescription> createState() => _MemberDescriptionState();
}

class _MemberDescriptionState extends State<MemberDescription> {
  bool isplay = false;

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
    flutterTts.setCompletionHandler(() {
      setState(() {
        isplay = false;
      });
    });
  }

  Future<void> _stop() async {
    await flutterTts.stop();
  }

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
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 35.h,
                        width: w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(widget.userStory.url),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 1.h,
                      bottom: 2.h,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: !isplay
                              ? InkWell(
                                  onTap: () {
                                    _speak(widget.userStory.description);
                                    setState(() {
                                      isplay = true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.play_circle_fill_outlined,
                                    color: Colors.white,
                                  ))
                              : InkWell(
                                  onTap: () {
                                    _stop();
                                    setState(() {
                                      isplay = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.play_circle_outline_outlined,
                                    color: Colors.green,
                                  )),
                        ),
                      ),
                    ),
                    
                    Positioned(
                      left: 1.h,
                      bottom: 2.h,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: AppColors.primarycolor.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            widget.userStory.name,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userStory.description,
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 700),
                                      child: WebviewWidgetUIScreen(
                                        title: widget.userStory.name,
                                        url: widget.userStory.web_url,
                                      ),
                                    ),
                                  );
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
