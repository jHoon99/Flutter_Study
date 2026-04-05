import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/screen/new_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, _) => const HomeWidget(),
          ),
          GoRoute(
            path: '/new',
            name: 'new',
            builder: (context, _) => const NewPage(),
          ),
          GoRoute(
            path: '/new1',
            name: 'new1',
            builder: (context, _) => const NewPage(),
          ),
        ],
      ),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter에서 화면 이동하기'),
      ),
      body: homeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, semanticLabel: '검색'),
            label: '검색',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person, semanticLabel: '마이페이지'),
            label: '마이페이지',
          ),
        ],
        currentIndex: index,
        onTap: (newIndex) => setState(() {
          index = newIndex;
        }),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 1:
        return Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return Center(
          child: Icon(Icons.person, size: 100),
        );
      case 0:
        return Home1();
      default:
        return Center(
          child: Icon(
            Icons.home,
            size: 100,
          ),
        );
    }
  }
}

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => context.pushNamed('new'),
        child: Text('Go to Page'),
      ),
    );
  }
}

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter에서 화면 이동하기'),
      ),
      body: homeBody(),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: '홈'),
          NavigationDestination(icon: Icon(Icons.search), label: '검색'),
          NavigationDestination(icon: Icon(Icons.person), label: '마이 페이지'),
        ],
        selectedIndex: index,
        onDestinationSelected: (newIndex) => setState(() => index = newIndex),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 1:
        return Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return Center(
          child: Icon(Icons.person, size: 100),
        );
      case 0:
      default:
        return Center(
          child: Icon(
            Icons.home,
            size: 100,
          ),
        );
    }
  }
}
