import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final listProvider = StateProvider((ref) => ['grave', 'freed', 'ghghgh']);

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}
