// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 40,
              color: Colors.grey.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Search...."),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search_off),
                  )
                ],
              ),
            ),
          ),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: UsersData.users.length,
            itemBuilder: (context, index) {
              return ShowGrid(
                usergrid: UsersData.users[index],
              );
            }));
  }
}

class ShowGrid extends StatelessWidget {
  final UserProfile usergrid;

  const ShowGrid({super.key, required this.usergrid});
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      height: 200,
      width: 200,
      image: AssetImage(usergrid.url),
    );
  }
}
