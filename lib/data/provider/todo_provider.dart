import 'package:flutter/material.dart';
import 'package:flutter_task_3/data/isar_collection/todo_collection.dart';
import '../data_source/todo_collection_data_source.dart';

final dataSource = TodoCollectionDataSource();

class TodoProvider extends ChangeNotifier {
  ///データ一覧取得
  Future<void> getCollection() async {
    final todoList = await dataSource.fetchTodoList();
    debugPrint(todoList.toString());
  }

  ///データ単体取得
  Future<void> getSingleCollection() async {
    final todo = await dataSource.fetchTodoById(1);
    debugPrint(todo.toString());
  }

  ///データ追加
  Future<void> addTodoCollection() async {
    final newTodo = Todo()
      ..title = 'test'
      ..description = 'test'
      ..isCompleted = false
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    dataSource.setTodoData(todoModel: newTodo);
  }

  ///データ更新
  Future<void> updateCollection() async {
    final todo1 = await dataSource.fetchTodoById(1);
    if (todo1 == null) {
      return;
    }
    // オブジェクトを上書きしていく
    todo1
      ..title = 'debug'
      ..description = 'debug'
      ..isCompleted = true
      ..updatedAt = DateTime.now();
    dataSource.setTodoData(todoModel: todo1);
  }

  ///データ削除
  Future<void> deleteCollection() async {
    await dataSource.deleteTodoData(id: 1);
  }
}
