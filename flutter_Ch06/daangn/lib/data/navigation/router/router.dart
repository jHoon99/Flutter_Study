import 'package:fast_app_base/data/navigation/app_route.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/chat/f_chat.dart';
import 'package:fast_app_base/screen/main/tab/home/f_home.dart';
import 'package:fast_app_base/screen/main/tab/local_life/f_local_life.dart';
import 'package:fast_app_base/screen/main/tab/my/f_my.dart';
import 'package:fast_app_base/screen/main/tab/near_me/f_near_me.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:go_router/go_router.dart';

import '../../../screen/main/tab/home/post_detail/s_post_detail.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // 탭 화면들
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => MainScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoute.home.path, builder: (_, __) => const HomeFragment()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoute.localLife.path, builder: (_, __) => const LocalLifeFragment()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoute.nearMe.path, builder: (_, __) => const NearMeFragmnet()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoute.chat.path, builder: (_, __) => const ChatFragment()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: AppRoute.my.path, builder: (_, __) => const MyFragment()),
        ]),
      ],
    ),

    // 전체 화면들 (탭바 X)
    GoRoute(
      path: '/notification',
      builder: (_, __) => const NotificationScreen(),
    ),
    GoRoute(
      path: '/post-detail/:id',
      builder: (_, state) {
        final id = int.parse(state.pathParameters['id']!);
        final post = state.extra as SimpleProductPost;
        return PostDetailScreen(id: id, simpleProductPost: post);
      },
    ),
  ],
);
