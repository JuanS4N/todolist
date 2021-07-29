import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';
import 'package:todolist/src/presentation/widgets/date_container.dart';

import 'widgets/icon_cta.dart';
import 'widgets/text_cta.dart';

class CreateTaskFormBodyV2 extends StatefulWidget {
  const CreateTaskFormBodyV2({Key? key}) : super(key: key);

  @override
  _CreateTaskFormBodyV2 createState() => _CreateTaskFormBodyV2();
}

class _CreateTaskFormBodyV2 extends State<CreateTaskFormBodyV2> {
  final String createTaskHint = "New task";
  final String descriptionTaskHint = "Add details";
  final String createTaskCTA = "Save";
  final double iconSize = 30.0;

  // Task

  String _taskName = "";
  String _taskDescription = "";
  bool _showDescription = false;
  DateTime? _taskDate = null;
  bool _isReady = false;

  void toggleShowDescription() {
    setState(() {
      _showDescription = !_showDescription;
      _taskDescription = "";
    });
  }

  Future setTaskTime() async {
    DateTime? newDate = await selectDateTime(context, currentDate: null);
    setState(() {
      _taskDate = newDate;
    });
  }

  void setTaskName(String str) {
    setState(() {
      _taskName = str;
    });
    isReadyToBeCreated();
  }

  void isReadyToBeCreated() {
    setState(() {
      if (_taskName.isEmpty) {
        _isReady = false;
      } else {
        _isReady = true;
      }
    });
  }

  Future<void> createTask() async {
    final listProv = context.read(listProvider);
    final tasksProvider = context.read(tasksNotifierProvider);

    await tasksProvider.createTask(
        task: Task(
            listId: listProv.selectedListId,
            title: _taskName,
            date: _taskDate,
            description: _taskDescription));
    Navigator.of(context).maybePop();
  }

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
              onChanged: setTaskName,
              autofocus: true,
              decoration: InputDecoration(hintText: createTaskHint),
            ),
          ),
          Visibility(
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: TextField(
                onChanged: (str) {
                  setState(() {
                    _taskDescription = str;
                  });
                },
                autofocus: true,
                style: TextStyle(fontSize: 15, color: Colors.black54),
                decoration: InputDecoration(hintText: descriptionTaskHint),
              ),
            ),
            visible: _showDescription,
          ),
          _taskDate != null
              ? Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  child: DateContainer(
                    date: _taskDate!,
                    onPressed: (date) async {
                      setState(() {
                        _taskDate = date;
                      });
                    },
                    onDismiss: () {
                      setState(() {
                        _taskDate = null;
                      });
                    },
                  ),
                )
              : Container(),
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
                        onTap: toggleShowDescription,
                      ),
                      IconCTA(
                        iconData: Icons.event_available,
                        iconColor: iconColor,
                        iconSize: iconSize,
                        onTap: setTaskTime,
                      ),
                    ],
                  ),
                ),
                TextCTA(
                  createTaskCTA: createTaskCTA,
                  iconColor: iconColor,
                  onTap: _isReady ? createTask : null,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
