import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/add_tasks.dart';
import 'package:to_do_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.playlist_add_check,
          size: 40,
          color: AppColors.white,
        ),
        title: Text(
          'What To Do',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTasks(),
              ),
            ),
          );
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.indigo,
        child: Icon(
          Icons.add,
          size: 40,
          color: AppColors.white,
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
