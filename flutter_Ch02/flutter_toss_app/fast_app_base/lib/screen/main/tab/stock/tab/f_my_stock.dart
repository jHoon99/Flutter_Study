import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';
import '../../../../../common/widget/w_line.dart';
import '../../../../../common/widget/w_long_button.dart';
import '../w_Interest_stock_list.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          account,
          const SizedBox(height: 20,),
          LongButton(title: '주문내역', onTap: () {  },),
          LongButton(title: '판매수익', onTap: () {  },),
          getMyStock,
          const InterestStockList()
        ],
      ),
    );
  }

  Widget get account => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.black12,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('계좌'),
            Row(
              children: [
                Text(
                  '443원',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Arrow(),
                Spacer(),
                RoundedContainer(
                  radius: 8,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  backgroundColor: Colors.red,
                  child: Text(
                    '채우기',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Line(),
            )
          ],
        ),
      );

  Widget get getMyStock => Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 30,
        children: [
          const Row(
            children: [
              Text('관심 주식', style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              Text('편집하기')
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              print('dd');
            },
            child: const Row(
              children: [
                Text('기본'),
                Spacer(),
                Arrow(direction: AxisDirection.up,)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
