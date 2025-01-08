import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
