import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              print('Hello');
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
                  '12 Tasks',
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
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
