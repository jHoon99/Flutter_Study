import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BigButton(this.text, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: const RoundedContainer(
        child: Row(
          children: [
            Text(
              '토스뱅크',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
