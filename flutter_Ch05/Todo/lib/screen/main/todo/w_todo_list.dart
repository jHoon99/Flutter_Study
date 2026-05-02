import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/screen/main/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/memory/todo_data_holder.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoBlocState>(
      builder: (context, state) {
        return state.todoList.isEmpty
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
                children: state.todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
