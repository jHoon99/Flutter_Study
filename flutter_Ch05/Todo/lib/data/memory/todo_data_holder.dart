import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TodoCubit extends Cubit<TodoBlocState> {
  // final RxList<Todo> todoList = <Todo>[].obs;

  TodoCubit() : super(const TodoBlocState(status: BlocStatus.initial, todoList: <Todo>[]));

  void changeTodoStatus(todo) async {
    final oldTodoList = List.of(state.todoList);
    final todoIndex = oldTodoList.indexWhere((e) => e.id == todo.id);

    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.inComplete:
        status = TodoStatus.onGoing;
      case TodoStatus.onGoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          status = TodoStatus.inComplete;
        });
    }
    oldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(oldTodoList);
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      final oldTodoList = List.of(state.todoList); // bloc은 add를 사용할 수 없기에 List로 한 번 감싸줌
      oldTodoList.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime,
          createdTime: DateTime.now(),
          status: TodoStatus.inComplete,
        ),
      );
      emitNewList(oldTodoList);
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {

      final oldTodoList = List<Todo>.from(state.todoList);
      oldTodoList[oldTodoList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );
      emitNewList(oldTodoList);
    }
  }

  void removeTodo(Todo todo) {
    final oldTodoList = List<Todo>.from(state.todoList);
    oldTodoList.removeWhere((e) => e.id == todo.id);
    emitNewList(oldTodoList);
  }

  void emitNewList(List<Todo> oldTodoList) => emit(state.copyWith(todoList: oldTodoList));
}
