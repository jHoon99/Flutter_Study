import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';

class TossAppBar extends StatefulWidget {
  const TossAppBar({super.key});

  @override
  State<TossAppBar> createState() => _TossAppBarState();
}

class _TossAppBarState extends State<TossAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: context.appColors.appBarBackground,
      child: Row(spacing: 10, children: [
        Image.asset(
          '$basePath/icon/toss.png',
          height: 30,
        ),
        const Spacer(),
        Image.asset(
          '$basePath/icon/map_point.png',
          height: 30,
        ),
        Tap(
          onTap: () {
            // 알림화면 이동
            Nav.push(const NotificationScreen());
          },
          child: Stack(children: [
            Image.asset(
              '$basePath/icon/notification.png',
              height: 30,
            ),
            if (_showRedDot)
              Positioned.fill(
                  child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ),
              ))
          ]),
        ),
      ]),
    );
  }
}
