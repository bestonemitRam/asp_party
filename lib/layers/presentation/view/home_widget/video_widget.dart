import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/presentation/view/home_widget/loaderscreennew.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoWidget extends StatelessWidget {
  final VideoMode video;
  const VideoWidget({super.key, required this.video});
  String getThumbnailUrl(String videoUrl) {
    final uri = Uri.parse(videoUrl);
    final videoId = uri.queryParameters['v'] ?? uri.pathSegments.last;
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    // image: DecorationImage(
                    //     image: NetworkImage(getThumbnailUrl(video.video_url)),
                    //     fit: BoxFit.fill)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: getThumbnailUrl(video.video_url),
                      width: double.infinity,
                      placeholder: (context, url) =>
                          Center(child: Center(child: LoaderScreennew())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2.5,
                  top: MediaQuery.of(context).size.height / 10,
                  child: Container(
                    width: 40.62,
                    height: 40.62,
                    child: SvgPicture.asset(
                      "assets/images/play.svg",
                      color: Color.fromARGB(255, 246, 243, 243),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                video.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                video.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromARGB(255, 98, 98, 98),
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
