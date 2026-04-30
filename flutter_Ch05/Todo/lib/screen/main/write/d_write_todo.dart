import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/write/vo_write_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../../common/common.dart';
import '../../../data/memory/vo_todo.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  final Todo? todoForEdit;

  WriteTodoDialog({this.todoForEdit, super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> {
  DateTime _selectedData = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  void initState() {
    if (widget.todoForEdit != null) {
     _selectedData = widget.todoForEdit!.dueDate;
     textController.text = widget.todoForEdit!.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '할 일을 작성해주세요.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(_selectedData.formattedDate),
                IconButton(
                  onPressed: () {
                    _selectDate();
                  },
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  focusNode: node,
                  controller: textController,
                  autofocus: true,
                )),
                RoundButton(
                  text: isEditMode ? '완료' : '추가',
                  onTap: () {
                    widget.hide(WriteTodoResult(dateTime: _selectedData, text: textController.text));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool get isEditMode => widget.todoForEdit != null;

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedData,
      firstDate: DateTime.now().subtract(
        const Duration(days: 365),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 10),
      ),
    );
    if (date != null) {
      setState(() {
        _selectedData = date;
      });
    }
  }
}
