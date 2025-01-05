import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Buy milk',
        style: TextStyle(
          fontSize: 18,
          // decoration: true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
