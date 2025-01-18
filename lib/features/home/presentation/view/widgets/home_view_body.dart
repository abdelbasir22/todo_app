import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/home/presentation/manger/task_provider.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/tasks_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${Provider.of<TaskProvider>(context).tasks.length} Tasks',
            style: TextStyle(fontSize: 18, color: AppColors.white),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white,
              ),
              child: TasksList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
