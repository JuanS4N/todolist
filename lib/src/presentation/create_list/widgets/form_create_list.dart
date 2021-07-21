import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/List/application/list_providers.dart';

class FormCreateList extends StatelessWidget {
  final String hintText = "Introduce list name";
  const FormCreateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          decoration: InputDecoration(hintText: hintText),
          autofocus: true,
          onChanged: (str) {
            context.read(createListProvide).listName = str;
          },
        ),
      ),
    );
  }
}
