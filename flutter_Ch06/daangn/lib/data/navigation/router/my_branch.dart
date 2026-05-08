import 'package:fast_app_base/screen/main/tab/my/f_my.dart';
import 'package:go_router/go_router.dart';

import '../app_route.dart';

final myBranch = StatefulShellBranch(routes: [
  GoRoute(
      path: AppRoute.my.path,
      builder: (_, __) => const MyFragment()
  ),
]);
