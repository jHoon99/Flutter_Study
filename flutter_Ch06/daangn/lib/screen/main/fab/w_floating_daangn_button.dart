import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingDaangnButton extends HookConsumerWidget {
  const FloatingDaangnButton({super.key});

  static const duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const isExpanded = true;
    final isExpanded = ref.watch(floatingButtonIsExpandedProvider);
    final isSmall = ref.watch(floatingButtonIsSmallProvider);

    return Stack(
      children: [
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: duration,
            color: isExpanded ? Colors.black.withValues(alpha: 0.4) : Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _menuButton(isExpanded, context.appColors.floatingActionLayer),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight + 16,
                  right: 16,
                ),
                child: _floatingButton(
                  isExpanded,
                  isSmall,
                  context.appColors.floatingActionLayer,
                  ref,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _floatingButton(
    bool isExpanded,
    bool isSmall,
    Color color,
    WidgetRef ref,
  ) {
    return Tap(
      onTap: () {
        final currentTab = ref.read(currentTabProvider);
        debugPrint('currentTab: $currentTab');
        ref.read(floatingButtonIsExpandedProvider.notifier).state = !isExpanded;
      },
      child: AnimatedContainer(
        duration: duration,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isExpanded ? color : const Color(0xffff791f),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedRotation(
              turns: isExpanded ? 0.125 : 0,
              duration: duration,
              child: const Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: AnimatedWidthCollapse(
                visible: !isSmall && !isExpanded,
                duration: duration,
                child: const Text('글쓰기', style: TextStyle(fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(bool isExpanded, Color color) {
    return IgnorePointer(
      ignoring: !isExpanded,
      child: AnimatedOpacity(
        opacity: isExpanded ? 1 : 0,
        duration: duration,
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 16, bottom: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            spacing: 10,
            children: [
              _floatingItem('알바', '$basePath/fab/fab_01.png'),
              _floatingItem('과외/클래스', '$basePath/fab/fab_02.png'),
              _floatingItem('농수산물', '$basePath/fab/fab_03.png'),
              _floatingItem('부동산', '$basePath/fab/fab_04.png'),
              _floatingItem('중고차', '$basePath/fab/fab_05.png'),
            ],
          ),
        ),
      ),
    );
  }

  _floatingItem(String title, String imagePath) {
    return Row(
      spacing: 8,
      children: [
        Image.asset(imagePath, width: 30, height: 30),
        Text(title),
      ],
    );
  }
}
