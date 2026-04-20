import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '인기 검색',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '오늘 ${DateTime.now().formattedTime} 기준',
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...popularStocklist
              .mapIndexed(
                (e, index) => PopularStockItem(stock: e, number: index + 1),
              )
              .toList()
        ],
      ),
    );
  }
}
