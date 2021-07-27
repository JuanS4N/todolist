import 'package:flutter/material.dart';

void createListModal(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (BuildContext buildContext) {
        return CreateTaskForm();
      });
}

class CreateTaskForm extends StatelessWidget {
  final createTaskHint = "New task";
  final createTaskCTA = "Save";
  final iconSize = 30.0;

  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Colors.blue.shade800;

    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 10),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: createTaskHint),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconCTA(
                        iconData: Icons.notes,
                        iconColor: iconColor,
                        iconSize: iconSize,
                        onTap: () {
                          print("Hi dude");
                        },
                      ),
                      IconCTA(
                        iconData: Icons.event_available,
                        iconColor: iconColor,
                        iconSize: iconSize,
                        onTap: () {
                          print("Told me");
                        },
                      ),
                    ],
                  ),
                ),
                TextCTA(createTaskCTA: createTaskCTA, iconColor: iconColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextCTA extends StatelessWidget {
  const TextCTA({
    Key? key,
    required this.createTaskCTA,
    required this.iconColor,
  }) : super(key: key);

  final String createTaskCTA;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {},
          child: Text(createTaskCTA,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: iconColor, fontSize: 18))),
    );
  }
}

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
