import 'package:isar/isar.dart';

part 'todo_collection.g.dart';

@Collection()
class Todo {
  Todo({
    required this.title,
    required this.description,
    this.isCompleted = false, // 初期値を設定している
    required this.createdAt,
    required this.updatedAt,
  });
  Id id = Isar.autoIncrement;

  late String title;

  late String description;

  late bool isCompleted;

  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;
}
