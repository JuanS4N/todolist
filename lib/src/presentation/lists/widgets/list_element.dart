import 'package:flutter/material.dart';
import 'package:todolist/src/features/list/domain/entities/list_of_task.dart';
import 'package:todolist/src/presentation/lists/widgets/highlighted_element.dart';
import 'package:todolist/src/presentation/lists/widgets/normal_element.dart';


class ListElement extends StatelessWidget {
  final TaskList element;

  const ListElement(this.element, {Key? key}) : super(key: key);

  static const outerMargin = EdgeInsets.only(top: 10, right: 20);

  @override
  Widget build(BuildContext context) {
    return element.isActive
        ? HighlightedElement(element, outerMargin)
        : NormalElement(element, outerMargin);
  }
}
