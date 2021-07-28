import 'package:flutter/material.dart';

class IconCTA extends StatelessWidget {
  const IconCTA(
      {Key? key,
      required this.iconData,
      required this.iconColor,
      required this.iconSize,
      required this.onTap})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final double iconSize;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
