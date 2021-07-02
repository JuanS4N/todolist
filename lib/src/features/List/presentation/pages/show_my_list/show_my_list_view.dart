import 'package:flutter/material.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';

var listTextStyle = const TextStyle(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);

void listViewBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.30,
          builder: (_, scrollController) {
            return SafeArea(child: MyOwnListView(scrollController));
          },
        ); //SafeArea(child: ListViewer());
      });
}

void otherTry() {}

class MyOwnListView extends StatelessWidget {
  final controller;
  const MyOwnListView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const myList = [
      const ListOfTask('Dude', false),
      const ListOfTask('Friend', true),
      const ListOfTask('Friend', false),
      const ListOfTask('Friend', false),
      const ListOfTask('Friend', false),
      const ListOfTask('Friend', false),
      const ListOfTask('Friend', false),
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ItemsView(myList, controller)),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          CreateListCTA()
        ],
      ),
    );
  }
}

class CreateListCTA extends StatelessWidget {
  const CreateListCTA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.add,
              ),
            ),
            Container(
              child: Text(
                "Create a new list",
                style: listTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
return TextButton.icon(
      label: Expanded(
          child: Text(
        "Add",
        style: listTextStyle,
      )),
      onPressed: () {},
      icon: Icon(
        Icons.add,
        size: 20,
        color: Colors.black,
      ),
    );
*/
class ItemsView extends StatelessWidget {
  final List<ListOfTask> itemsList;
  final controller;
  const ItemsView(this.itemsList, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return ListElement(itemsList[index]);
        },
        itemCount: itemsList.length);
  }
}

class ListElement extends StatelessWidget {
  final ListOfTask element;
  const ListElement(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return element.isActive
        ? HighhighlightedElement(element)
        : NormalElement(element);
  }
}

class NormalElement extends StatelessWidget {
  final ListOfTask element;
  const NormalElement(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, right: 20),
        child: Container(
            margin: EdgeInsets.only(left: 55),
            child: ListTile(
              title: Text(
                element.listName,
                style: listTextStyle,
              ),
            )));
  }
}

class HighhighlightedElement extends StatelessWidget {
  final ListOfTask element;
  const HighhighlightedElement(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        margin: EdgeInsets.only(top: 10, right: 20),
        child: Container(
            margin: EdgeInsets.only(left: 55),
            child: ListTile(
              title: Text(
                element.listName,
                style:
                    listTextStyle.copyWith(color: Colors.indigoAccent.shade700),
              ),
            )));
  }
}
