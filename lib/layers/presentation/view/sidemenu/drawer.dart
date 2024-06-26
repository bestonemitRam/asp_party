import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/DrawerItemui.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/about_app.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/about_party.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/morcha.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_Organizations.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_description.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuBarScreen extends StatelessWidget {
  const MenuBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 7, right: 2, left: 2, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(AppImages.dr),
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Divider(
                height: 1,
                // color: AppColors.greyColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1,
                      right: 1,
                      left: 1,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                            icon: Icons.home,
                            title: "home",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "The Party",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: Party(),
                                  ),
                                );

                                //  PartyDescription
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Party Organization",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: PartyOrganization(),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Bharat Ekta Mission",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: PartyFoundations(),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Media Resources",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: AllVideo(),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Morcha",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: ApsMorcha(),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Organizations",
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Upcoming Events",
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "Our Journey",
                              onTap: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DrawerItem(
                              icon: Icons.search,
                              title: "About App",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: AboutApp(),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: .1,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        _lunchInBrowser(
                                            'https://www.instagram.com/shotNews11');
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(AppImages.instagram),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        _lunchInBrowser(
                                            'https://twitter.com/BhimArmyChief');
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(AppImages.twitter),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        _lunchInBrowser(
                                            'https://www.facebook.com/BhimArmyOfficial');
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(AppImages.facebook),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        _lunchInBrowser(
                                            'https://youtube.com/@BhimArmy__BEM');
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(AppImages.youtube),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        _lunchInBrowser(
                                            'https://aazadsamajpartyk.org/');
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(AppImages.google),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _lunchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{"headesr_key": "headers_value"});
    } else {
      throw "url not lunched $url";
    }
  }

  void _openInstagram() async {
    const url =
        'https://www.instagram.com/your_username'; // Replace with your Instagram profile URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
