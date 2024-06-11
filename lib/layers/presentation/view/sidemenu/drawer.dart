import 'package:aps_party/layers/presentation/view/sidemenu/DrawerItemui.dart';
import 'package:flutter/material.dart';

class MenuBarScreen extends StatelessWidget {
  const MenuBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Stack(
        children: [
          Container(
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
                        backgroundImage: AssetImage('assets/images/chat.png'),
                      ),

                      //  Image.asset(
                      //   AppImages.logo,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    height: 1,
                    // color: AppColors.greyColor,
                  ),
                  Padding(
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
                            onTap: () {},
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
                              title: "Leadership",
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
                              title: "Morcha",
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
                              title: "Media Resources",
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
                              onTap: () {}),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  const Divider(
                    color: Colors.black12,
                    thickness: .1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
