import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Pay milk'),
    Task(name: 'pay orange'),
    Task(name: 'Pay gamburger'),
  ];

  void getControllerAddListText(controller) {
    String taskText = controller.text.trim();

    if (taskText.isNotEmpty) {
      setState(() {
        tasks.add(Task(name: taskText));
      });
      // controller.clear();
      Navigator.pop(context);
    }
    print(taskText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print('Hello');
      //   },
      //   backgroundColor: Colors.lightBlueAccent,
      //   shape: CircleBorder(),
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(
                      controllerAddListText: getControllerAddListText,
                    ),
                  ),
                ),
              );
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 100, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(taskList: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
