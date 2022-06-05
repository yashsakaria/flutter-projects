import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modules/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            toggleCheckBoxState: (bool? checkBoxState) {
              taskData.updateTask(taskData.tasks[index]);
            },
            onLongPressCallback: () {
              taskData.removeTask(taskData.tasks[index]);
            },
          );
        },
      );
    });
  }
}
//
// @override
// State<TasksList> createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
//   List<Task> tasks = [
//     Task(name: 'Buy milk'),
//     Task(name: 'Buy Bread'),
//     Task(name: 'Buy Eggs'),
//   ];
