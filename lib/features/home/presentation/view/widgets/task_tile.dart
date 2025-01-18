import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.chechboxChange,
    required this.onLongePress,
  });

  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) chechboxChange;
  final void Function() onLongePress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: AppColors.primaryColor,
        value: isChecked,
        onChanged: chechboxChange,
      ),
      onLongPress: onLongePress,
    );
  }
}
