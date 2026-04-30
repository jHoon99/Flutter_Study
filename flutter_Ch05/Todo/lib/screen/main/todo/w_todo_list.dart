import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/todo/w_todo_item.dart';
import 'package:flutter/material.dart';

import '../../../data/memory/todo_data_holder.dart';

class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => todoData.todoList.isEmpty
          ? const Expanded(
              child: Center(
                child: Text(
                  '할 일을 작성해 보세요.',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            )
          : Column(
              children: todoData.todoList.map((e) => TodoItem(e)).toList(),
            ),
    );
  }
}
