import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/hook/use_scroll.dart';

class LocalLifeFragment extends HookConsumerWidget {
  const LocalLifeFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollFab(ref);



    return ListView(
      controller: scrollController,
      children: [
        Container(height: 500, color: Colors.orange),
        Container(height: 500, color: Colors.green),
        Container(height: 500, color: Colors.blue),
        Container(height: 500, color: Colors.purple),
      ],
    );
  }
}