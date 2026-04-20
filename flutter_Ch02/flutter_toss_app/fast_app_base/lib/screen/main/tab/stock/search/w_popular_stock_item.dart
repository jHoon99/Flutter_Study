import 'package:fast_app_base/screen/main/tab/stock/vo/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem({super.key, required this.stock, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        spacing: 30,
        children: [
          Text('$number'),
          Text(stock.stockName),
          const Spacer(),
          Text(stock.todayPercentageString)
        ],
      ),
    );
  }
}
