import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_notifier.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';

void displayBottomModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(child: MenuOption());
      });
}

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProv = context.read(listProvider);

    final actualList = listProv.selectedList;

    print(actualList.listName);

    return Container(
        margin: EdgeInsets.only(left: 10, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Sort by",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            TextOption(
              margin: EdgeInsets.only(left: 40),
              textInfo: 'My order',
              onPressed: () {},
            ),
            TextOption(
              textInfo: 'Date',
              margin: EdgeInsets.only(left: 40),
              onPressed: () {},
            ),
            Divider(
              thickness: 1,
            ),
            TextOption(
              textInfo: 'Rename list',
              onPressed: () {},
            ),
            TextOption(
              textInfo: 'Delete list',
              isActive: actualList.isDefaultList ? false : true,
              onPressed: () {},
            ),
            TextOption(
              textInfo: 'Delete all completed task',
              onPressed: () {},
            ),
            TextOption(
              textInfo: 'Copy reminders to Task',
              onPressed: () {},
            )
          ],
        ));
  }
}

class TextOption extends StatelessWidget {
  const TextOption({
    Key? key,
    required this.textInfo,
    required this.onPressed,
    this.isActive = true,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final String textInfo;
  final void Function() onPressed;
  final bool isActive;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: isActive ? onPressed : null,
        child: Container(
          margin: margin,
          width: double.infinity,
          child: Text(
            textInfo,
            textAlign: TextAlign.start,
            style: isActive
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
