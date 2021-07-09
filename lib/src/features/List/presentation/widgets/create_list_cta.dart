import 'package:flutter/material.dart';

class CreateListCTA extends StatelessWidget {
  const CreateListCTA({Key? key}) : super(key: key);

  final IconData ctaIcon = Icons.add;
  final String ctaText = "Create a new list";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [createIcon(context), createText(context)],
        ),
      ),
    );
  }

  Widget createIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      child: Icon(ctaIcon),
    );
  }

  Widget createText(BuildContext context) {
    return Container(
      child: Text(ctaText,
          style: Theme.of(context)
              .textTheme
              .bodyText2), // TODO -> We need to use the app theme, this is just provisonal.
    );
  }
}
