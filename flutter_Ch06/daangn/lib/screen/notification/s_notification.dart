import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'f_notification_list.dart';

part 's_notification.g.dart';

@riverpod
class EditMode extends _$EditMode {
  @override
  bool build() => false;
}

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final editMode = useState(false); notificationItem에서 사용해야해서 riverpod 전환
    final isEditMode = ref.watch(editModeProvider);

    final tabController = useTabController(initialLength: 2);

    return Column(
      children: [
        AppBar(
          title: const Text('알림'),
          actions: [
            Tap(
              onTap: () {
                ref.read(editModeProvider.notifier).state = !isEditMode;
                // final isEditMode = editMode.value;
                // editMode.value = !isEditMode;
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(isEditMode ? '완료' : '편집'),
              ),
            ),
          ],
        ),
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: '활동 알림'),
            Tab(text: '키워드 알림'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelPadding: const EdgeInsets.symmetric(vertical: 20),
          indicatorColor: Colors.white,
          overlayColor: WidgetStateProperty.all(Colors.transparent) // 탭바는 따로 또 제거해야함
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              NotificationList(),
              Container(color: Colors.red),
            ],
          ),
        )
      ],
    );
  }
}
