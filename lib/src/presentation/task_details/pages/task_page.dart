import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils.dart';
import '../../../features/tasks/domain/entities/task.dart';
import '../../home/logic/tasks_providers.dart';
import '../widgets/icon_prefix_widget.dart';
import '../widgets/sub_task_tile.dart';
import '../widgets/task_bottom_app_bar.dart';
import '../widgets/task_date_selector.dart';
import '../widgets/task_list_selector.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime? _taskDate;

  List<Task> subtasks = [];
  late Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.task.copyWith();

    _titleController = TextEditingController.fromValue(
      TextEditingValue(text: _task.title),
    );
    _descriptionController = TextEditingController.fromValue(
      TextEditingValue(text: _task.description ?? ''),
    );
    _taskDate = _task.date;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final newTask = Task(
          listId: _task.listId,
          parentTask: _task.parentTask,
          title: _titleController.value.text,
          description: _descriptionController.value.text,
          date: _taskDate,
          completed: _task.completed,
          id: _task.id,
          modified: _task.modified,
          subtasks: _task.subtasks,
        );
        await context.read(tasksListProvider).updateTask(newTask);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back_ios_new),
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Select / Change current list
              TaskListSelector(
                listname: 'List Name',
                onTap: () {},
              ),

              // Task Title
              TextField(
                controller: _titleController,
                maxLines: null,
                scrollPhysics: NeverScrollableScrollPhysics(),
                decoration: InputDecoration(hintText: 'Ingresa un título'),
              ),

              //  Task Description
              IconPrefixWidget(
                icon: Icons.subject,
                child: Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Agregar detalles',
                    ),
                  ),
                ),
              ),

              // Task Date
              TaskDateSelector(
                date: _taskDate,
                onChange: (newDate) => setState(() {
                  _taskDate = newDate;
                }),
                onDismiss: () => setState(() {
                  _taskDate = null;
                }),
              ),

              // Subtasks
              IconPrefixWidget(
                icon: Icons.subdirectory_arrow_right_rounded,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _subtasksBuilder(subtasks) +
                        [
                          TextButton(
                            onPressed: () {
                              // TODO: add subtask button
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      contextSize(context).width * 0.075),
                              width: double.infinity,
                              child: Text('Agregar subtarea'),
                            ),
                          ),
                        ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TaskBottomAppBar(
          isCompleted: _task.completed,
          onTap: () {},
        ),
      ),
    );
  }

  List<Widget> _subtasksBuilder(List<Task> tasks) {
    List<Widget> subtasks = [];
    for (int i = 0; i < tasks.length; i++) {
      subtasks.add(
        SubTaskTile(
          task: tasks[i],
          onIconPressed: () {},
          onTap: () => setState(() {}),
        ),
      );
    }
    return subtasks;
  }
}
