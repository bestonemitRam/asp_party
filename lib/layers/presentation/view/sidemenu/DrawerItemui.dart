import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          // Icon(
          //   ,
          //   color: color ?? Theme.of(context).colorScheme.primary,
          //   size: 30,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 4.h,
              width: 4.h,
              margin: EdgeInsets.only(left: 1.0, right: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(AppImages.dr), fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: color ?? Theme.of(context).colorScheme.primary,
            size: 15,
          ),
        ],
      ),
    );
  }
}
