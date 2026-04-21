import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';

class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({super.key});

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList> with SearchStockDataProvider {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Obx(
        () => ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), scrollDirection: Axis.horizontal, itemCount: searchData.searchHistoryList.length, itemBuilder: (context, index) => _historyItem(index)),
      ),
    );
  }

  Widget _historyItem(int index) {
    final stockName = searchData.searchHistoryList[index];
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.red,
      ),
      child: Row(
        spacing: 4,
        children: [
          _stockItem(stockName),
          _iconItem(index),
        ],
      ),
    );
  }

  Widget _stockItem(String stockName) => GestureDetector(
        onTap: () {
          Nav.push(StockDetailScreen(stockName: stockName));
        },
        child: Text(
          stockName.toString(),
        ),
      );

  Widget _iconItem(int index) => GestureDetector(
        onTap: () {
          searchData.searchHistoryList.removeAt(index);
        },
        child: const Icon(Icons.close),
      );
}
