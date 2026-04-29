import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/todo/w_todo_status.dart';
import 'package:flutter/material.dart';

import '../../../common/dart/extension/context_extension.dart';
import '../../../data/memory/vo_todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
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
                IconButton(onPressed: () async {}, icon: const Icon(EvaIcons.editOutline))
              ],
            ),
          ],
        ));
  }
}
