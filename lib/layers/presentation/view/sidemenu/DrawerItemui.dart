import 'package:flutter/material.dart';

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
          Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.primary,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: color ?? Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ],
      ),
    );
  }
}
