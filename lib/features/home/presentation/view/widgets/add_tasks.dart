import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/home/presentation/manger/task_provider.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? newTextTitle;

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: AppColors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            key: formKey,
            child: TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter task title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Task title cannot be empty';
                }
                return null;
              },
              onSaved: (value) {
                newTextTitle = value;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(newTextTitle!);
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
