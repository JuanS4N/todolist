import 'package:flutter/material.dart';

import '../../../core/task_theme_data.dart';

class TaskListSelector extends StatelessWidget {
  const TaskListSelector({
    Key? key,
    required this.listname,
    required this.onTap,
  }) : super(key: key);

  final String listname;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(
              listname,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: activeColor),
            ),
          ),
          SizedBox(width: 10.0),
          Icon(Icons.arrow_drop_down, color: activeColor),
        ],
      ),
    );
  }
}
