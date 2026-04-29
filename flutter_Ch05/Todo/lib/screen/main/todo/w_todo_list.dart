import 'dart:math';

import 'package:fast_app_base/screen/main/todo/w_todo_item.dart';
import 'package:flutter/material.dart';

import '../../../data/memory/todo_data_holder.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TodoDataHolder.of(context).notifier,
      builder: (context, todoList, child) {
        return todoList.isEmpty
            ? const Text(
                '할 일을 작성해 보세요.',
                style: TextStyle(
                  fontSize: 32,
                ),
              )
            : Column(
                children: todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
