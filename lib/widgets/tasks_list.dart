import 'package:flutter/material.dart';

import 'package:todoey_flutter/widgets/task_title.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  toggleCheckedState(bool? checkBoxState, index) {
    setState(() {
      widget.taskList[index].toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: TaskTitle(
            isChecked: widget.taskList[index].isDone,
            taskTitle: widget.taskList[index].name,
            checkboxCallback: (checkBoxState) {
              toggleCheckedState(checkBoxState, index);
            },
          ));
        });
  }
}
