import 'package:fast_app_base/data/navigation/app_route.dart';
import 'package:fast_app_base/screen/main/tab/home/f_home.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:go_router/go_router.dart';

final homeBranch = StatefulShellBranch(routes: [
  GoRoute(
    path: AppRoute.home.path,
    builder: (_, __) => const HomeFragment(),
    routes: [
      GoRoute(
        path: AppRoute.notification.path,
        builder: (_, __) => NotificationScreen(),
      ),
    ],
  ),
]);
