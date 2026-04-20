import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_stock.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Colors.grey,
      child: Row(
        spacing: 10,
        children: [
          Image.asset(
            stock.stockImagePath,
            width: 50,
          ),
          Text(
            stock.stockName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(stock.todayPercentageString),
              Text('${stock.currentPrice}원'),
            ],
          )
        ],
      ),
    );
  }
}
