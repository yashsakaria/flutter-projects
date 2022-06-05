import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) toggleCheckBoxState;
  final Function() onLongPressCallback;

  const TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.toggleCheckBoxState,
    required this.onLongPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckBoxState,
      ),
    );
  }
}
