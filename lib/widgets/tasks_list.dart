import 'package:flutter/material.dart';

import 'package:todoey_flutter/widgets/task_title.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTitle(),
        TaskTitle(),
        TaskTitle(),
        TaskTitle(),
        TaskTitle(),
      ],
    );
  }
}
