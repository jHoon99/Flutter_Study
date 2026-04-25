import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TossAppBar extends StatefulWidget {
  const TossAppBar({super.key});

  @override
  State<TossAppBar> createState() => _TossAppBarState();
}

class _TossAppBarState extends State<TossAppBar> {
  final bool _showRedDot = false;
  int _tappingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: context.appColors.appBarBackground,
      child: Row(spacing: 10, children: [
        // AnimatedContainer(
        //   duration: 1000.ms,
        //   curve: Curves.decelerate,
        //   height: _tappingCount > 1 ? 60 : 30,
        //   child: Image.asset(
        //     '$basePath/icon/toss.png',
        //     // height: 30,
        //   ),
        // ),
        AnimatedCrossFade(
          firstChild: Image.asset(
            '$basePath/icon/toss.png',
            height: 30,
          ),
          secondChild: Image.asset(
          '$basePath/icon/map_point.png',
          height: 30,
        ),
          crossFadeState: _tappingCount < 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: 1500.ms,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() => _tappingCount++),
          child: Image.asset(
            '$basePath/icon/map_point.png',
            height: 30,
          ),
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
          ])
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shake(duration: 2000.ms, hz: 3)
              .then()
              .fadeOut(duration: 1000.ms),
        ),
      ]),
    );
  }
}
