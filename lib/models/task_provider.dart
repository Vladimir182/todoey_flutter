import 'package:flutter/material.dart';

import 'package:todoey_flutter/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Pay milk'),
    Task(name: 'pay orange'),
    Task(name: 'Pay gamburger'),
    Task(name: 'Pay gamburger'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  void toggleCheckBox(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
