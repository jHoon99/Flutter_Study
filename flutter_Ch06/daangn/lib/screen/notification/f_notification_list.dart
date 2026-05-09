import 'package:fast_app_base/screen/notification/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/dummy/notification_dummies.dart';
import 'notification_item.dart';

class NotificationList extends HookConsumerWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(notificationListProvider);

    return notification.when(
      data: (list) => ListView(
        children: list.map((e) => NotificationItem(e)).toList(),
      ),
      error: (e, _) => const Text('에러'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
