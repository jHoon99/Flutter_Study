import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../entity/notification/vo_notification.dart';

part 'notification_provider.g.dart';

// final remoteNotificationProvider = FutureProvider((ref) async {
//   final result = await DaangnApi.getNotification();
//   return result.successData;
// });
//
// final notificationProvider = StateProvider<List<DaangnNotification>>((ref) {
//   final list = ref.watch(remoteNotificationProvider);
//   if(list.hasValue) {
//     return list.requireValue;
//   }
//   return [];
// });

@riverpod
class NotificationList extends _$NotificationList {
  @override
  Future<List<DaangnNotification>> build() async {
    final result = await DaangnApi.getNotification();
    return result.successData;
  }

  void remove(DaangnNotification item) {
    final current = state.value ?? [];
    state = AsyncData(current.where((e) => e != item).toList());
  }
}