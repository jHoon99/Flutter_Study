import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../data/memory/todo_status.dart';
import '../../../data/memory/vo_todo.dart';

class TodoStatusWidget extends StatefulWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  State<TodoStatusWidget> createState() => _TodoStatusWidgetState();
}

class _TodoStatusWidgetState extends State<TodoStatusWidget> {
  static File? _cachedFile;

  RiveWidgetController? _controller;
  bool _riveReady = false;

  @override
  void initState() {
    super.initState();
    _loadRive();
  }

  void _loadRive() async {
    if (_cachedFile == null) {
      _cachedFile = await File.asset(
        'assets/rive/fire_button.riv',
        riveFactory: Factory.rive,
      );
    }
    if (_cachedFile != null && mounted) {
      _controller = RiveWidgetController(_cachedFile!);
      setState(() => _riveReady = true);
    }
  }

  void _resetController() {
    _controller?.dispose();
    if (_cachedFile != null) {
      _controller = RiveWidgetController(_cachedFile!);
    }
  }

  @override
  void didUpdateWidget(covariant TodoStatusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.todo.status == TodoStatus.onGoing &&
        oldWidget.todo.status != TodoStatus.onGoing) {
      _resetController();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        context.readTodoCubit.changeTodoStatus(widget.todo);
      },
      child: SizedBox(
          width: 50,
          height: 50,
          child: switch (widget.todo.status) {
            TodoStatus.complete => Checkbox(
                value: true,
                onChanged: null,
                fillColor: WidgetStatePropertyAll(
                  context.appColors.checkBoxColor,
                ),
              ),
            TodoStatus.inComplete => const Checkbox(value: false, onChanged: null),
            TodoStatus.onGoing => _riveReady
                ? RiveWidget(
                    controller: _controller!,
                    fit: Fit.cover,
                  )
                : const SizedBox(),
          }),
    );
  }
}
