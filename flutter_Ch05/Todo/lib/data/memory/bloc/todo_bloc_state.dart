import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'bloc_status.dart';

part 'todo_bloc_state.freezed.dart';
// flutter pub run build_runner build

@freezed
class TodoBlocState with _$TodoBlocState {
  const factory TodoBlocState({
    required BlocStatus status,
    required List<Todo> todoList,
  }) = _TodoBlocState;
}