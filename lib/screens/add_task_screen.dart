import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addTask = context.read<TaskProvider>().addTask;
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              color: Color(0xff5bc1ff),
              fontSize: 30,
            ),
          ),
          TextField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5bc1ff),
                  width: 4.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5bc1ff), // Колір риски при фокусі
                  width: 4.0, // Товщина риски при фокусі
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                addTask(controller.text.trim());
                controller.clear();
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              shape: BeveledRectangleBorder(),
              backgroundColor: Color(0xff5bc1ff),
            ),
            child: Text('Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
