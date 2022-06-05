import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modules/task_data.dart';

String newTaskTitle = '';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final kTextFieldController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            // controller: kTextFieldController,
            textAlign: TextAlign.center,
            onChanged: (String newText) {
              newTaskTitle = newText;
              // print(newTaskTitle);
            },
            style: const TextStyle(
              fontSize: 24.0,
            ),
            decoration: const InputDecoration(
              fillColor: Colors.black,
              contentPadding: EdgeInsets.all(8.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 3.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 5.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              color: Colors.lightBlueAccent,
              height: 60.0,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // print(newTaskTitle);
                  if (newTaskTitle.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false)
                        .addNewTask(newTaskTitle);
                    newTaskTitle = '';
                    // kTextFieldController.clear();
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
