import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entity/notification/vo_notification.dart';

final remoteNotificationProvider = FutureProvider((ref) async {
  final result = await DaangnApi.getNotification();
  return result.successData;
});

final notificationProvider = StateProvider<List<DaangnNotification>>((ref) {
  final list = ref.watch(remoteNotificationProvider);
  if(list.hasValue) {
    return list.requireValue;
  }
  return [];
});