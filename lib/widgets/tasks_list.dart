import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_provider.dart';

import 'package:todoey_flutter/widgets/task_title.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskList = context.watch<TaskProvider>().tasks;
    final updateTask = context.read<TaskProvider>().updateTask;
    final removeTask = context.read<TaskProvider>().deleteTask;
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: TaskTitle(
              isChecked: taskList[index].isDone,
              taskTitle: taskList[index].name,
              checkboxCallback: (checkBox) {
                updateTask(index);
              },
              longPressCallback: () => removeTask(index),
            ),
          );
        });
  }
}
