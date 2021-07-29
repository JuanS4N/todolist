import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';
import 'package:todolist/src/presentation/splash/splash_screen_page.dart';
import 'package:todolist/src/presentation/widgets/date_container.dart';
import 'package:todolist/src/presentation/widgets/refresh_home.dart';

import 'widgets/icon_cta.dart';
import 'widgets/text_cta.dart';

class CreateTaskFormBody extends StatefulWidget {
  const CreateTaskFormBody({Key? key}) : super(key: key);

  @override
  _CreateTaskFormBody createState() => _CreateTaskFormBody();
}

class _CreateTaskFormBody extends State<CreateTaskFormBody> {
  final String createTaskHint = "New task";
  final String descriptionTaskHint = "Add details";
  final String createTaskCTA = "Save";

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

  void setTaskDescription(String str) {
    setState(() {
      _taskDescription = str;
    });
  }

  void setTaskDate({DateTime? date}) {
    setState(() {
      _taskDate = date;
    });
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

    //Navigator.of(context).maybePop();
    Navigator.of(context).pushReplacement(
      pageRouteBuilder(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TaskNameInput(
              createTaskHint: createTaskHint, setTaskName: setTaskName),
          TaskDescriptionInput(
            descriptionTaskHint: descriptionTaskHint,
            setTaskDescription: setTaskDescription,
            showDescription: _showDescription,
          ),
          TaskDateInput(
            setTaskDate: setTaskDate,
            taskDate: _taskDate,
          ),
          CTAsRow(
            createTask: createTask,
            createTaskCTA: createTaskCTA,
            isReady: _isReady,
            setTaskTime: setTaskTime,
            toggleShowDescription: toggleShowDescription,
          )
        ],
      ),
    );
  }
}

class CTAsRow extends StatelessWidget {
  final double iconSize = 30.0;

  final bool isReady;
  final String createTaskCTA;

  final Future<void> Function() createTask;
  final Future Function() setTaskTime;
  final Function() toggleShowDescription;

  const CTAsRow(
      {Key? key,
      required this.isReady,
      required this.createTaskCTA,
      required this.createTask,
      required this.setTaskTime,
      required this.toggleShowDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Colors.blue.shade800;

    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
            onTap: isReady ? createTask : null,
          ),
        ],
      ),
    );
  }
}

class TaskNameInput extends StatelessWidget {
  final void Function(String str) setTaskName;

  final String createTaskHint;
  const TaskNameInput(
      {Key? key, required this.setTaskName, required this.createTaskHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10),
      child: TextField(
        onChanged: setTaskName,
        autofocus: true,
        decoration: InputDecoration(hintText: createTaskHint),
      ),
    );
  }
}

class TaskDescriptionInput extends StatelessWidget {
  final String descriptionTaskHint;
  final bool showDescription;
  final Function(String) setTaskDescription;
  const TaskDescriptionInput(
      {Key? key,
      required this.descriptionTaskHint,
      required this.showDescription,
      required this.setTaskDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Visibility(
        child: TextField(
          onChanged: setTaskDescription,
          autofocus: true,
          style: TextStyle(fontSize: 15, color: Colors.black54),
          decoration: InputDecoration(hintText: descriptionTaskHint),
        ),
        visible: showDescription,
      ),
    );
  }
}

class TaskDateInput extends StatelessWidget {
  final DateTime? taskDate;
  final Function({DateTime? date}) setTaskDate;
  const TaskDateInput({Key? key, this.taskDate, required this.setTaskDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: taskDate != null
          ? Container(
              margin: EdgeInsets.only(bottom: 10, left: 10),
              child: DateContainer(
                date: taskDate!,
                onPressed: (date) => setTaskDate(date: date),
                onDismiss: setTaskDate,
              ),
            )
          : Container(),
    );
  }
}
