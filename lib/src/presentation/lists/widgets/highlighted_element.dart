import 'package:flutter/material.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';

class HighlightedElement extends StatelessWidget {
  final TaskList element;
  final EdgeInsets outerMargin;
  const HighlightedElement(this.element, this.outerMargin, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: boxDecoration(),
        margin: outerMargin,
        child: listTileForElement(context));
  }

  Widget listTileForElement(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 55),
        child: ListTile(
          title: Text(
            element.listName,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.indigoAccent.shade700),
          ),
          onTap: () => Navigator.pop(context),
        ));
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(40)));
  }
}
