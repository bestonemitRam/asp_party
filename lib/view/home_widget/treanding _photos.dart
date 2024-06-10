import 'package:aps_party/model/profiledata.dart';
import 'package:flutter/material.dart';

class TreandingPhotos extends StatelessWidget {
  final UserProfile userStory;

  const TreandingPhotos({super.key, required this.userStory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(userStory.url),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: Text(
            userStory.name,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
