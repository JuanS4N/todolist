import 'package:flutter/material.dart';

class TaskBottomAppBar extends StatelessWidget {
  const TaskBottomAppBar({
    Key? key,
    required this.isCompleted,
    required this.onTap,
  }) : super(key: key);
  final bool isCompleted;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final String _completed = isCompleted ? 'no ' : '';
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text('Marcar como ${_completed}completada')),
            ),
          ),
        ],
      ),
    );
  }
}
