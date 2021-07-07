import 'package:flutter/material.dart';
import 'package:todolist/src/core/task_theme_data.dart';
import 'package:todolist/src/features/task/presentation/pages/widgets/sub_task_tile.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

import 'widgets/icon_prefix_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> subtasks = [];
  late Task task;
  @override
  void initState() {
    super.initState();
    task = widget.task.copyWith();
    subtasks = List.generate(10, (index) => Task(title: 'Subtask: $index'));
  }

  @override
  Widget build(BuildContext context) {
    String _completed = task.completed ? 'no ' : '';
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
            GestureDetector(
              onTap: () {
                print('clicked!');
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae ligula consequat, maximus diam non, finibus massa. Aenean sit amet enim eros. Etiam ligula purus, dictum quis nunc nec, dignissim rhoncus velit. Etiam id risus a turpis vestibulum ultrices. Nunc accumsan diam in euismod aliquet. Nulla porttitor velit vel nisl porttitor, sit amet elementum mi consequat. Nulla accumsan justo in nulla lacinia finibus. Pellentesque ultricies fermentum ligula sit amet viverra.',
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
            ),
            TextField(
              maxLines: null,
              scrollPhysics: NeverScrollableScrollPhysics(),
              decoration: InputDecoration(hintText: 'Ingresa un título'),
            ),
            IconPrefixWidget(
              icon: Icons.subject,
              child: Expanded(
                child: TextField(
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Agregar detalles',
                  ),
                  //expands: true,
                ),
              ),
            ),
            InkWell(
              onTap: task.date != null
                  ? null
                  : () async {
                      DateTime? _date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (_date == null) return;
                      setState(() {
                        task = task.copyWith(date: _date);
                      });
                      print(task);
                    },
              child: IconPrefixWidget(
                icon: Icons.event_available,
                crossAxisAlignment: CrossAxisAlignment.center,
                child: task.date == null
                    ? Text('Agregar detalles')
                    : InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.5, vertical: 5.0),
                          decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: StadiumBorder(
                              side: BorderSide(color: unactiveColor),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(DateTime.now().toIso8601String()),
                              SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    task = task.copyWith(date: null);
                                  });
                                },
                                borderRadius: BorderRadius.circular(50),
                                child: Icon(Icons.clear_rounded, size: 17.5),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            IconPrefixWidget(
              icon: Icons.subdirectory_arrow_right_rounded,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _subtasksBuilder(subtasks) +
                      [
                        Container(
                          child: Text('Hello'),
                        ),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
