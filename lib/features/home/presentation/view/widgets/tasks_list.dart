import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/home/presentation/manger/task_provider.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].title,
              isChecked: taskData.tasks[index].isDone,
              chechboxChange: (newValue) {
                taskData.updateTask(
                  taskData.tasks[index],
                );
              },
              onLongePress: () {
                taskData.deleteTask(taskData.tasks[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
