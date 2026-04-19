import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


class NotificationItemWidget extends StatefulWidget {
  final TossNotification notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: widget.notification.isRead ? context.backgroundColor : Colors.blueGrey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(widget.notification.type.iconPath, width: 25,),
                Text(widget.notification.type.name, style: const TextStyle(fontSize: 12, color: Colors.black),),
                const Spacer(),
                Text(timeago.format(widget.notification.time, locale: context.locale.languageCode))
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 25,),
                Text(widget.notification.description)
              ],
            )
          ],
        ),
      ),
    );
  }
}
