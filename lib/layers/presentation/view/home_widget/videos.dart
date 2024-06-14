import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowItemValue extends StatelessWidget {
  final VideoMode video;
  const ShowItemValue({super.key, required this.video});
  String getThumbnailUrl(String videoUrl) {
    final uri = Uri.parse(videoUrl);
    final videoId = uri.queryParameters['v'] ?? uri.pathSegments.last;
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Card(
        child: Stack(
          children: [
            Container(
              height: 12.5.h,
              width: MediaQuery.of(context).size.width / 2,
              // margin: EdgeInsets.only(left: 10.0, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  image: DecorationImage(
                      //  image: AssetImage(userStory.url),
                      image: NetworkImage(getThumbnailUrl(video.video_url)),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              left: 9.h,
              top: 4.h,
              child: Container(
                width: 52.62,
                height: 52.62,
                child: SvgPicture.asset(
                  "assets/images/play.svg",
                  color: Colors.redAccent,
                ),
              ),
            ),
            Positioned(
              left: 1.h,
              top: 12.5.h,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text(
                  video.title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
