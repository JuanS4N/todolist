import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';
import 'package:todolist/src/presentation/widgets/date_container.dart';

import 'widgets/icon_cta.dart';
import 'widgets/text_cta.dart';

class CreateTaskFormBody extends StatelessWidget {
  const CreateTaskFormBody({
    Key? key,
  }) : super(key: key);

  final String createTaskHint = "New task";
  final String descriptionTaskHint = "Add details";
  final String createTaskCTA = "Save";
  final double iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    final iconColor = Colors.blue.shade800;

    final selectedListId = context.read(listProvider).selectedListId;
    final createTaskProv = context.read(createTaskProvider);

    createTaskProv.listId = selectedListId;

    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 10),
            child: TextField(
              onChanged: (str) => createTaskProv.setName(str),
              autofocus: true,
              decoration: InputDecoration(hintText: createTaskHint),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10),
            child: Consumer(builder: (context, watch, child) {
              final innerCreateTaskProv = watch(createTaskProvider);
              return Visibility(
                child: TextField(
                  onChanged: (str) => createTaskProv.description = str,
                  autofocus: true,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                  decoration: InputDecoration(hintText: descriptionTaskHint),
                ),
                visible: innerCreateTaskProv.showDescription,
              );
            }),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Consumer(builder: (context, watch, child) {
                final innerProv = watch(createTaskProvider);

                return innerProv.date != null
                    ? DateContainer(
                        date: innerProv.date!,
                        onPressed: (date) async {
                          innerProv.date = date;
                        },
                        onDismiss: () {
                          innerProv.date = null;
                        },
                      )
                    : Container();
              })),
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
                          createTaskProv.toggleShowDescription();
                        },
                      ),
                      IconCTA(
                        iconData: Icons.event_available,
                        iconColor: iconColor,
                        iconSize: iconSize,
                        onTap: () async {
                          DateTime? newDate =
                              await selectDateTime(context, currentDate: null);
                          createTaskProv.date = newDate;
                        },
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (contex, watch, child) {
                    final createTaskP = watch(createTaskProvider);
                    return TextCTA(
                      createTaskCTA: createTaskCTA,
                      iconColor: iconColor,
                      onTap: createTaskP.isReadyToBeCreated
                          ? () async {
                              await createTaskP.createTask();
                              Navigator.of(context).maybePop();
                            }
                          : null,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
