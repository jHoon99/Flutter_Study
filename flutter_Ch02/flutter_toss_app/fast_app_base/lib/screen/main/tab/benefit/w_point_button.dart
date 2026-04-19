import 'package:flutter/material.dart';

import '../../../../common/widget/w_arrow.dart';

class PointButton extends StatelessWidget {
  final int point;

  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const Text(
            '내 포인트',
            style: TextStyle(color: Colors.white),
          ),
          const Spacer(),
          Text(
            '$point 원',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          const Arrow()
        ],
      ),
    );
  }
}
