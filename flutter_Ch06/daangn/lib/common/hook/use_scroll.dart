import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screen/main/fab/w_floating_daangn_button.riverpod.dart';

ScrollController useScrollFab(WidgetRef ref) {
  final scrollController = useScrollController();

  useEffect(() {
    void onScroll() {
      final pixels = scrollController.position.pixels;
      final isSmall = ref.read(floatingButtonIsSmallProvider);
      if (pixels > 100 && !isSmall) {
        ref.read(floatingButtonIsSmallProvider.notifier).state = true;
      } else if (pixels <= 100 && isSmall) {
        ref.read(floatingButtonIsSmallProvider.notifier).state = false;
      }
    }

    scrollController.addListener(onScroll);
    return () => scrollController.removeListener(onScroll);
  }, [scrollController]);

  return scrollController;
}