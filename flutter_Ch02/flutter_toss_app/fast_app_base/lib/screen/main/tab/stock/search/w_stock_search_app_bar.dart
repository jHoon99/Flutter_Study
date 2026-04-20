import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../../common/widget/w_arrow.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const StockSearchAppBar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Arrow(
                direction: AxisDirection.left,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(letterSpacing: 1.2),
                  decoration: InputDecoration(
                    hintText: "'커피'를 검색해보세요.",
                    contentPadding: const EdgeInsets.only(top: 10),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => {controller.clear()},
                    ),
                  ),
                  onEditingComplete: () {
                    print('dd');
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
