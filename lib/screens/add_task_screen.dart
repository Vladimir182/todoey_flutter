import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              shape: BeveledRectangleBorder(),
              backgroundColor: Color(0xff5bc1ff),
            ),
            onPressed: () {},
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
