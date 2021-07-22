import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/task_details/widgets/task_bottom_app_bar.dart';
import 'package:todolist/src/presentation/task_details/widgets/task_date_selector.dart';
import 'package:todolist/src/presentation/task_details/widgets/task_list_selector.dart';

import '../../../features/tasks/domain/entities/task.dart';
import '../widgets/icon_prefix_widget.dart';
import '../widgets/sub_task_tile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  List<Task> subtasks = [];
  late Task task;
  @override
  void initState() {
    super.initState();
    task = widget.task.copyWith();

    _titleController =
        TextEditingController.fromValue(TextEditingValue(text: task.title));
    _descriptionController = TextEditingController.fromValue(
        TextEditingValue(text: task.description ?? ''));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              date: task.date,
              onChange: (newDate) {
                print(newDate);
              },
              onDismiss: () {
                print('dismiss');
              },
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
                                horizontal: contextSize(context).width * 0.075),
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
        isCompleted: task.completed,
        onTap: () {},
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
