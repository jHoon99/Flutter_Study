import 'package:fast_app_base/screen/main/tab/benefit/vo/vo_benefit.dart';
import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;

  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Image.asset(benefit.imagePath, width: 50, height: 50,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(benefit.subTitle),
            Text(benefit.title)
          ],
        )
      ],
    );
  }
}
