import 'package:fast_app_base/screen/main/tab/stock/stock_data_transformatter.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockDataTransformatter {
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock(
      {required String stockName, required this.yesterdayClosePrice, required this.currentPrice}
      ) : super(stockName);
}