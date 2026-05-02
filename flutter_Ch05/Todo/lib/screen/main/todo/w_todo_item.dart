import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/data/memory/todo_event.dart';
import 'package:fast_app_base/screen/main/todo/w_todo_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/dart/extension/context_extension.dart';
import '../../../data/memory/vo_todo.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      background: const RoundedContainer(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                EvaIcons.trash2Outline,
                color: Colors.white,
              )
            ],
          )),
      secondaryBackground: const RoundedContainer(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.trash2Outline,
                color: Colors.white,
              )
            ],
          )),
      onDismissed: (direction) {
        ref.readTodoHolder.removeTodo(todo);
      },
      key: ValueKey(todo.id),
      child: RoundedContainer(
          color: context.appColors.itemBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(todo.dueDate.toString()),
              Row(
                children: [
                  TodoStatusWidget(todo),
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        ref.readTodoHolder.changeTodoStatus(todo);
                      },
                      icon: const Icon(EvaIcons.editOutline))
                ],
              ),
            ],
          )),
    );
  }
}
