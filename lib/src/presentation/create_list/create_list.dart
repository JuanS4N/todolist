import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/list/application/list_providers.dart';
import 'widgets/form_create_list.dart';
import 'widgets/header_create_list.dart';

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
