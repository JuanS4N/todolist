import 'package:flutter/material.dart';
import 'package:todolist/src/core/task_theme_data.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

class SubTaskTile extends StatefulWidget {
  const SubTaskTile({
    Key? key,
    required this.task,
    required this.onIconPressed,
    required this.onTap,
  }) : super(key: key);
  final Task task;
  final Function() onIconPressed;
  final Function() onTap;

  @override
  _SubTaskTileState createState() => _SubTaskTileState();
}

class _SubTaskTileState extends State<SubTaskTile> {
  late final FocusNode node;
  bool showDeleteButton = false;

  @override
  void initState() {
    super.initState();
    node = FocusNode();
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            widget.task.completed ? Icons.check : Icons.circle_outlined,
          ),
          visualDensity: VisualDensity.compact,
          color: widget.task.completed ? activeColor : null,
          onPressed: widget.onIconPressed,
        ),
        Expanded(
          child: TextField(
            focusNode: node,
            scrollPhysics: NeverScrollableScrollPhysics(),
            decoration: InputDecoration(hintText: 'Ingresa un título'),
            onTap: widget.onTap,
          ),
        ),
        Visibility(
          visible: node.hasFocus,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Icon(Icons.clear_rounded, size: 17.5),
          ),
        ),
      ],
    );
  }
}
