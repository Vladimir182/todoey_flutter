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
    final taskList = context.read<TaskProvider>().tasks;
    final toggleCheckBox = context.read<TaskProvider>().toggleCheckBox;
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: TaskTitle(
            isChecked: taskList[index].isDone,
            taskTitle: taskList[index].name,
            checkboxCallback: (checkBox) {
              toggleCheckBox(index);
            },
          ));
        });
  }
}
