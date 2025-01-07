import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    super.key,
    required this.isChecked,
    required this.taskTitle,
  });

  final bool isChecked;
  final String taskTitle;

  void togleCheckedState(bool? checkBoxState) {}

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
        onChanged: (newValue) {},
      ),
    );
  }
}

// setState(() {
//   isChecked = checkBoxState ?? false;
// });
