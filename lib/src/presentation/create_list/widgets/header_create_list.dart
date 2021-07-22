import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/list/application/list_providers.dart';

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
          closeCTA(),
          Expanded(child: Text(actionName)),
          doneCTA(confirmAction: confirmAction)
        ],
      ),
    );
  }
}

class doneCTA extends StatelessWidget {
  const doneCTA({
    Key? key,
    required this.confirmAction,
  }) : super(key: key);

  final String confirmAction;

  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer(
      builder: (context, watch, child) {
        final createListProv = watch(createListProvide);
        final listProv = watch(listProvider);
        return TextButton(
            onPressed: createListProv.isNamedCorrectly
                ? () async {
                    await createListProv.createList();
                    await listProv.fetchTaskList();

                    Navigator.pop(context);
                  }
                : null,
            child: Text(confirmAction));
      },
    ));
  }
}

class closeCTA extends StatelessWidget {
  const closeCTA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.maybePop(context);
        },
      ),
    );
  }
}
