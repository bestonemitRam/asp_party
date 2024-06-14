import 'package:aps_party/layers/presentation/view/all_video.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/profiledata.dart';

class TabSec extends StatelessWidget {
  const TabSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
          itemCount: UsersData.users.length,
          itemBuilder: (context, index) {
            return ShowGrid(
              usergrid: UsersData.users[index],
            );
          }),
    );
  }
}
