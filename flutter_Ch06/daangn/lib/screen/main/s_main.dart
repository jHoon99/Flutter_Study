import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:fast_app_base/screen/main/tab/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/common.dart';
import '../../common/dart/extension/num_duration_extension.dart';
import 'fab/w_floating_daangn_button.dart';
import 'w_menu_drawer.dart';

part 's_main.g.dart';

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  TabItem build() => TabItem.home;
}

class MainScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({required this.navigationShell, super.key});

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> with SingleTickerProviderStateMixin {


  bool get extendBody => true;
  int get _currentIndex => widget.navigationShell.currentIndex;

  static double get bottomNavigationBarBorderRadius => 30.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            extendBody: extendBody, //bottomNavigationBar 아래 영역 까지 그림
            body: Container(
              padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
              child: SafeArea(
                bottom: !extendBody,
                child: widget.navigationShell, // 현재 탭 화면
              ),
            ),
            bottomNavigationBar: _buildBottomNavigationBar(context),
          ),
          AnimatedOpacity(
            opacity: _currentIndex != 3 ? 1 : 0,
            duration: 150.ms,
            child: const FloatingDaangnButton(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: context.appColors.text,
          unselectedItemColor: context.appColors.iconButtonInactivate,
          onTap: (index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == _currentIndex,
            );
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: '동네생활'),
            BottomNavigationBarItem(icon: Icon(Icons.pin_drop_outlined), label: '내 근처'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: '나의 당근'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomItem(bool activate, IconData iconData, IconData inActivateIconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(label),
          activate ? iconData : inActivateIconData,
          color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: label);
  }

  void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop();
      }
    }
  }
}
