import 'package:flutter/material.dart';

import 'package:todoey_flutter/widgets/task_title.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Pay milk'),
    Task(name: 'pay orange'),
    Task(name: 'Pay gamburger'),
  ];

  toggleCheckedState(bool? checkBoxState, index) {
    setState(() {
      tasks[index].toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: TaskTitle(
            isChecked: tasks[index].isDone,
            taskTitle: tasks[index].name,
            checkboxCallback: (checkBoxState) {
              toggleCheckedState(checkBoxState, index);
            },
          ));
        });
  }
}
