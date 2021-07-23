import 'package:flutter/material.dart';

class IconPrefixWidget extends StatelessWidget {
  const IconPrefixWidget({
    Key? key,
    required this.icon,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spaceBetween = 0,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final IconData icon;
  final double spaceBetween;
  
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets margin;
  
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Icon(icon), SizedBox(width: spaceBetween), child],
      ),
    );
  }
}
