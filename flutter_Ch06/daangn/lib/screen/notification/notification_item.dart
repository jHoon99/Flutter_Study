import 'package:fast_app_base/entity/notification/vo_notification.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/common.dart';

class NotificationItem extends HookConsumerWidget {
  final DaangnNotification notification;

  const NotificationItem(this.notification, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = ref.watch(editMode);

    return Tap(
      onTap: () {},
      child: Container(
        color: notification.isRead ? context.backgroundColor : Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Image.asset(
              notification.type.iconPath,
              scale: 2,
            ),
            _content,
            if (isEditMode)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              )
          ],
        ),
      ),
    );
  }

  Widget get _content {
    return Expanded(
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.title),
          Text(notification.description, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Text(notification.time.toString(), style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
