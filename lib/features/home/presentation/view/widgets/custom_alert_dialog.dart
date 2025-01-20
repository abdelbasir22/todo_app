import 'package:flutter/material.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/custom_elevation_button.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.onLongePress,
  });

  final void Function() onLongePress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirm Deletion',
        style: TextStyle(color: AppColors.secondaryColor),
      ),
      content: Text(
        'Are you sure you want to delete this task ?',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        CustomElevationButton(
          text: 'Yes',
          backgroundColor: AppColors.red,
          onPressed: onLongePress,
        ),
        CustomElevationButton(
          text: 'No',
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
