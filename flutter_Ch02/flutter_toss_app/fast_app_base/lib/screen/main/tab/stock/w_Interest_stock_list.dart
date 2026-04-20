import 'dart:math';

import 'package:fast_app_base/screen/main/tab/stock/stocks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/w_stock_item.dart';
import 'package:flutter/material.dart';

class InterestStockList extends StatelessWidget {
  const InterestStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
      child: Column(
        children: [
          ...myInterestStocks.map((e) => StockItem(e)).toList()
        ],
      ),
    );
  }
}
