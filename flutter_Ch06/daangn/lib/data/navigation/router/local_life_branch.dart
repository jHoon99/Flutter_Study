import 'package:fast_app_base/screen/main/tab/local_life/f_local_life.dart';
import 'package:go_router/go_router.dart';

import '../app_route.dart';

final localLifeBranch = StatefulShellBranch(routes: [
  GoRoute(
    path: AppRoute.localLife.path,
    builder: (_, __) => const LocalLifeFragment()
  ),
]);
