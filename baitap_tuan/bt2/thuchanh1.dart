import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra độ tuổi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  const AgeCheckerScreen({super.key});

  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _result = '';

  void _checkAge() {
    String name = _nameController.text.trim();
    int? age = int.tryParse(_ageController.text.trim());

    if (name.isEmpty || age == null) {
      setState(() {
        _result = 'Vui lòng nhập đầy đủ thông tin!';
      });
      return;
    }

    String category;
    if (age > 65) {
      category = 'Người già';
    } else if (age >= 6 && age <= 65) {
      category = 'Người lớn';
    } else if (age >= 2 && age < 6) {
      category = 'Trẻ em';
    } else {
      category = 'Em bé';
    }

    setState(() {
      _result = '$name thuộc nhóm: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THỰC HÀNH 01'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Tuổi',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAge,
              child: const Text('Kiểm tra'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
