// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/view/tabsec.dart';
import 'package:flutter/material.dart';


import '../model/profiledata.dart';
import '../utils/mytheme.dart';
import 'hom.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("Muhammad Atif Pervaiz "),
            Icon(
              Icons.verified,
              color: Colors.blue,
            ),
          ],
        ),
        actions: [
          Icon(Icons.add),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage('assets/images/1.png'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "132",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "10001",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Follower",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "1690",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Muhammad Atif Pervaiz \nFlutter Developer\nDigital Creator",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.link),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "youtube/muhammadatifpervaiz",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Professional Dashboard",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: Center(
                        child: Text(
                          "Edit Profile ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: Center(
                        child: Text(
                          "Share Profile",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: Center(
                        child: Text(
                          "Contact ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: UsersData.users.length,
                  itemBuilder: (context, index) {
                    return ShowItem(
                      userStory: UsersData.users[index],
                    );
                  }),
            ),
            TabBar(tabs: [
              Icon(Icons.dashboard),
              Icon(Icons.video_call),
              Icon(Icons.shop),
              Icon(Icons.account_box),
            ]),
            Expanded(
              child: TabBarView(children: [
                TabSec(),
                TabSec(),
                TabSec(),
                TabSec(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
