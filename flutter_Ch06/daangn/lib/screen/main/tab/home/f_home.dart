import 'dart:math';

import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/tab/home/w_product_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/hook/use_scroll.dart';
import '../../../../common/widget/w_line.dart';
import '../../../../entity/dummy/dummy.dart';

class HomeFragment extends HookConsumerWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollFab(ref);
    final name = useState('플러터');

    return Column(
      children: [
        AppBar(
          title: PopupMenuButton<String>(
            onSelected: (value) {
              name.value = value;
            },
            child: Text(name.value),
            itemBuilder: (BuildContext context) => ['다트', '다트동']
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) => ProductPostItem(postList[index]),
            itemCount: postList.length,
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Line(),
            ),
          ),
        ),
      ],
    );
  }
}
