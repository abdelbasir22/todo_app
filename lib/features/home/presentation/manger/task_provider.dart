import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  TaskProvider() {
    loadTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> taskList =
        tasks.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList('tasks', taskList);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      tasks = taskList
          .map((task) => TaskModel.fromJson(json.decode(task)))
          .toList();
      notifyListeners();
    }
  }

  void addTask(String newTaskTitle) {
    tasks.add(TaskModel(title: newTaskTitle));
    saveTasks();
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    task.doneChande();
    saveTasks();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    tasks.remove(task);
    saveTasks();
    notifyListeners();
  }
}
