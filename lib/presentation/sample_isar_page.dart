import 'package:flutter/material.dart';
import 'package:flutter_task_3/data/data_source/todo_collection_data_source.dart';
import 'package:flutter_task_3/data/isar_collection/todo_collection.dart';

class SampleIsarPage extends StatelessWidget {
  const SampleIsarPage({super.key});

  static const routeName = 'sample_isar_page';
  static const routePath = 'sample_isar_page';

//   @override
//   State<SampleIsarPage> createState() => _SampleIsarPage();
// }

// class _SampleIsarPage extends State<SampleIsarPage> {
// //一覧のデータ呼び出し

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     //addPostFrameCallback：ウィジェットが画面にレンダリングされた後に1回だけ呼び出されるコールバック関数
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // build完了後の処理をここに書く
//       _fetchMemoData();
//     });
//   }

//   Future<void> _fetchMemoData() async {
//     await context.read<TodoCollectionDataSource>().fetchTodoList();
//   }

  @override
  Widget build(BuildContext context) {
    /// 使い回すのでここでDataSourceを定義
    final dataSource = TodoCollectionDataSource();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Isar Sample'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {
                  final todoList = await dataSource.fetchTodoList();
                  debugPrint(todoList.toString());
                  print('データ一覧取得サンプルボタン押下');
                },
                child: const Text('データ一覧取得サンプル'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                final todo = await dataSource.fetchTodoById(1);
                debugPrint(todo.toString());
                print('データ単体取得サンプルボタン押下');
              },
              child: const Text('データ単体取得サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                todoModel:
                final newTodo = Todo()
                  ..title = 'test'
                  ..description = 'test'
                  ..isCompleted = false
                  ..createdAt = DateTime.now()
                  ..updatedAt = DateTime.now();
                dataSource.setTodoData(todoModel: newTodo);
                print('データ登録サンプル押下');
              },
              child: const Text('データ登録サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                await dataSource.deleteTodoData(id: 1);
                print('データ削除サンプルボタン押下');
              },
              child: const Text('データ削除サンプル'),
            ),
          ),
        ],
      ),
    );
  }
}
