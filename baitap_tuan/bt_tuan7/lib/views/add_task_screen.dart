import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New",
        style: TextStyle(
          fontWeight: FontWeight.bold, // In đậm
          color: Colors.blue
        ),
      ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: "Task", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Description", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              minLines: 1,
              maxLines: 4,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  title: taskController.text,
                  description: descController.text,
                );
                taskVM.addTask(newTask);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: StadiumBorder(),
              ),
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
