import 'package:flutter/material.dart';
import '../models/task.dart';
import '../data/app_database.dart'; 
import '../data/task_dao.dart';    

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskDao? _taskDao;


  TaskViewModel();

  
  Future<void> init() async {
    final database = await $FloorAppDatabase
        .databaseBuilder('task_database.db')
        .build();

    _taskDao = database.taskDao;

    await fetchTasks();
  }

  Future<void> fetchTasks() async {
    if (_taskDao == null) return;

    _tasks.clear();
    final data = await _taskDao!.getAllTasks();
    _tasks.addAll(data);
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    if (_taskDao == null) return;

    await _taskDao!.insertTask(task);
    await fetchTasks();
  }
}
