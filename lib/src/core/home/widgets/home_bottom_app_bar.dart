import 'package:flutter/material.dart';

import '../../../../features/List/presentation/pages/show_my_list/task_list_modal.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                listViewBottomSheet(context);
              },
              icon: Icon(Icons.menu)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
