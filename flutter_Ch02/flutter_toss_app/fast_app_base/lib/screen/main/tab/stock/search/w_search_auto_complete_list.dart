import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nav/nav.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  final TextEditingController controller;
  SearchAutoCompleteList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.autoCompleteList.length,
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.stockName;
        return GestureDetector(
          onTap: () {
            controller.clear();
            searchData.addHistory(stock);
            Nav.push(StockDetailScreen(stockName: stockName,));
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(stockName),
          ),
        );
      },
    );
  }
}
