import 'package:flutter/material.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/custom_alert_dialog.dart';

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            activeColor: AppColors.primaryColor,
            value: isChecked,
            onChanged: chechboxChange,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) =>
                    CustomAlertDialog(onLongePress: onLongePress),
              );
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
