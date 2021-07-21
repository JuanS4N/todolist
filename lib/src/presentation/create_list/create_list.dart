import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/List/application/list_providers.dart';

class CreateListView extends StatelessWidget {
  const CreateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: CreateListBody(),
        onWillPop: () async {
          print("on Pop!");
          context.read(createListProvide).cleanState();

          return true;
        });
  }
}

class CreateListBody extends StatelessWidget {
  const CreateListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          HeaderCreateList(),
          FormCreateList(),
          Container(
            child: Expanded(
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
          )
        ],
      )),
    );
  }
}

class HeaderCreateList extends StatelessWidget {
  final String actionName = "Create list";
  final String confirmAction = "Done";
  final double innerPadding = 20.0;
  const HeaderCreateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
          Expanded(child: Text(actionName)),
          Container(child: Consumer(
            builder: (context, watch, child) {
              final createListProv = watch(createListProvide);

              return TextButton(
                  onPressed: createListProv.isNamedCorrectly
                      ? () async {
                          createListProv.createList();
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(confirmAction));
            },
          ))
        ],
      ),
    );
  }
}

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
