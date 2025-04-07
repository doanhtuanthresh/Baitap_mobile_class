import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListScreen(),
    );
  }
}
