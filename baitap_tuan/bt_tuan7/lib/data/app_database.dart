import 'dart:async';
import 'package:floor/floor.dart';
import '../models/task.dart';
import 'task_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // sẽ được tạo bằng lệnh build_runner

@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
