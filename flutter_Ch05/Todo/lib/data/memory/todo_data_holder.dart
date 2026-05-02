import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_event.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  // final RxList<Todo> todoList = <Todo>[].obs;

  TodoBloc() : super(const TodoBlocState(status: BlocStatus.initial, todoList: <Todo>[])) {
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemoveEvent>(_removeTodo);
  }

  void _changeTodoStatus(TodoStatusUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final oldTodoList = List.of(state.todoList);
    final todo = event.updatedTodo;
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
    emitNewList(oldTodoList, emit);
  }

  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
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
      emitNewList(oldTodoList, emit);
    }
  }

  void _editTodo(TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.updatedTodo;
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {

      final oldTodoList = List<Todo>.from(state.todoList);
      oldTodoList[oldTodoList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );
      emitNewList(oldTodoList, emit);
    }
  }

  void _removeTodo(TodoRemoveEvent event, Emitter<TodoBlocState> emit) {
    final oldTodoList = List<Todo>.from(state.todoList);
    final todo = event.removedTodo;
    oldTodoList.removeWhere((e) => e.id == todo.id);
    emitNewList(oldTodoList, emit);
  }

  void emitNewList(List<Todo> oldTodoList, Emitter<TodoBlocState> emit) {
    emit(state.copyWith(todoList: oldTodoList));
  }
}
