import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:flutter/material.dart';

class TreandingPhotos extends StatelessWidget {
  final BannerMember userStory;

  const TreandingPhotos({super.key, required this.userStory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(userStory.url),
          ),
        ),
       
      ],
    );
  }
}
