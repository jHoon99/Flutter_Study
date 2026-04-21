import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/f_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/s_setting.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(length: 2, vsync: this);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          actions: [
            ImageButton(
                onTap: () {
                  Nav.push(SearchFragment());
                },
                imagePath: '$basePath/icon/stock_search.png'),
            ImageButton(
                onTap: () {
                  context.showSnackbar('검색');
                },
                imagePath: '$basePath/icon/stock_calendar.png'),
            ImageButton(
                onTap: () {
                  Nav.push(SettingScreen());
                },
                imagePath: '$basePath/icon/stock_settings.png'),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabbar,
              currentIndex == 0 ? const MyStockFragment() : const TodayDiscoveryFragment(),
            ],
          ),
        )
      ],
    );
  }

  Widget get title => const Row(
        children: [
          Text(
            '토스증권',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'S&P500',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            '3919.29',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget get tabbar => Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            dividerColor: Colors.transparent,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 20),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: const [
              Text('내 주식'),
              Text('오늘의 발견'),
            ],
          ),
          const Line(),
        ],
      );
}

class ImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final String imagePath;

  const ImageButton({
    super.key,
    required this.onTap,
    this.width = 30,
    this.height = 30,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(imagePath, height: height, width: width),
    );
  }
}
