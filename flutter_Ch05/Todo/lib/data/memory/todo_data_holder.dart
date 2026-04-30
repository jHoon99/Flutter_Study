import 'package:fast_app_base/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

  void changeTodoStatus(todo) async {
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
    // notifier.notify(); InheritedWidget
    todoList.refresh();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      todoList.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime,
        ),
      );
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      todoList.refresh();
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
  }
}
