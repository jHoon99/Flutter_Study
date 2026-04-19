import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notificationDummies = <TossNotification>[
  TossNotification(
    NotificationType.tossPay,
    '영화 한 편 때리자',
    DateTime.now().subtract(
      27.minutes,
    ),
    isRead: true,
  ),
  TossNotification(
    NotificationType.stock,
    '인적 분할에 대해 알려드림',
    DateTime.now().subtract(
      1.hours,
    ),
  ),
  TossNotification(
    NotificationType.walk,
    '1000걸음 이상 걸었다면 포인트 받아가라',
    DateTime.now().subtract(
      1.hours,
    ),
  ),
  TossNotification(
    NotificationType.moneyTip,
    '유럽 식품 물가가 치솟고 있어요\n남반석님, 유럽여행에 관심이 있따면 확인해보세요',
    DateTime.now().subtract(
      8.hours,
    ),
    isRead: true
  ),
  TossNotification(
    NotificationType.walk,
    '영화 한 편 때리자',
    DateTime.now().subtract(
      11.hours,
    ),
  ),
  TossNotification(
    NotificationType.luck,
    '영화 한 편 때리자',
    DateTime.now().subtract(
      12.hours,
    ),
    isRead: true
  ),
  TossNotification(
    NotificationType.people,
    '영화 한 편 때리자',
    DateTime.now().subtract(
      1.days,
    ),
  ),
];
