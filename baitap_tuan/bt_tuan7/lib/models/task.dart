import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id; // id tự tăng

  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});
}
