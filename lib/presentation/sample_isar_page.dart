import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/provider/todo_provider.dart';

class SampleIsarPage extends StatelessWidget {
  const SampleIsarPage({super.key});

  static const routeName = 'sample_isar_page';
  static const routePath = 'sample_isar_page';

  @override
  Widget build(BuildContext context) {
    /// 使い回すのでここでDataSourceを定義
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
                  print('データ一覧取得サンプルボタン押下');
                  context.read<TodoProvider>().getCollection();
                },
                child: const Text('データ一覧取得サンプル'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                print('データ単体取得サンプルボタン押下');
                context.read<TodoProvider>().getSingleCollection();
              },
              child: const Text('データ単体取得サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                print('データ追加ボタン押下');
                context.read<TodoProvider>().addTodoCollection();
              },
              child: const Text('データ登録サンプル'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                print('更新ボタン押下');
                context.read<TodoProvider>().updateCollection();
              },
              child: const Text('更新'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                print('データ削除サンプルボタン押下');
                context.read<TodoProvider>().deleteCollection();
              },
              child: const Text('データ削除サンプル'),
            ),
          ),
        ],
      ),
    );
  }
}
