import 'package:flutter/foundation.dart';
import 'package:flutter_task_3/todo_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarInstance {
  static final IsarInstance _singleton = IsarInstance._internal();

  Isar? _isar;

  IsarInstance._internal();

  factory IsarInstance() {
    return _singleton;
  }

  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      [
        TodoSchema,
      ],
      directory: kIsWeb ? '' : dir.path,
      inspector: true,
    );
  }

  Isar get isar => _isar!;

  IsarCollection<Todo> get todos => _isar!.collection<Todo>();
}
