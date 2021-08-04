import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../create_task/create_task.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FloatingActionButton(
      onPressed: () async {
        createListModal(context);
      },
      child: Icon(Icons.add),
      elevation: 0.0,
    );
  }
}
