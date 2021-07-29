import 'package:flutter/material.dart';

class TextCTA extends StatelessWidget {
  const TextCTA(
      {Key? key,
      required this.createTaskCTA,
      required this.iconColor,
      required this.onTap})
      : super(key: key);

  final String createTaskCTA;
  final Color iconColor;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onTap,
        child: Text(createTaskCTA),
      ),
    );
  }
}
