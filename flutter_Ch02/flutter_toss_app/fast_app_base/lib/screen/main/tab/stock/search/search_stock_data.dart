import 'dart:math';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

import '../../../../../common/util/local_json.dart';
import '../vo/vo_simple_stock.dart';

mixin SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<dynamic> searchHistoryList = [].obs;
  RxList<dynamic> autoCompleteList = [].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['AJ네트웍스', 'AK홀딩스', 'APS홀딩스']);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    try {
      final jsonList = await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
      print('로딩 성공: ${jsonList.length}개');
      stocks.addAll(jsonList);
    } catch (e) {
      print('에러: $e');
    }
  }

  void search(String keyword) {
    if(keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks.where((e) => e.stockName.contains(keyword)).toList();
    print(autoCompleteList.toString());
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.stockName);
  }
}
