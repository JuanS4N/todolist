import 'package:flutter/material.dart';

class IconPrefixWidget extends StatelessWidget {
  const IconPrefixWidget({
    Key? key,
    required this.icon,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);
  final IconData icon;
  final Widget child;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Icon(icon), child],
    );
  }
}
