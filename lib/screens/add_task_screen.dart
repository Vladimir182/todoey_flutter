import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
    required this.controllerAddListText,
  });

  final Function(TextEditingController) controllerAddListText;

  final TextEditingController controller = TextEditingController();

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
            onPressed: () => controllerAddListText(controller),
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
