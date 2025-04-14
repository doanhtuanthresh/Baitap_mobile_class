import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_screen.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final taskViewModel = TaskViewModel();     
  await taskViewModel.init();                

  runApp(
    ChangeNotifierProvider(
      create: (_) => taskViewModel,
      child: const MyApp(),
    ),
  );
}