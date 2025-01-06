import 'package:flutter/material.dart';

class TaskTitle extends StatefulWidget {
  const TaskTitle({
    super.key,
  });

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Buy milk',
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        checkBoxState: isChecked,
        toggleChackbox: (bool? checkBoxState) {
          setState(() {
            isChecked = checkBoxState ?? false;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({
    super.key,
    required this.checkBoxState,
    required this.toggleChackbox,
  });

  final bool checkBoxState;
  final ValueChanged<bool?> toggleChackbox;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleChackbox,
    );
  }
}
