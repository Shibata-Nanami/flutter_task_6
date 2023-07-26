import 'package:flutter/material.dart';
import 'package:flutter_task_3/data/isar_collection/todo_collection.dart';

import '../data_source/todo_collection_data_source.dart';

final dataSource = TodoCollectionDataSource();

class TodoProvider extends ChangeNotifier {
  Future<void> addTodoCollection() async {
    final newTodo = Todo()
      ..title = 'test'
      ..description = 'test'
      ..isCompleted = false
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    dataSource.setTodoData(todoModel: newTodo);
  }
}
