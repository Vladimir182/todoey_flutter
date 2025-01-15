import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todoey_flutter/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Pay milk'),
    Task(name: 'pay orange'),
    Task(name: 'Pay gamburger'),
    Task(name: 'Pay gamburger'),
  ];
  //UnmodifiableListView робить список незмінним (immutable) для зовнішнього доступу
  // List<Task> get tasks => _tasks;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String name) {
    final newTask = Task(name: name);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleCheckBox(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
