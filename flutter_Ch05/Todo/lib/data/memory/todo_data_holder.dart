import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_event.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  // final RxList<Todo> todoList = <Todo>[].obs;

  TodoDataHolder() : super(<Todo>[]);

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.inComplete:
        todo.status = TodoStatus.onGoing;
      case TodoStatus.onGoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.inComplete;
        });
    }
    state = List.of(state); // 기존 Getx에서 refresh() 헀던것과 동일
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      state.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime,
        ),
      );
      state = List.of(state);
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      state = List.of(state);
    }
  }

  void removeTodo(Todo todo) {
    state.remove(todo);
    state = List.of(state);
  }
}

extension TodoListHolderProvider on WidgetRef {
  TodoDataHolder get readTodoHolder => read(todoDataProvider.notifier);
}