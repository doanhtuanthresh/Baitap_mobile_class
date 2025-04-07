import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  final List<Color> cardColors = [
    Colors.blue[100]!,
    Colors.red[100]!,
    Colors.green[100]!,
    Colors.red[100]!,
  ];

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('List',
      style: TextStyle(
          fontWeight: FontWeight.bold, // In đậm
          color: Colors.blue
          ),
        ), 
      centerTitle: true),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: taskVM.tasks.length,
        itemBuilder: (context, index) {
          final task = taskVM.tasks[index];
          return Card(
            color: cardColors[index % cardColors.length],
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(task.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(task.description),
            ),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
        },
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}
