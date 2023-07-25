import 'package:flutter/material.dart';
import 'package:flutter_task_3/data/dara_source/todo_collection_data_source.dart';
import 'package:flutter_task_3/data/isar_collection/todo_collection.dart';

class SampleIsarPage extends StatelessWidget {
  const SampleIsarPage({super.key});

  static const routeName = 'sample_isar_page';
  static const routePath = 'sample_isar_page';

  @override
  Widget build(BuildContext context) {
    /// 使い回すのでここでDataSourceを定義
    final dataSource = TodoCollectionDataSource();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Isar Sample'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                final todoList = await dataSource.fetchTodoList();
                debugPrint(todoList.toString());
              },
              child: const Text('データ一覧取得サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                final todo = await dataSource.fetchTodoById(1);
                debugPrint(todo.toString());
              },
              child: const Text('データ一覧取得サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                // 引数にTodoモデルを渡す
                await dataSource.setTodoData(
                  todoModel: Todo(
                    title: 'サンプルタイトル',
                    description: 'サンプル説明文',
                    isCompleted: false,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ),
                );
              },
              child: const Text('データ登録サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                await dataSource.deleteTodoData(id: 1);
              },
              child: const Text('データ削除サンプル'),
            ),
          ),
        ],
      ),
    );
  }
}
