import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/dummy/notification_dummies.dart';
import 'notification_item.dart';

class NotificationList extends HookConsumerWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children:
        notificationdummyList.map((e) => NotificationItem(e)).toList()
    );
  }
}
