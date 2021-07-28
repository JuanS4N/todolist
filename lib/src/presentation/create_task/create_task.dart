import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';

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
  final descriptionTaskHint = "Add details";
  final createTaskCTA = "Save";
  final iconSize = 30.0;

  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Colors.blue.shade800;

    final selectedListId = context.read(listProvider).selectedListId;
    final createTaskProv = context.read(createTaskProvider);

    createTaskProv.listId = selectedListId;

    return WillPopScope(
      onWillPop: () async {
        print("Gud bye");
        createTaskProv.resetValues();
        return true;
      },
      child: Container(
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
                          onTap: () {
                            print("Told me");
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
                                print("We are ready!");
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
      ),
    );
  }
}

class TextCTA extends StatelessWidget {
  const TextCTA(
      {Key? key,
      required this.createTaskCTA,
      required this.iconColor,
      required this.onTap})
      : super(key: key);

  final String createTaskCTA;
  final Color iconColor;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onTap,
        child: Text(createTaskCTA),
      ),
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
